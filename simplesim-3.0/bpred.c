/* bpred.c - branch predictor routines */

/* SimpleScalar(TM) Tool Suite
 * Copyright (C) 1994-2003 by Todd M. Austin, Ph.D. and SimpleScalar, LLC.
 * All Rights Reserved. 
 * 
 * THIS IS A LEGAL DOCUMENT, BY USING SIMPLESCALAR,
 * YOU ARE AGREEING TO THESE TERMS AND CONDITIONS.
 * 
 * No portion of this work may be used by any commercial entity, or for any
 * commercial purpose, without the prior, written permission of SimpleScalar,
 * LLC (info@simplescalar.com). Nonprofit and noncommercial use is permitted
 * as described below.
 * 
 * 1. SimpleScalar is provided AS IS, with no warranty of any kind, express
 * or implied. The user of the program accepts full responsibility for the
 * application of the program and the use of any results.
 * 
 * 2. Nonprofit and noncommercial use is encouraged. SimpleScalar may be
 * downloaded, compiled, executed, copied, and modified solely for nonprofit,
 * educational, noncommercial research, and noncommercial scholarship
 * purposes provided that this notice in its entirety accompanies all copies.
 * Copies of the modified software can be delivered to persons who use it
 * solely for nonprofit, educational, noncommercial research, and
 * noncommercial scholarship purposes provided that this notice in its
 * entirety accompanies all copies.
 * 
 * 3. ALL COMMERCIAL USE, AND ALL USE BY FOR PROFIT ENTITIES, IS EXPRESSLY
 * PROHIBITED WITHOUT A LICENSE FROM SIMPLESCALAR, LLC (info@simplescalar.com).
 * 
 * 4. No nonprofit user may place any restrictions on the use of this software,
 * including as modified by the user, by any other authorized user.
 * 
 * 5. Noncommercial and nonprofit users may distribute copies of SimpleScalar
 * in compiled or executable form as set forth in Section 2, provided that
 * either: (A) it is accompanied by the corresponding machine-readable source
 * code, or (B) it is accompanied by a written offer, with no time limit, to
 * give anyone a machine-readable copy of the corresponding source code in
 * return for reimbursement of the cost of distribution. This written offer
 * must permit verbatim duplication by anyone, or (C) it is distributed by
 * someone who received only the executable form, and is accompanied by a
 * copy of the written offer of source code.
 * 
 * 6. SimpleScalar was developed by Todd M. Austin, Ph.D. The tool suite is
 * currently maintained by SimpleScalar LLC (info@simplescalar.com). US Mail:
 * 2395 Timbercrest Court, Ann Arbor, MI 48105.
 * 
 * Copyright (C) 1994-2003 by Todd M. Austin, Ph.D. and SimpleScalar, LLC.
 */


#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <assert.h>

#include "host.h"
#include "misc.h"
#include "machine.h"
#include "bpred.h"

/* turn this on to enable the SimpleScalar 2.0 RAS bug */
/* #define RAS_BUG_COMPATIBLE */

/* max and min weight based on number of total bits */
#define MAX_WEIGHT(weight_size)   ((1<<((weight_size)-1))-1)
#define MIN_WEIGHT(weight_size)   (-((MAX_WEIGHT(weight_size))+1))

/* threshold for perceptron training, defined in the original research paper */
#define THETA(history_size)    ((int) (1.93 * (history_size) + 14))

/********************************************************************/

/* create a branch predictor */
struct bpred_t *      /* branch predictory instance */
bpred_create(enum bpred_class class,  /* type of predictor to create */
       unsigned int bimod_size, /* bimod table size */
       unsigned int l1size, /* 2lev l1 table size. For perceptrons, it's the number of perceptrons */
       unsigned int l2size, /* 2lev l2 table size */
       unsigned int meta_size,  /* meta table size */
       unsigned int shift_width,  /* history register width. For perceptrons, it's the width of th eperceptron */
       unsigned int xor,    /* history xor address flag */
       unsigned int btb_sets, /* number of sets in BTB */ 
       unsigned int btb_assoc,  /* BTB associativity */
       unsigned int retstack_size) /* num entries in ret-addr stack */
{
  struct bpred_t *pred;

  if (!(pred = calloc(1, sizeof(struct bpred_t))))
    fatal("out of virtual memory");

  pred->class = class;

  switch (class) {
  case BPredComb:
    /* bimodal component */
    pred->dirpred.bimod = 
      bpred_dir_create(BPred2bit, bimod_size, 0, 0, 0);

    /* 2-level component */
    pred->dirpred.twolev = 
      bpred_dir_create(BPred2Level, l1size, l2size, shift_width, xor);

    /* metapredictor component */
    pred->dirpred.meta = 
      bpred_dir_create(BPred2bit, meta_size, 0, 0, 0);

    break;

  case BPred2Level:
    pred->dirpred.twolev = 
      bpred_dir_create(class, l1size, l2size, shift_width, xor);

    break;
  
  case BPredPerceptron:
  case BPredGGH:
    // Create our perceptron predictor. 
    pred->dirpred.perceptron = bpred_dir_create(class,l1size,l2size/* # of weight bits in this case */, shift_width, xor);
    break;

  case BPred2bit:
    pred->dirpred.bimod = 
      bpred_dir_create(class, bimod_size, 0, 0, 0);

  case BPredTaken:
  case BPredNotTaken:
    /* no other state */
    break;
  default:
    panic("bogus predictor class");
  }
  /* allocate ret-addr stack */
  switch (class) {
  case BPredComb:
  case BPred2Level:
  case BPred2bit:
  case BPredPerceptron:
  case BPredGGH:
    {
      int i;

      /* allocate BTB */
      if (!btb_sets || (btb_sets & (btb_sets-1)) != 0)
  fatal("number of BTB sets must be non-zero and a power of two");
      if (!btb_assoc || (btb_assoc & (btb_assoc-1)) != 0)
  fatal("BTB associativity must be non-zero and a power of two");

      if (!(pred->btb.btb_data = calloc(btb_sets * btb_assoc,
          sizeof(struct bpred_btb_ent_t))))
  fatal("cannot allocate BTB");

      pred->btb.sets = btb_sets;
      pred->btb.assoc = btb_assoc;

      if (pred->btb.assoc > 1)
  for (i=0; i < (pred->btb.assoc*pred->btb.sets); i++)
    {
      if (i % pred->btb.assoc != pred->btb.assoc - 1)
        pred->btb.btb_data[i].next = &pred->btb.btb_data[i+1];
      else
        pred->btb.btb_data[i].next = NULL;
      
      if (i % pred->btb.assoc != pred->btb.assoc - 1)
        pred->btb.btb_data[i+1].prev = &pred->btb.btb_data[i];
    }

      /* allocate retstack */
      if ((retstack_size & (retstack_size-1)) != 0)
  fatal("Return-address-stack size must be zero or a power of two");
      
      pred->retstack.size = retstack_size;
      if (retstack_size)
  if (!(pred->retstack.stack = calloc(retstack_size, 
              sizeof(struct bpred_btb_ent_t))))
    fatal("cannot allocate return-address-stack");
      pred->retstack.tos = retstack_size - 1;
      
      break;
    }

  case BPredTaken:
  case BPredNotTaken:
    /* no other state */
    break;

  default:
    panic("bogus predictor class");
  }

  return pred;
}

/* create a branch direction predictor */
struct bpred_dir_t *    /* branch direction predictor instance */
bpred_dir_create (
  enum bpred_class class, /* type of predictor to create */
  unsigned int l1size,    /* level-1 table size */
  unsigned int l2size,    /* level-2 table size (if relevant). For perceptrons, this is the number of weight bits*/
  unsigned int shift_width, /* history register width */
  unsigned int xor)       /* history xor address flag */
{
  struct bpred_dir_t *pred_dir;
  unsigned int cnt;
  int flipflop;

  if (!(pred_dir = calloc(1, sizeof(struct bpred_dir_t))))
    fatal("out of virtual memory");

  pred_dir->class = class;

  cnt = -1;
  switch (class) {
  case BPred2Level:
    {
      if (!l1size || (l1size & (l1size-1)) != 0)
  fatal("level-1 size, `%d', must be non-zero and a power of two", 
        l1size);
      pred_dir->config.two.l1size = l1size;
      
      if (!l2size || (l2size & (l2size-1)) != 0)
  fatal("level-2 size, `%d', must be non-zero and a power of two", 
        l2size);
      pred_dir->config.two.l2size = l2size;
      
      if (!shift_width || shift_width > 30)
  fatal("shift register width, `%d', must be non-zero and positive",
        shift_width);
      pred_dir->config.two.shift_width = shift_width;
      
      pred_dir->config.two.xor = xor;
      pred_dir->config.two.shiftregs = calloc(l1size, sizeof(int));
      if (!pred_dir->config.two.shiftregs)
  fatal("cannot allocate shift register table");
      
      pred_dir->config.two.l2table = calloc(l2size, sizeof(unsigned char));
      if (!pred_dir->config.two.l2table)
  fatal("cannot allocate second level table");

      /* initialize counters to weakly this-or-that */
      flipflop = 1;
      for (cnt = 0; cnt < l2size; cnt++)
  {
    pred_dir->config.two.l2table[cnt] = flipflop;
    flipflop = 3 - flipflop;
  }

      break;
    }
  // Create our perceptron
  case BPredPerceptron:
  case BPredGGH:
    // Initialize the histories to be 0
    pred_dir->config.percept.temp_history = 0;
    pred_dir->config.percept.committed_history = 0;
    if(!l1size)
      fatal("num perceptron entries, `%d', must be non-zero and positive", l1size);
    if(!l2size)
      fatal("num weight bits, `%d', must be non-zero and positive", l2size);
    if(!shift_width)
      fatal("num perceptron bits, `%d', must be non-zero and positive", shift_width);
    // If our configuration checks out, create our predictor
    pred_dir->config.percept.num_perceptrons = l1size;
    pred_dir->config.percept.num_weight_bits = l2size;
    pred_dir->config.percept.perceptron_len = shift_width;
    pred_dir->config.percept.num_GGH_sets = xor;
    if(!(pred_dir->config.percept.perceptrons = calloc(l1size, sizeof(int)*(shift_width+1))))
      fatal("Perceptron allocation failed");
    break;
  case BPred2bit:
    if (!l1size || (l1size & (l1size-1)) != 0)
      fatal("2bit table size, `%d', must be non-zero and a power of two", 
      l1size);
    pred_dir->config.bimod.size = l1size;
    if (!(pred_dir->config.bimod.table =
    calloc(l1size, sizeof(unsigned char))))
      fatal("cannot allocate 2bit storage");
    /* initialize counters to weakly this-or-that */
    flipflop = 1;
    for (cnt = 0; cnt < l1size; cnt++)
      {
  pred_dir->config.bimod.table[cnt] = flipflop;
  flipflop = 3 - flipflop;
      }

    break;
  case BPredTaken:
  case BPredNotTaken:
    /* no other state */
    break;

  default:
    panic("bogus branch direction predictor class");
  }

  return pred_dir;
}

/* print branch direction predictor configuration */
void
bpred_dir_config(
  struct bpred_dir_t *pred_dir, /* branch direction predictor instance */
  char name[],      /* predictor name */
  FILE *stream)     /* output stream */
{
  switch (pred_dir->class) {
  case BPred2Level:
    fprintf(stream,
      "pred_dir: %s: 2-lvl: %d l1-sz, %d bits/ent, %s xor, %d l2-sz, direct-mapped\n",
      name, pred_dir->config.two.l1size, pred_dir->config.two.shift_width,
      pred_dir->config.two.xor ? "" : "no", pred_dir->config.two.l2size);
    break;

  case BPredPerceptron:
  case BPredGGH:
    fprintf(stream,"pred_dir: %s: # perceptrons: %d # percept bits, %d # weight bits, %d",
      name, pred_dir->config.percept.num_perceptrons, pred_dir->config.percept.perceptron_len, pred_dir->config.percept.num_weight_bits);
    break;

  case BPred2bit:
    fprintf(stream, "pred_dir: %s: 2-bit: %d entries, direct-mapped\n",
      name, pred_dir->config.bimod.size);
    break;

  case BPredTaken:
    fprintf(stream, "pred_dir: %s: predict taken\n", name);
    break;

  case BPredNotTaken:
    fprintf(stream, "pred_dir: %s: predict not taken\n", name);
    break;

  default:
    panic("bogus branch direction predictor class");
  }
}

/* print branch predictor configuration */
void
bpred_config(struct bpred_t *pred,  /* branch predictor instance */
       FILE *stream)    /* output stream */
{
  switch (pred->class) {
  case BPredComb:
    bpred_dir_config (pred->dirpred.bimod, "bimod", stream);
    bpred_dir_config (pred->dirpred.twolev, "2lev", stream);
    bpred_dir_config (pred->dirpred.meta, "meta", stream);
    fprintf(stream, "btb: %d sets x %d associativity", 
      pred->btb.sets, pred->btb.assoc);
    fprintf(stream, "ret_stack: %d entries", pred->retstack.size);
    break;

  case BPredPerceptron:
  case BPredGGH:
    bpred_dir_config (pred->dirpred.bimod, "percept", stream);
    fprintf(stream, "btb: %d sets x %d associativity", 
      pred->btb.sets, pred->btb.assoc);
    fprintf(stream, "ret_stack: %d entries", pred->retstack.size);
    break;

  case BPred2Level:
    bpred_dir_config (pred->dirpred.twolev, "2lev", stream);
    fprintf(stream, "btb: %d sets x %d associativity", 
      pred->btb.sets, pred->btb.assoc);
    fprintf(stream, "ret_stack: %d entries", pred->retstack.size);
    break;

  case BPred2bit:
    bpred_dir_config (pred->dirpred.bimod, "bimod", stream);
    fprintf(stream, "btb: %d sets x %d associativity", 
      pred->btb.sets, pred->btb.assoc);
    fprintf(stream, "ret_stack: %d entries", pred->retstack.size);
    break;

  case BPredTaken:
    bpred_dir_config (pred->dirpred.bimod, "taken", stream);
    break;
  case BPredNotTaken:
    bpred_dir_config (pred->dirpred.bimod, "nottaken", stream);
    break;

  default:
    panic("bogus branch predictor class");
  }
}

/* print predictor stats */
void
bpred_stats(struct bpred_t *pred, /* branch predictor instance */
      FILE *stream)   /* output stream */
{
  fprintf(stream, "pred: addr-prediction rate = %f\n",
    (double)pred->addr_hits/(double)(pred->addr_hits+pred->misses));
  fprintf(stream, "pred: dir-prediction rate = %f\n",
    (double)pred->dir_hits/(double)(pred->dir_hits+pred->misses));
}

/* register branch predictor stats */
void
bpred_reg_stats(struct bpred_t *pred, /* branch predictor instance */
    struct stat_sdb_t *sdb) /* stats database */
{
  char buf[512], buf1[512], *name;

  /* get a name for this predictor */
  switch (pred->class)
    {
    case BPredComb:
      name = "bpred_comb";
      break;
    case BPredPerceptron:
      name = "bpred_percept";
      break;
    case BPredGGH:
      name = "bpred_ggh";
      break;
    case BPred2Level:
      name = "bpred_2lev";
      break;
    case BPred2bit:
      name = "bpred_bimod";
      break;
    case BPredTaken:
      name = "bpred_taken";
      break;
    case BPredNotTaken:
      name = "bpred_nottaken";
      break;
    default:
      panic("bogus branch predictor class");
    }

  sprintf(buf, "%s.lookups", name);
  stat_reg_counter(sdb, buf, "total number of bpred lookups",
       &pred->lookups, 0, NULL);
  sprintf(buf, "%s.updates", name);
  sprintf(buf1, "%s.dir_hits + %s.misses", name, name);
  stat_reg_formula(sdb, buf, "total number of updates", buf1, "%12.0f");
  sprintf(buf, "%s.addr_hits", name);
  stat_reg_counter(sdb, buf, "total number of address-predicted hits", 
       &pred->addr_hits, 0, NULL);
  sprintf(buf, "%s.dir_hits", name);
  stat_reg_counter(sdb, buf, 
       "total number of direction-predicted hits "
       "(includes addr-hits)", 
       &pred->dir_hits, 0, NULL);
  if (pred->class == BPredComb)
    {
      sprintf(buf, "%s.used_bimod", name);
      stat_reg_counter(sdb, buf, 
           "total number of bimodal predictions used", 
           &pred->used_bimod, 0, NULL);
      sprintf(buf, "%s.used_2lev", name);
      stat_reg_counter(sdb, buf, 
           "total number of 2-level predictions used", 
           &pred->used_2lev, 0, NULL);
    }
  sprintf(buf, "%s.misses", name);
  stat_reg_counter(sdb, buf, "total number of misses", &pred->misses, 0, NULL);
  sprintf(buf, "%s.jr_hits", name);
  stat_reg_counter(sdb, buf,
       "total number of address-predicted hits for JR's",
       &pred->jr_hits, 0, NULL);
  sprintf(buf, "%s.jr_seen", name);
  stat_reg_counter(sdb, buf,
       "total number of JR's seen",
       &pred->jr_seen, 0, NULL);
  sprintf(buf, "%s.jr_non_ras_hits.PP", name);
  stat_reg_counter(sdb, buf,
       "total number of address-predicted hits for non-RAS JR's",
       &pred->jr_non_ras_hits, 0, NULL);
  sprintf(buf, "%s.jr_non_ras_seen.PP", name);
  stat_reg_counter(sdb, buf,
       "total number of non-RAS JR's seen",
       &pred->jr_non_ras_seen, 0, NULL);
  sprintf(buf, "%s.bpred_addr_rate", name);
  sprintf(buf1, "%s.addr_hits / %s.updates", name, name);
  stat_reg_formula(sdb, buf,
       "branch address-prediction rate (i.e., addr-hits/updates)",
       buf1, "%9.4f");
  sprintf(buf, "%s.bpred_dir_rate", name);
  sprintf(buf1, "%s.dir_hits / %s.updates", name, name);
  stat_reg_formula(sdb, buf,
      "branch direction-prediction rate (i.e., all-hits/updates)",
      buf1, "%9.4f");
  sprintf(buf, "%s.bpred_jr_rate", name);
  sprintf(buf1, "%s.jr_hits / %s.jr_seen", name, name);
  stat_reg_formula(sdb, buf,
      "JR address-prediction rate (i.e., JR addr-hits/JRs seen)",
      buf1, "%9.4f");
  sprintf(buf, "%s.bpred_jr_non_ras_rate.PP", name);
  sprintf(buf1, "%s.jr_non_ras_hits.PP / %s.jr_non_ras_seen.PP", name, name);
  stat_reg_formula(sdb, buf,
       "non-RAS JR addr-pred rate (ie, non-RAS JR hits/JRs seen)",
       buf1, "%9.4f");
  sprintf(buf, "%s.retstack_pushes", name);
  stat_reg_counter(sdb, buf,
       "total number of address pushed onto ret-addr stack",
       &pred->retstack_pushes, 0, NULL);
  sprintf(buf, "%s.retstack_pops", name);
  stat_reg_counter(sdb, buf,
       "total number of address popped off of ret-addr stack",
       &pred->retstack_pops, 0, NULL);
  sprintf(buf, "%s.used_ras.PP", name);
  stat_reg_counter(sdb, buf,
       "total number of RAS predictions used",
       &pred->used_ras, 0, NULL);
  sprintf(buf, "%s.ras_hits.PP", name);
  stat_reg_counter(sdb, buf,
       "total number of RAS hits",
       &pred->ras_hits, 0, NULL);
  sprintf(buf, "%s.ras_rate.PP", name);
  sprintf(buf1, "%s.ras_hits.PP / %s.used_ras.PP", name, name);
  stat_reg_formula(sdb, buf,
       "RAS prediction rate (i.e., RAS hits/used RAS)",
       buf1, "%9.4f");
}

void
bpred_after_priming(struct bpred_t *bpred)
{
  if (bpred == NULL)
    return;

  bpred->lookups = 0;
  bpred->addr_hits = 0;
  bpred->dir_hits = 0;
  bpred->used_ras = 0;
  bpred->used_bimod = 0;
  bpred->used_2lev = 0;
  bpred->jr_hits = 0;
  bpred->jr_seen = 0;
  bpred->misses = 0;
  bpred->retstack_pops = 0;
  bpred->retstack_pushes = 0;
  bpred->ras_hits = 0;
}

// A hash function used to index into the perceptron table based on an address
#define PERCEPT_HASH(PRED, ADDR)          \
  ((((ADDR) >> 19) ^ ((ADDR) >> MD_BR_SHIFT)) & ((PRED)->config.percept.num_perceptrons-1))

#define BIMOD_HASH(PRED, ADDR)            \
  ((((ADDR) >> 19) ^ ((ADDR) >> MD_BR_SHIFT)) & ((PRED)->config.bimod.size-1))
    /* was: ((baddr >> 16) ^ baddr) & (pred->dirpred.bimod.size-1) */

/* branch predictor specific structures */
typedef struct {
  char prediction;  /* use struct magic to pass the prediction and our struct */
  int binary_prediction; /* a binary form of our prediction (0 or 1 as opposed to 0 or 4) */
  int confidence;      /* previous perceptron confidence */
  long long temp_history; /* temporary history register yielding prediction */
  int *perceptron; /* perceptron value yielding this prediction */

} percept_update;

/* predicts a branch direction */
char *            /* pointer to counter */
bpred_dir_lookup(struct bpred_dir_t *pred_dir,  /* branch dir predictor inst */
     md_addr_t baddr)   /* branch address */
{
  unsigned char *p = NULL;

  /* Except for jumps, get a pointer to direction-prediction bits */
  switch (pred_dir->class) {
    case BPred2Level:
      {
  int l1index, l2index;

        /* traverse 2-level tables */
        l1index = (baddr >> MD_BR_SHIFT) & (pred_dir->config.two.l1size - 1);
        l2index = pred_dir->config.two.shiftregs[l1index];
        if (pred_dir->config.two.xor)
    {
#if 1
      /* this L2 index computation is more "compatible" to McFarling's
         verison of it, i.e., if the PC xor address component is only
         part of the index, take the lower order address bits for the
         other part of the index, rather than the higher order ones */
      l2index = (((l2index ^ (baddr >> MD_BR_SHIFT))
      & ((1 << pred_dir->config.two.shift_width) - 1))
           | ((baddr >> MD_BR_SHIFT)
        << pred_dir->config.two.shift_width));
#else
      l2index = l2index ^ (baddr >> MD_BR_SHIFT);
#endif
    }
  else
    {
      l2index =
        l2index
    | ((baddr >> MD_BR_SHIFT) << pred_dir->config.two.shift_width);
    }
        l2index = l2index & (pred_dir->config.two.l2size - 1);

        /* get a pointer to prediction state information */
        p = &pred_dir->config.two.l2table[l2index];
      }
      break;

    // Perceptron branch address prediction
    case BPredPerceptron:
    case BPredGGH:
    {
      // First index into the perceptron table
      int index;
      int *perceptron,*weight,confidence;
      index = PERCEPT_HASH(pred_dir,baddr);
      perceptron = &(pred_dir->config.percept.perceptrons[index*(pred_dir->config.percept.perceptron_len+1)]);
      //Get a pointer our weight of interest from the current perceptron
      weight = &perceptron[0];
      confidence = *weight;
      int i;
      for(i=1;i<=pred_dir->config.percept.perceptron_len;i++){
        weight++; // Increment the poninter to the weight
        // If we took that branch in the past add it to our confidence
        if(pred_dir->config.percept.temp_history&(1<<i))
          confidence += *weight;
        // Otherwise subtract it
        else
          confidence -= *weight;
      }
      //Make our prediction
      int prediction = confidence>=0;
      //Convert our prediction to a format usable by the program
      int adjusted_prediction = (confidence>0)?4:0;
      //Create our update struct and pass it out
      percept_update* perceptron_update;
      if (!(perceptron_update = calloc(1, sizeof(percept_update))))
        fatal("perceptron update allocation failed");
      perceptron_update-> prediction = adjusted_prediction;
      perceptron_update-> binary_prediction = prediction;
      perceptron_update-> temp_history = pred_dir->config.percept.temp_history;
      perceptron_update-> perceptron = perceptron;
      // Update our temporary (uncommitted) history

      if (pred_dir->class == BPredGGH) //TODO Check that this syntax is valid
      {
        /* in GGH, the history table is broken up into several ways, indexed by the low order bits of our instruction */
        int num_sets;
        num_sets = pred_dir->config.percept.num_GGH_sets;
        int set; // index of the set we want
        set = baddr & (num_sets-1); // gets the low order bits
        // perceptron_len is the same length as the number of bits in our history
        int set_length; // number of bits per set
        set_length = pred_dir->config.percept.perceptron_len / num_sets;
        long long mask; // 0 for the bits we don't want in total history
        mask = ((1 << set_length) - 1) << (set * set_length);
        long long history_t; // just to make the next math cleaner
        history_t = pred_dir->config.percept.temp_history;
        // bit masking function! looks messy but should work
        pred_dir->config.percept.temp_history = ((history_t & (~mask)) & 
          (((history_t & mask) << 1) & mask)) + (prediction << (set * set_length));
      }
      else
      {
        pred_dir->config.percept.temp_history <<= 1;
        pred_dir->config.percept.temp_history += prediction;
      }

      // Pass the struct to the next stage so we can later use its values
      p = (char *)perceptron_update;
    }
      break;

    case BPred2bit:
      p = &pred_dir->config.bimod.table[BIMOD_HASH(pred_dir, baddr)];
      break;
    case BPredTaken:
    case BPredNotTaken:
      break;
    default:
      panic("bogus branch direction predictor class");
    }

  return (char *)p;
}

/* probe a predictor for a next fetch address, the predictor is probed
   with branch address BADDR, the branch target is BTARGET (used for
   static predictors), and OP is the instruction opcode (used to simulate
   predecode bits; a pointer to the predictor state entry (or null for jumps)
   is returned in *DIR_UPDATE_PTR (used for updating predictor state),
   and the non-speculative top-of-stack is returned in stack_recover_idx 
   (used for recovering ret-addr stack after mis-predict).  */
md_addr_t       /* predicted branch target addr */
bpred_lookup(struct bpred_t *pred,  /* branch predictor instance */
       md_addr_t baddr,   /* branch address */
       md_addr_t btarget,   /* branch target if taken */
       enum md_opcode op,   /* opcode of instruction */
       int is_call,   /* non-zero if inst is fn call */
       int is_return,   /* non-zero if inst is fn return */
       struct bpred_update_t *dir_update_ptr, /* pred state pointer */
       int *stack_recover_idx)  /* Non-speculative top-of-stack;
           * used on mispredict recovery */
{
  struct bpred_btb_ent_t *pbtb = NULL;
  int index, i;

  if (!dir_update_ptr)
    panic("no bpred update record");

  /* if this is not a branch, return not-taken */
  if (!(MD_OP_FLAGS(op) & F_CTRL))
    return 0;

  pred->lookups++;

  dir_update_ptr->dir.ras = FALSE;
  dir_update_ptr->pdir1 = NULL;
  dir_update_ptr->pdir2 = NULL;
  dir_update_ptr->pmeta = NULL;
  /* Except for jumps, get a pointer to direction-prediction bits */
  switch (pred->class) {
    case BPredComb:
      if ((MD_OP_FLAGS(op) & (F_CTRL|F_UNCOND)) != (F_CTRL|F_UNCOND))
  {
    char *bimod, *twolev, *meta;
    bimod = bpred_dir_lookup (pred->dirpred.bimod, baddr);
    twolev = bpred_dir_lookup (pred->dirpred.twolev, baddr);
    meta = bpred_dir_lookup (pred->dirpred.meta, baddr);
    dir_update_ptr->pmeta = meta;
    dir_update_ptr->dir.meta  = (*meta >= 2);
    dir_update_ptr->dir.bimod = (*bimod >= 2);
    dir_update_ptr->dir.twolev  = (*twolev >= 2);
    if (*meta >= 2)
      {
        dir_update_ptr->pdir1 = twolev;
        dir_update_ptr->pdir2 = bimod;
      }
    else
      {
        dir_update_ptr->pdir1 = bimod;
        dir_update_ptr->pdir2 = twolev;
      }
  }
      break;
    case BPred2Level:
      if ((MD_OP_FLAGS(op) & (F_CTRL|F_UNCOND)) != (F_CTRL|F_UNCOND))
  {
    dir_update_ptr->pdir1 =
      bpred_dir_lookup (pred->dirpred.twolev, baddr);
  }
      break;
    case BPred2bit:
      if ((MD_OP_FLAGS(op) & (F_CTRL|F_UNCOND)) != (F_CTRL|F_UNCOND))
  {
    dir_update_ptr->pdir1 =
      bpred_dir_lookup (pred->dirpred.bimod, baddr);
  }
      break; 
    case BPredPerceptron:
      if ((MD_OP_FLAGS(op) & (F_CTRL|F_UNCOND)) != (F_CTRL|F_UNCOND))
  {
    dir_update_ptr->pdir1 =
      bpred_dir_lookup (pred->dirpred.perceptron, baddr);
  }
      break;
    case BPredTaken:
      return btarget;
    case BPredNotTaken:
      if ((MD_OP_FLAGS(op) & (F_CTRL|F_UNCOND)) != (F_CTRL|F_UNCOND))
  {
    return baddr + sizeof(md_inst_t);
  }
      else
  {
    return btarget;
  }
    default:
      panic("bogus predictor class");
  }

  /*
   * We have a stateful predictor, and have gotten a pointer into the
   * direction predictor (except for jumps, for which the ptr is null)
   */

  /* record pre-pop TOS; if this branch is executed speculatively
   * and is squashed, we'll restore the TOS and hope the data
   * wasn't corrupted in the meantime. */
  if (pred->retstack.size)
    *stack_recover_idx = pred->retstack.tos;
  else
    *stack_recover_idx = 0;

  /* if this is a return, pop return-address stack */
  if (is_return && pred->retstack.size)
    {
      md_addr_t target = pred->retstack.stack[pred->retstack.tos].target;
      pred->retstack.tos = (pred->retstack.tos + pred->retstack.size - 1)
                     % pred->retstack.size;
      pred->retstack_pops++;
      dir_update_ptr->dir.ras = TRUE; /* using RAS here */
      return target;
    }

#ifndef RAS_BUG_COMPATIBLE
  /* if function call, push return-address onto return-address stack */
  if (is_call && pred->retstack.size)
    {
      pred->retstack.tos = (pred->retstack.tos + 1)% pred->retstack.size;
      pred->retstack.stack[pred->retstack.tos].target = 
  baddr + sizeof(md_inst_t);
      pred->retstack_pushes++;
    }
#endif /* !RAS_BUG_COMPATIBLE */
  
  /* not a return. Get a pointer into the BTB */
  index = (baddr >> MD_BR_SHIFT) & (pred->btb.sets - 1);

  if (pred->btb.assoc > 1)
    {
      index *= pred->btb.assoc;

      /* Now we know the set; look for a PC match */
      for (i = index; i < (index+pred->btb.assoc) ; i++)
  if (pred->btb.btb_data[i].addr == baddr)
    {
      /* match */
      pbtb = &pred->btb.btb_data[i];
      break;
    }
    } 
  else
    {
      pbtb = &pred->btb.btb_data[index];
      if (pbtb->addr != baddr)
  pbtb = NULL;
    }

  /*
   * We now also have a pointer into the BTB for a hit, or NULL otherwise
   */

  /* if this is a jump, ignore predicted direction; we know it's taken. */
  if ((MD_OP_FLAGS(op) & (F_CTRL|F_UNCOND)) == (F_CTRL|F_UNCOND))
    {
      return (pbtb ? pbtb->target : 1);
    }

  /* otherwise we have a conditional branch */
  if (pbtb == NULL)
    {
      /* BTB miss -- just return a predicted direction */
      return ((*(dir_update_ptr->pdir1) >= 2)
        ? /* taken */ 1
        : /* not taken */ 0);
    }
  else
    {
      /* BTB hit, so return target if it's a predicted-taken branch */
      return ((*(dir_update_ptr->pdir1) >= 2)
        ? /* taken */ pbtb->target
        : /* not taken */ 0);
    }
}

/* Speculative execution can corrupt the ret-addr stack.  So for each
 * lookup we return the top-of-stack (TOS) at that point; a mispredicted
 * branch, as part of its recovery, restores the TOS using this value --
 * hopefully this uncorrupts the stack. */
void
bpred_recover(struct bpred_t *pred, /* branch predictor instance */
        md_addr_t baddr,    /* branch address */
        int stack_recover_idx)  /* Non-speculative top-of-stack;
           * used on mispredict recovery */
{
  if (pred == NULL)
    return;

  pred->retstack.tos = stack_recover_idx;
}

/* update the branch predictor, only useful for stateful predictors; updates
   entry for instruction type OP at address BADDR.  BTB only gets updated
   for branches which are taken.  Inst was determined to jump to
   address BTARGET and was taken if TAKEN is non-zero.  Predictor 
   statistics are updated with result of prediction, indicated by CORRECT and 
   PRED_TAKEN, predictor state to be updated is indicated by *DIR_UPDATE_PTR 
   (may be NULL for jumps, which shouldn't modify state bits).  Note if
   bpred_update is done speculatively, branch-prediction may get polluted. */
void
bpred_update(struct bpred_t *pred,  /* branch predictor instance */
       md_addr_t baddr,   /* branch address */
       md_addr_t btarget,   /* resolved branch target */
       int taken,     /* non-zero if branch was taken */
       int pred_taken,    /* non-zero if branch was pred taken */
       int correct,   /* was earlier addr prediction ok? */
       enum md_opcode op,   /* opcode of instruction */
       struct bpred_update_t *dir_update_ptr)/* pred state pointer */
{
  struct bpred_btb_ent_t *pbtb = NULL;
  struct bpred_btb_ent_t *lruhead = NULL, *lruitem = NULL;
  int index, i;

  /* don't change bpred state for non-branch instructions or if this
   * is a stateless predictor*/
  if (!(MD_OP_FLAGS(op) & F_CTRL))
    return;

  /* Have a branch here */

  if (correct)
    pred->addr_hits++;

  if (!!pred_taken == !!taken)
    pred->dir_hits++;
  else
    pred->misses++;

  if (dir_update_ptr->dir.ras)
    {
      pred->used_ras++;
      if (correct)
  pred->ras_hits++;
    }
  else if ((MD_OP_FLAGS(op) & (F_CTRL|F_COND)) == (F_CTRL|F_COND))
    {
      if (dir_update_ptr->dir.meta)
        pred->used_2lev++;
      else
        pred->used_bimod++;
    }

  /* keep stats about JR's; also, but don't change any bpred state for JR's
   * which are returns unless there's no retstack */
  if (MD_IS_INDIR(op))
    {
      pred->jr_seen++;
      if (correct)
  pred->jr_hits++;
      
      if (!dir_update_ptr->dir.ras)
  {
    pred->jr_non_ras_seen++;
    if (correct)
      pred->jr_non_ras_hits++;
  }
      else
  {
    /* return that used the ret-addr stack; no further work to do */
    return;
  }
    }

  /* Can exit now if this is a stateless predictor */
  if (pred->class == BPredNotTaken || pred->class == BPredTaken)
    return;

  /* 
   * Now we know the branch didn't use the ret-addr stack, and that this
   * is a stateful predictor 
   */

#ifdef RAS_BUG_COMPATIBLE
  /* if function call, push return-address onto return-address stack */
  if (MD_IS_CALL(op) && pred->retstack.size)
    {
      pred->retstack.tos = (pred->retstack.tos + 1)% pred->retstack.size;
      pred->retstack.stack[pred->retstack.tos].target = 
  baddr + sizeof(md_inst_t);
      pred->retstack_pushes++;
    }
#endif /* RAS_BUG_COMPATIBLE */

  /* update L1 table if appropriate */
  /* L1 table is updated unconditionally for combining predictor too */
  if ((MD_OP_FLAGS(op) & (F_CTRL|F_UNCOND)) != (F_CTRL|F_UNCOND) &&
      (pred->class == BPred2Level || pred->class == BPredComb))
    {
      int l1index, shift_reg;
      
      /* also update appropriate L1 history register */
      l1index =
  (baddr >> MD_BR_SHIFT) & (pred->dirpred.twolev->config.two.l1size - 1);
      shift_reg =
  (pred->dirpred.twolev->config.two.shiftregs[l1index] << 1) | (!!taken);
      pred->dirpred.twolev->config.two.shiftregs[l1index] =
  shift_reg & ((1 << pred->dirpred.twolev->config.two.shift_width) - 1);
    }

  /* find BTB entry if it's a taken branch (don't allocate for non-taken) */
  if (taken)
    {
      index = (baddr >> MD_BR_SHIFT) & (pred->btb.sets - 1);
      
      if (pred->btb.assoc > 1)
  {
    index *= pred->btb.assoc;
    
    /* Now we know the set; look for a PC match; also identify
     * MRU and LRU items */
    for (i = index; i < (index+pred->btb.assoc) ; i++)
      {
        if (pred->btb.btb_data[i].addr == baddr)
    {
      /* match */
      assert(!pbtb);
      pbtb = &pred->btb.btb_data[i];
    }
        
        dassert(pred->btb.btb_data[i].prev 
          != pred->btb.btb_data[i].next);
        if (pred->btb.btb_data[i].prev == NULL)
    {
      /* this is the head of the lru list, ie current MRU item */
      dassert(lruhead == NULL);
      lruhead = &pred->btb.btb_data[i];
    }
        if (pred->btb.btb_data[i].next == NULL)
    {
      /* this is the tail of the lru list, ie the LRU item */
      dassert(lruitem == NULL);
      lruitem = &pred->btb.btb_data[i];
    }
      }
    dassert(lruhead && lruitem);
    
    if (!pbtb)
      /* missed in BTB; choose the LRU item in this set as the victim */
      pbtb = lruitem; 
    /* else hit, and pbtb points to matching BTB entry */
    
    /* Update LRU state: selected item, whether selected because it
     * matched or because it was LRU and selected as a victim, becomes 
     * MRU */
    if (pbtb != lruhead)
      {
        /* this splices out the matched entry... */
        if (pbtb->prev)
    pbtb->prev->next = pbtb->next;
        if (pbtb->next)
    pbtb->next->prev = pbtb->prev;
        /* ...and this puts the matched entry at the head of the list */
        pbtb->next = lruhead;
        pbtb->prev = NULL;
        lruhead->prev = pbtb;
        dassert(pbtb->prev || pbtb->next);
        dassert(pbtb->prev != pbtb->next);
      }
    /* else pbtb is already MRU item; do nothing */
  }
      else
  pbtb = &pred->btb.btb_data[index];
    }
      
  /* 
   * Now 'p' is a possibly null pointer into the direction prediction table, 
   * and 'pbtb' is a possibly null pointer into the BTB (either to a 
   * matched-on entry or a victim which was LRU in its set)
   */

  /* update state (but not for jumps) */
  if (dir_update_ptr->pdir1)
    {
      if(pred->class == BPredPerceptron || pred->class == BPredGGH)
      {
        percept_update *update;
        update = (percept_update *) dir_update_ptr->pdir1;
        int i, *weight,  train;
        long long history;
        train = 1;

        /* update history */
        if( pred-class == BPredGGH)
        {
          int num_sets;
          num_sets = pred->dirpred.perceptron->config.percept.num_GGH_sets;
          int set; // index of the set we want
          set = baddr & (num_sets-1); // gets the low order bits
          // perceptron_len is the same length as the number of bits in our history
          int set_length; // number of bits per set
          set_length = pred->dirpred.perceptron->config.percept.perceptron_len / num_sets;
          long long mask; // 0 for the bits we don't want in total history
          mask = ((1 << set_length) - 1) << (set * set_length);
          long long history_t;
          history_t = pred->dirpred.perceptron->config.percept.temp_history;
          pred->dirpred.perceptron->config.percept.temp_history = ((history_t & (~mask)) & 
            (((history_t & mask) << 1) & mask)) + (prediction << (set * set_length));
        }
        else
        {
          pred->dirpred.perceptron->config.percept.committed_history <<= 1;
          pred->dirpred.perceptron->config.percept.committed_history += taken;
        }

        /* if you mispredicted roll back the temp history */
        if (update->binary_prediction == 0){
          pred->dirpred.perceptron->config.percept.temp_history =
            pred->dirpred.perceptron->config.percept.committed_history;
        }

        /* if prediction was correct and within the theta threshold don't update */
        if(update->confidence > THETA(pred->dirpred.perceptron->config.percept.perceptron_len && taken))
          train = 0;
        else if (update->confidence < -THETA(pred->dirpred.perceptron->config.percept.perceptron_len))
          train = 0;

        if (train)
        {
          /*weight is pointer to the first weight value in the perceptron */
          weight = &update->perceptron[0];

          update->temp_history<<=1;
          if(taken)
            update->temp_history++;
          history = update->temp_history;

          for (i=0; i < pred->dirpred.perceptron->config.percept.perceptron_len; i++)
          {
              /* if branch taken, increment; otherwise decrement the weight value */
            if ((history & (1 << i)) == taken)
              (*weight)++;
            else
              (*weight)--;

            /* if the weight is beyond max value, reset it to max value*/
            if (*weight > MAX_WEIGHT(pred->dirpred.perceptron->config.percept.num_weight_bits))
              *weight = MAX_WEIGHT(pred->dirpred.perceptron->config.percept.num_weight_bits);
            if (*weight < MIN_WEIGHT(pred->dirpred.perceptron->config.percept.num_weight_bits))
              *weight = MIN_WEIGHT(pred->dirpred.perceptron->config.percept.num_weight_bits);
            
          }
        }

      }

      if (taken)
  {
    if (*dir_update_ptr->pdir1 < 3)
      ++*dir_update_ptr->pdir1;
  }
      else
  { /* not taken */
    if (*dir_update_ptr->pdir1 > 0)
      --*dir_update_ptr->pdir1;
  }
    }

  /* combining predictor also updates second predictor and meta predictor */
  /* second direction predictor */
  if (dir_update_ptr->pdir2)
    {
      if (taken)
  {
    if (*dir_update_ptr->pdir2 < 3)
      ++*dir_update_ptr->pdir2;
  }
      else
  { /* not taken */
    if (*dir_update_ptr->pdir2 > 0)
      --*dir_update_ptr->pdir2;
  }
    }

  /* meta predictor */
  if (dir_update_ptr->pmeta)
    {
      if (dir_update_ptr->dir.bimod != dir_update_ptr->dir.twolev)
  {
    /* we only update meta predictor if directions were different */
    if (dir_update_ptr->dir.twolev == (unsigned int)taken)
      {
        /* 2-level predictor was correct */
        if (*dir_update_ptr->pmeta < 3)
    ++*dir_update_ptr->pmeta;
      }
    else
      {
        /* bimodal predictor was correct */
        if (*dir_update_ptr->pmeta > 0)
    --*dir_update_ptr->pmeta;
      }
  }
    }

  /* update BTB (but only for taken branches) */
  if (pbtb)
    {
      /* update current information */
      dassert(taken);

      if (pbtb->addr == baddr)
  {
    if (!correct)
      pbtb->target = btarget;
  }
      else
  {
    /* enter a new branch in the table */
    pbtb->addr = baddr;
    pbtb->op = op;
    pbtb->target = btarget;
  }
    }
}
