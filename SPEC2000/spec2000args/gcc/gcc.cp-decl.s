	file	 "gcc.lgred.cp-decl.i"
data

; cc1 (2.7.2.2) arguments: -O -fdefer-pop -fomit-frame-pointer
; -fcse-follow-jumps -fcse-skip-blocks -fexpensive-optimizations
; -fthread-jumps -fstrength-reduce -funroll-loops -fwritable-strings
; -fpeephole -fforce-mem -ffunction-cse -finline-functions -finline
; -freg-struct-return -fdelayed-branch -frerun-cse-after-loop
; -fschedule-insns -fschedule-insns2 -fcommon -fgnu-linker -m88110 -m88100
; -m88000 -mno-ocs-debug-info -mno-ocs-frame-position -mcheck-zero-division

gcc2_compiled.:
	global	 _language_string
	align	 8
@LC0:
	string	 "GNU C++\000"
	align	 4
_language_string:
	word	 @LC0
text
	align	 8
	global	 _push_decl_level
_push_decl_level:
	subu	 r31,r31,64
	or	 r4,r0,16
	st	 r2,r31,40
	or	 r2,r0,r3
	st	 r1,r31,36
@Ltb0:
	bsr.n	 _push_stack_level
	addu	 r3,r31,40
@Lte0:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
	global	 _global_bindings_p
_global_bindings_p:
@Ltb1:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r2,r9,lo16(_current_binding_level)
	or.u	 r9,r0,hi16(_global_binding_level)
	ld	 r9,r9,lo16(_global_binding_level)
	cmp	 r2,r2,r9
	jmp.n	 r1
	extu	 r2,r2,1<eq>
@Lte1:

	align	 8
	global	 _keep_next_level
_keep_next_level:
@Ltb2:
	or.u	 r8,r0,hi16(_keep_next_level_flag)
	or	 r9,r0,1
	jmp.n	 r1
	st	 r9,r8,lo16(_keep_next_level_flag)
@Lte2:

	align	 8
	global	 _kept_level_p
_kept_level_p:
@Ltb3:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,20
	bcnd.n	 ne0,r9,@L29
	or	 r2,r0,0
	ld	 r7,r8,32
	mask	 r9,r7,3584
	bcnd	 ne0,r9,@L29
	ld	 r9,r0,r8
	bcnd	 ne0,r9,@L29
	ld	 r9,r8,4
	bcnd	 eq0,r9,@L30
	bb1	 (31-23),r7,@L30
@L29:
	or	 r2,r0,1
@L30:
	jmp	 r1
@Lte3:

	align	 8
	global	 _declare_parm_level
_declare_parm_level:
@Ltb4:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,32
	and	 r9,r9,0xfff
	or	 r9,r9,4096
	jmp.n	 r1
	st	 r9,r8,32
@Lte4:

	align	 8
	global	 _declare_implicit_exception
_declare_implicit_exception:
@Ltb5:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,32
	and	 r9,r9,0xfff
	or	 r9,r9,12288
	jmp.n	 r1
	st	 r9,r8,32
@Lte5:

	align	 8
	global	 _have_exceptions_p
_have_exceptions_p:
@Ltb6:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r9,r9,lo16(_current_binding_level)
	ld	 r2,r9,32
	jmp.n	 r1
	extu	 r2,r2,1<4>
@Lte6:

	align	 8
	global	 _declare_uninstantiated_type_level
_declare_uninstantiated_type_level:
@Ltb7:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,32
	or	 r9,r9,8
	jmp.n	 r1
	st	 r9,r8,32
@Lte7:

	align	 8
	global	 _uninstantiated_type_level_p
_uninstantiated_type_level_p:
@Ltb8:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r9,r9,lo16(_current_binding_level)
	ld	 r2,r9,32
	jmp.n	 r1
	extu	 r2,r2,1<3>
@Lte8:

	align	 8
	global	 _declare_pseudo_global_level
_declare_pseudo_global_level:
@Ltb9:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,32
	or	 r9,r9,4
	jmp.n	 r1
	st	 r9,r8,32
@Lte9:

	align	 8
	global	 _pseudo_global_level_p
_pseudo_global_level_p:
@Ltb10:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r9,r9,lo16(_current_binding_level)
	ld	 r2,r9,32
	jmp.n	 r1
	extu	 r2,r2,1<2>
@Lte10:

	align	 8
	global	 _pushlevel
_pushlevel:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	subu	 r31,r31,64
	st	 r23,r31,36
	or	 r23,r0,r2
	st	 r1,r31,48
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L53
	st.d	 r24,r31,40
@Ltb11:
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
@L53:
	or.u	 r12,r0,hi16(_free_binding_level)
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L54
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L55
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L54:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L55:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r24,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L57
	st	 r13,r25,28
	br.n	 @L58
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L57:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L58:
	ld	 r13,r25,32
	mak	 r12,r23,1<8>
	and	 r13,r13,0xfeff
	mak	 r11,r24,3<9>
	or	 r13,r13,r12
	or	 r2,r0,r25
	or	 r13,r13,160
	or.u	 r12,r0,hi16(_current_binding_level)
	and	 r13,r13,0xf1ff
	st	 r2,r12,lo16(_current_binding_level)
	or	 r13,r13,r11
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
@Lte11:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	addu	 r31,r31,64
	jmp.n	 r1
	st	 r0,r13,lo16(_keep_next_level_flag)

	align	 8
	global	 _pushlevel_temporary
_pushlevel_temporary:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	subu	 r31,r31,64
	st	 r23,r31,36
	or	 r23,r0,r2
	st	 r1,r31,48
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L69
	st.d	 r24,r31,40
@Ltb12:
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
@L69:
	or.u	 r12,r0,hi16(_free_binding_level)
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L70
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L71
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L70:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L71:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r24,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L73
	st	 r13,r25,28
	br.n	 @L74
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L73:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L74:
	ld	 r13,r25,32
	mak	 r12,r23,1<8>
	and	 r13,r13,0xfeff
	or	 r2,r0,r25
	or	 r13,r13,r12
	or.u	 r25,r0,hi16(_current_binding_level)
	or	 r13,r13,160
	mak	 r12,r24,3<9>
	and	 r13,r13,0xf1ff
	st	 r2,r25,lo16(_current_binding_level)
	or	 r13,r13,r12
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
	ld	 r11,r25,lo16(_current_binding_level)
	ld	 r13,r11,32
	or.u	 r12,r0,hi16(_keep_next_level_flag)
	and	 r13,r13,0xf1ff
	st	 r0,r12,lo16(_keep_next_level_flag)
	or	 r13,r13,1024
	bsr.n	 _clear_last_expr
	st	 r13,r11,32
	bsr.n	 _expand_start_bindings
	or	 r2,r0,0
@Lte12:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC1:
	string	 "label `%s' used but not defined\000"
	align	 8
@LC2:
	string	 "label `%s' defined but not used\000"
text
	align	 8
	global	 _poplevel
_poplevel:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	subu	 r31,r31,96
	st	 r1,r31,80
	st	 r15,r31,36
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	or	 r20,r0,r2
	st.d	 r16,r31,40
@Ltb13:
	or	 r24,r0,r4
	ld	 r13,r13,32
	or	 r15,r0,r3
	or	 r21,r0,r24
	mask	 r18,r13,61440
	mask	 r13,r13,3584
	cmp	 r12,r18,12288
	cmp	 r13,r13,1024
	bb1.n	 ne,r13,@L162
	extu	 r18,r12,1<eq>
	or	 r21,r0,0
@L162:
	bcnd.n	 lt0,r21,@L164
	or	 r16,r0,r24
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r19,r13,4
	br	 @L165
	align	 4
@L164:
	or	 r19,r0,0
@L165:
	bcnd.n	 lt0,r21,@L166
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r22,r13,20
	br.n	 @L257
	or.u	 r25,r0,hi16(_current_binding_level)
	align	 4
@L166:
	or	 r22,r0,0
	or.u	 r25,r0,hi16(_current_binding_level)
@L257:
	ld	 r2,r25,lo16(_current_binding_level)
	ld	 r6,r2,32
	extu	 r4,r6,4<12>
	extu	 r5,r6,3<9>
	ld	 r3,r2,28
	bsr.n	 _GNU_xref_end_scope
	extu	 r6,r6,1<8>
	ld	 r2,r25,lo16(_current_binding_level)
	ld	 r13,r2,32
	mask	 r13,r13,3584
	cmp	 r13,r13,512
	bb1	 ne,r13,@L168
	or	 r20,r0,1
@L168:
	bcnd	 eq0,r15,@L169
	bsr.n	 _nreverse
	ld	 r2,r0,r2
	ld	 r13,r25,lo16(_current_binding_level)
	or	 r24,r0,r2
	br.n	 @L170
	st	 r24,r0,r13
	align	 4
@L169:
	ld	 r24,r0,r2
@L170:
	bcnd.n	 eq0,r24,@L172
	or	 r25,r0,r24
	or.u	 r23,r0,0x1d00
@L174:
	ld	 r12,r25,8
	mask.u	 r13,r12,0xff01
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L173
	ld	 r13,r25,48
	bcnd	 eq0,r13,@L173
	bb0	 (31-11),r12,@L173
	bsr.n	 _output_inline_function
	or	 r2,r0,r25
@L173:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L174
@L172:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r13,24
	cmp	 r13,r12,0
	extu	 r17,r13,1<ne>
	bcnd.n	 eq0,r17,@L177
	or	 r23,r0,0
	br.n	 @L178
	or	 r23,r0,r12
	align	 4
@L177:
	cmp	 r12,r20,1
	cmp	 r13,r21,0
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L178
	bsr.n	 _make_node
	or	 r2,r0,5
	or	 r23,r0,r2
@L178:
	bcnd	 eq0,r23,@L180
	st	 r24,r23,16
	st	 r19,r23,20
	or	 r2,r0,r23
	bsr.n	 _remember_end_note
	st	 r22,r23,24
@L180:
	bcnd	 lt0,r20,@L181
	bcnd.n	 eq0,r22,@L181
	or	 r25,r0,r22
@L185:
	st	 r23,r25,28
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L185
@L181:
	or	 r25,r0,r24
	bcnd	 eq0,r25,@L188
	or.u	 r10,r0,0x80
	or.u	 r11,r0,0x10
@L190:
	ld	 r13,r25,32
	bcnd	 eq0,r13,@L189
	ld	 r13,r25,28
	and	 r13,r13,r10
	bcnd	 eq0,r13,@L192
	ld	 r13,r25,8
	bb0	 (31-16),r13,@L263
	ld	 r12,r25,60
	ld	 r13,r12,8
	or	 r13,r13,32768
	st	 r13,r12,8
	ld	 r13,r25,8
@L263:
	and	 r13,r13,r11
	bcnd	 eq0,r13,@L192
	ld	 r12,r25,60
	ld	 r13,r12,8
	or	 r13,r13,r11
	st	 r13,r12,8
@L192:
	ld	 r13,r25,32
	st	 r0,r13,24
@L189:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L190
@L188:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,8
	bcnd.n	 eq0,r25,@L258
	or.u	 r13,r0,hi16(_current_binding_level)
@L199:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,24
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L199
	or.u	 r13,r0,hi16(_current_binding_level)
@L258:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,12
	bcnd.n	 eq0,r25,@L259
	or.u	 r13,r0,hi16(_current_binding_level)
@L204:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,28
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L204
	or.u	 r13,r0,hi16(_current_binding_level)
@L259:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,16
	bcnd	 eq0,r25,@L207
@L209:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,4
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L209
@L207:
	bcnd.n	 eq0,r21,@L211
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r25,r13,lo16(_named_labels)
	bcnd.n	 eq0,r25,@L264
	st	 r0,r23,16
@L215:
	ld	 r24,r25,16
	ld	 r13,r24,48
	bcnd.n	 ne0,r13,@L216
	or.u	 r13,r0,hi16(_warn_unused)
	or.u	 r3,r0,hi16(@LC1)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC1)
	ld	 r4,r24,32
	or.u	 r13,r0,hi16(_input_filename)
	ld	 r2,r13,lo16(_input_filename)
	or	 r3,r0,1
	bsr.n	 _define_label
	addu	 r1,r1,@L265
@L266:
	align	 4
@L216:
	ld	 r13,r13,lo16(_warn_unused)
	bcnd	 eq0,r13,@L217
	ld	 r13,r24,8
	bb1	 (31-16),r13,@L217
	or.u	 r3,r0,hi16(@LC2)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC2)
@L217:
	ld	 r13,r24,32
	ld	 r13,r13,36
	bcnd.n	 ne0,r13,@L220
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	ld	 r13,r24,32
	st	 r2,r13,36
@L220:
	ld	 r13,r24,32
	ld	 r13,r13,36
	st	 r0,r0,r13
	ld	 r13,r23,16
	st	 r13,r0,r24
	st	 r24,r23,16
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L215
	or.u	 r13,r0,hi16(_named_labels)
@L264:
	st	 r0,r13,lo16(_named_labels)
@L211:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r10,r13,lo16(_current_binding_level)
	ld	 r11,r10,28
	bcnd.n	 eq0,r11,@L222
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r12,r13,lo16(_named_label_uses)
	bcnd.n	 eq0,r12,@L260
	or.u	 r13,r0,hi16(_current_binding_level)
@L226:
	ld	 r13,r12,4
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L225
	st	 r11,r12,4
	ld	 r13,r0,r11
	st	 r13,r12,12
@L225:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L226
@L222:
	or.u	 r13,r0,hi16(_current_binding_level)
@L260:
	ld	 r11,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r11,32
	ld	 r13,r13,lo16(_global_binding_level)
	bcnd.n	 eq0,r13,@L230
	extu	 r24,r12,3<9>
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L261
	or.u	 r9,r0,hi16(_current_binding_level)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,123
@L230:
	or.u	 r9,r0,hi16(_current_binding_level)
@L261:
	or.u	 r11,r0,hi16(_free_binding_level)
	ld	 r12,r9,lo16(_current_binding_level)
	ld	 r13,r11,lo16(_free_binding_level)
	ld	 r10,r12,28
	st	 r13,r12,28
	ld	 r13,r10,32
	mask	 r13,r13,61440
	st	 r12,r11,lo16(_free_binding_level)
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L229
	st	 r10,r9,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_class_binding_level)
	or	 r11,r0,r9
	st	 r10,r13,lo16(_class_binding_level)
@L233:
	ld	 r13,r11,lo16(_current_binding_level)
	ld	 r12,r13,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 eq,r13,@L233
	st	 r12,r11,lo16(_current_binding_level)
@L229:
	bcnd.n	 eq0,r21,@L237
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	br.n	 @L238
	st	 r23,r13,48
	align	 4
@L237:
	bcnd	 eq0,r23,@L239
	bcnd.n	 ne0,r17,@L262
	cmp	 r13,r24,2
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	br.n	 @L256
	or	 r3,r0,r23
	align	 4
@L239:
	bcnd.n	 eq0,r22,@L238
	cmp	 r13,r20,2
	bb1.n	 ne,r13,@L243
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r3,r13,20
	br.n	 @L256
	or	 r2,r0,r22
	align	 4
@L243:
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	or	 r3,r0,r22
@L256:
	bsr	 _chainon
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r13,20
@L238:
	cmp	 r13,r24,2
@L262:
	cmp	 r12,r18,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L245
	bsr	 _getdecls
	or	 r3,r0,r20
	bsr.n	 _expand_end_bindings
	or	 r4,r0,1
	or	 r2,r0,r20
	or	 r3,r0,r15
	bsr.n	 _poplevel
	or	 r4,r0,r16
	or	 r23,r0,r2
@L245:
	bcnd	 eq0,r23,@L246
	ld	 r13,r23,8
	or	 r13,r13,32768
	st	 r13,r23,8
@L246:
@Lte13:
	ld	 r1,r31,80
	ld	 r15,r31,36
	ld.d	 r24,r31,72
	or	 r2,r0,r23
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L265,@L217-@L266

	align	 8
	global	 _delete_block
_delete_block:
@Ltb14:
	or.u	 r7,r0,hi16(_current_binding_level)
	ld	 r8,r7,lo16(_current_binding_level)
	ld	 r9,r8,20
	cmp	 r9,r9,r2
	bb1	 ne,r9,@L277
	ld	 r9,r0,r2
	st	 r9,r8,20
@L277:
	ld	 r9,r7,lo16(_current_binding_level)
	ld	 r8,r9,20
	bcnd	 eq0,r8,@L279
@L281:
	ld	 r7,r0,r8
	cmp	 r9,r7,r2
	bb1	 ne,r9,@L282
	ld	 r9,r0,r2
	br.n	 @L278
	st	 r9,r0,r8
	align	 4
@L282:
	or	 r8,r0,r7
@L278:
	bcnd	 ne0,r8,@L281
@L279:
	ld	 r9,r2,8
	st	 r0,r0,r2
	and	 r9,r9,0x7fff
	jmp.n	 r1
	st	 r9,r2,8
@Lte14:

	align	 8
	global	 _insert_block
_insert_block:
	subu	 r31,r31,48
	st	 r1,r31,36
	or	 r3,r0,r2
	st	 r25,r31,32
@Ltb15:
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r3,8
	ld	 r12,r25,lo16(_current_binding_level)
	or	 r13,r13,32768
	st	 r13,r3,8
	bsr.n	 _chainon
	ld	 r2,r12,20
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r13,20
@Lte15:
	ld	 r1,r31,36
	ld	 r25,r31,32
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _add_block_current_level
_add_block_current_level:
	subu	 r31,r31,48
	st	 r25,r31,32
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r1,r31,36
@Ltb16:
	or	 r3,r0,r2
	bsr.n	 _chainon
	ld	 r2,r13,20
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r13,20
@Lte16:
	ld	 r1,r31,36
	ld	 r25,r31,32
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _set_block
_set_block:
@Ltb17:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r9,r9,lo16(_current_binding_level)
	jmp.n	 r1
	st	 r2,r9,24
@Lte17:

	align	 8
	global	 _pushlevel_class
_pushlevel_class:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	subu	 r31,r31,80
	st	 r1,r31,48
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L307
	st.d	 r24,r31,40
@Ltb18:
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
@L307:
	or.u	 r12,r0,hi16(_free_binding_level)
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L308
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L309
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L308:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L309:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r24,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L311
	st	 r13,r25,28
	br.n	 @L312
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L311:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L312:
	mak	 r12,r24,3<9>
	ld	 r13,r25,32
	or	 r2,r0,r25
	or.u	 r25,r0,hi16(_current_binding_level)
	or	 r13,r13,160
	or.u	 r24,r0,hi16(_decl_stack)
	and	 r13,r13,0xf0ff
	st	 r2,r25,lo16(_current_binding_level)
	or	 r13,r13,r12
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
	addu	 r3,r31,56
	ld	 r13,r24,lo16(_decl_stack)
	or	 r4,r0,16
	or.u	 r2,r0,hi16(_decl_obstack)
	st	 r13,r31,56
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	or	 r2,r2,lo16(_decl_obstack)
	bsr.n	 _push_stack_level
	st	 r0,r13,lo16(_keep_next_level_flag)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r12,32
	or.u	 r11,r0,hi16(_class_binding_level)
	st	 r2,r24,lo16(_decl_stack)
	and	 r13,r13,0xfff
	st	 r12,r11,lo16(_class_binding_level)
	or	 r13,r13,8192
	st	 r13,r12,32
@L314:
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r12,r13,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 eq,r13,@L314
	st	 r12,r25,lo16(_current_binding_level)
@Lte18:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,80

data
	align	 8
@LC3:
	string	 "syntax error too serious\000"
text
	align	 8
	global	 _poplevel_class
_poplevel_class:
	subu	 r31,r31,96
	or.u	 r13,r0,hi16(_class_binding_level)
	st.d	 r24,r31,72
	ld	 r25,r13,lo16(_class_binding_level)
	st	 r1,r31,80
	st	 r15,r31,36
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	or	 r23,r0,0
	bcnd.n	 ne0,r25,@L436
	st.d	 r16,r31,40
@Ltb19:
	or.u	 r12,r0,hi16(_current_binding_level)
	ld	 r13,r12,lo16(_current_binding_level)
	bcnd.n	 eq0,r13,@L551
	or	 r22,r0,r12
@L439:
	ld	 r13,r12,lo16(_current_binding_level)
	ld	 r13,r13,32
	or	 r20,r0,0
	or	 r18,r0,0
	mask	 r17,r13,61440
	mask	 r13,r13,3584
	cmp	 r12,r17,12288
	cmp	 r13,r13,1024
	bb1.n	 ne,r13,@L442
	extu	 r17,r12,1<eq>
	or	 r18,r0,r20
@L442:
	bcnd.n	 lt0,r18,@L444
	or	 r15,r0,0
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r19,r13,4
	br	 @L445
	align	 4
@L444:
	or	 r19,r0,0
@L445:
	bcnd.n	 lt0,r18,@L446
	or	 r21,r0,0
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r21,r13,20
@L446:
	ld	 r2,r22,lo16(_current_binding_level)
	ld	 r6,r2,32
	extu	 r4,r6,4<12>
	extu	 r5,r6,3<9>
	ld	 r3,r2,28
	bsr.n	 _GNU_xref_end_scope
	extu	 r6,r6,1<8>
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r12,32
	mask	 r13,r13,3584
	cmp	 r13,r13,512
	bb1	 ne,r13,@L449
	or	 r20,r0,1
@L449:
	ld	 r24,r0,r12
	bcnd.n	 eq0,r24,@L452
	or	 r25,r0,r24
	or.u	 r23,r0,0x1d00
@L454:
	ld	 r12,r25,8
	mask.u	 r13,r12,0xff01
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L453
	ld	 r13,r25,48
	bcnd	 eq0,r13,@L453
	bb0	 (31-11),r12,@L453
	bsr.n	 _output_inline_function
	or	 r2,r0,r25
@L453:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L454
@L452:
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r12,r13,24
	cmp	 r13,r12,0
	extu	 r16,r13,1<ne>
	bcnd.n	 eq0,r16,@L457
	or	 r23,r0,0
	br.n	 @L458
	or	 r23,r0,r12
	align	 4
@L457:
	subu	 r13,r0,r18
	or	 r13,r13,r20
	bcnd	 eq0,r13,@L458
	bsr.n	 _make_node
	or	 r2,r0,5
	or	 r23,r0,r2
@L458:
	bcnd	 eq0,r23,@L460
	st	 r24,r23,16
	st	 r19,r23,20
	or	 r2,r0,r23
	bsr.n	 _remember_end_note
	st	 r21,r23,24
@L460:
	bcnd	 lt0,r20,@L461
	bcnd.n	 eq0,r21,@L461
	or	 r25,r0,r21
@L465:
	st	 r23,r25,28
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L465
@L461:
	or	 r25,r0,r24
	bcnd	 eq0,r25,@L468
@L470:
	ld	 r13,r25,32
	bcnd	 eq0,r13,@L469
	ld	 r13,r25,28
	bb0	 (31-8),r13,@L472
	ld	 r13,r25,8
	bb0	 (31-16),r13,@L598
	ld	 r12,r25,60
	ld	 r13,r12,8
	or	 r13,r13,32768
	st	 r13,r12,8
	ld	 r13,r25,8
@L598:
	bb0	 (31-11),r13,@L472
	ld	 r12,r25,60
	ld	 r13,r12,8
	or.u	 r13,r13,0x10
	st	 r13,r12,8
@L472:
	ld	 r13,r25,32
	st	 r0,r13,24
@L469:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L470
@L468:
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r25,r13,8
	bcnd	 eq0,r25,@L592
@L479:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,24
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L479
	ld	 r13,r22,lo16(_current_binding_level)
@L592:
	ld	 r25,r13,12
	bcnd	 eq0,r25,@L482
@L484:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,28
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L484
@L482:
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r25,r13,16
	bcnd	 eq0,r25,@L487
@L489:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,4
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L489
@L487:
	bcnd.n	 eq0,r18,@L491
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r25,r13,lo16(_named_labels)
	bcnd.n	 eq0,r25,@L599
	st	 r0,r23,16
@L495:
	ld	 r24,r25,16
	ld	 r13,r24,48
	bcnd.n	 ne0,r13,@L496
	or.u	 r13,r0,hi16(_warn_unused)
	or.u	 r3,r0,hi16(@LC1)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC1)
	ld	 r4,r24,32
	or.u	 r13,r0,hi16(_input_filename)
	ld	 r2,r13,lo16(_input_filename)
	or	 r3,r0,1
	bsr.n	 _define_label
	addu	 r1,r1,@L600
@L601:
	align	 4
@L496:
	ld	 r13,r13,lo16(_warn_unused)
	bcnd	 eq0,r13,@L497
	ld	 r13,r24,8
	bb1	 (31-16),r13,@L497
	or.u	 r3,r0,hi16(@LC2)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC2)
@L497:
	ld	 r13,r24,32
	ld	 r13,r13,36
	bcnd.n	 ne0,r13,@L500
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	ld	 r13,r24,32
	st	 r2,r13,36
@L500:
	ld	 r13,r24,32
	ld	 r13,r13,36
	st	 r0,r0,r13
	ld	 r13,r23,16
	st	 r13,r0,r24
	st	 r24,r23,16
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L495
	or.u	 r13,r0,hi16(_named_labels)
@L599:
	st	 r0,r13,lo16(_named_labels)
@L491:
	ld	 r10,r22,lo16(_current_binding_level)
	ld	 r11,r10,28
	bcnd.n	 eq0,r11,@L502
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r12,r13,lo16(_named_label_uses)
	bcnd	 eq0,r12,@L502
@L506:
	ld	 r13,r12,4
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L505
	st	 r11,r12,4
	ld	 r13,r0,r11
	st	 r13,r12,12
@L505:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L506
@L502:
	ld	 r11,r22,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r11,32
	ld	 r13,r13,lo16(_global_binding_level)
	bcnd.n	 eq0,r13,@L510
	extu	 r25,r12,3<9>
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L593
	or.u	 r11,r0,hi16(_free_binding_level)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,123
@L510:
	or.u	 r11,r0,hi16(_free_binding_level)
@L593:
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r11,lo16(_free_binding_level)
	ld	 r10,r12,28
	st	 r13,r12,28
	ld	 r13,r10,32
	mask	 r13,r13,61440
	st	 r12,r11,lo16(_free_binding_level)
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L509
	st	 r10,r22,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_class_binding_level)
	st	 r10,r13,lo16(_class_binding_level)
@L513:
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r12,r13,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 eq,r13,@L513
	st	 r12,r22,lo16(_current_binding_level)
@L509:
	bcnd.n	 eq0,r18,@L517
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	br.n	 @L518
	st	 r23,r13,48
	align	 4
@L517:
	bcnd	 eq0,r23,@L519
	bcnd.n	 ne0,r16,@L594
	cmp	 r13,r25,2
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r2,r13,20
	br.n	 @L590
	or	 r3,r0,r23
	align	 4
@L519:
	bcnd.n	 eq0,r21,@L518
	cmp	 r13,r20,2
	bb1.n	 ne,r13,@L523
	or	 r3,r0,r21
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r3,r13,20
	br.n	 @L590
	or	 r2,r0,r21
	align	 4
@L523:
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r2,r13,20
@L590:
	bsr	 _chainon
	ld	 r13,r22,lo16(_current_binding_level)
	st	 r2,r13,20
@L518:
	cmp	 r13,r25,2
@L594:
	cmp	 r12,r17,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L525
	bsr	 _getdecls
	or	 r3,r0,r20
	bsr.n	 _expand_end_bindings
	or	 r4,r0,1
	or	 r2,r0,r20
	or	 r3,r0,0
	bsr.n	 _poplevel
	or	 r4,r0,r15
	or	 r23,r0,r2
@L525:
	bcnd	 eq0,r23,@L526
	ld	 r13,r23,8
	or	 r13,r13,32768
	st	 r13,r23,8
@L526:
	or.u	 r12,r0,hi16(_current_binding_level)
	ld	 r13,r12,lo16(_current_binding_level)
	bcnd.n	 eq0,r13,@L551
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd.n	 eq0,r13,@L439
	or.u	 r13,r0,hi16(_class_binding_level)
	br	 @L595
	align	 4
@L551:
	or.u	 r2,r0,hi16(@LC3)
	bsr.n	 _fatal
	or	 r2,r2,lo16(@LC3)
	or.u	 r13,r0,hi16(_class_binding_level)
@L595:
	ld	 r25,r13,lo16(_class_binding_level)
@L436:
	or.u	 r13,r0,hi16(_decl_stack)
	ld	 r2,r13,lo16(_decl_stack)
	ld	 r13,r2,4
	ld	 r9,r2,8
	ld	 r12,r13,12
	cmp	 r10,r12,r9
	bb0.n	 ne,r10,@L531
	subu	 r13,r9,r12
	bb1.n	 le,r10,@L557
	mask	 r11,r13,15
	bcnd.n	 eq0,r11,@L596
	subu	 r13,r12,4
	cmp	 r13,r11,12
	bb1.n	 ge,r13,@L557
	cmp	 r13,r11,8
	bb1.n	 ge,r13,@L558
	cmp	 r13,r11,3
	bb0.n	 gt,r13,@L596
	subu	 r13,r12,4
	subu	 r12,r12,4
	ld	 r13,r0,r12
	bcnd	 eq0,r13,@L558
	ld	 r13,r13,32
	st	 r0,r13,28
@L558:
	subu	 r12,r12,4
	ld	 r13,r0,r12
	bcnd	 eq0,r13,@L557
	ld	 r13,r13,32
	st	 r0,r13,28
@L557:
	br.n	 @L591
	subu	 r12,r12,4
	align	 4
@L532:
@L596:
	ld	 r13,r0,r13
	bcnd	 eq0,r13,@L569
	ld	 r13,r13,32
	st	 r0,r13,28
@L569:
	subu	 r13,r12,8
	ld	 r13,r0,r13
	bcnd	 eq0,r13,@L572
	ld	 r13,r13,32
	st	 r0,r13,28
@L572:
	subu	 r13,r12,12
	ld	 r13,r0,r13
	bcnd	 eq0,r13,@L575
	ld	 r13,r13,32
	st	 r0,r13,28
@L575:
	subu	 r12,r12,16
@L591:
	ld	 r13,r0,r12
	bcnd	 eq0,r13,@L578
	ld	 r13,r13,32
	st	 r0,r13,28
@L578:
	cmp	 r13,r12,r9
	bb1.n	 ne,r13,@L532
	subu	 r13,r12,4
@L531:
	bsr	 _pop_stack_level
	ld	 r11,r25,8
	or.u	 r13,r0,hi16(_decl_stack)
	bcnd.n	 eq0,r11,@L536
	st	 r2,r13,lo16(_decl_stack)
@L538:
	ld	 r12,r11,12
	ld	 r13,r11,16
	st	 r13,r12,24
	ld	 r11,r0,r11
	bcnd	 ne0,r11,@L538
@L536:
	ld	 r11,r25,12
	bcnd	 eq0,r11,@L541
@L543:
	ld	 r12,r11,12
	ld	 r13,r11,16
	st	 r13,r12,28
	ld	 r11,r0,r11
	bcnd	 ne0,r11,@L543
@L541:
	ld	 r11,r25,16
	bcnd.n	 eq0,r11,@L597
	or.u	 r24,r0,hi16(_class_binding_level)
@L548:
	ld	 r12,r11,12
	ld	 r13,r11,16
	st	 r13,r12,4
	ld	 r11,r0,r11
	bcnd.n	 ne0,r11,@L548
	or.u	 r24,r0,hi16(_class_binding_level)
@L597:
	ld	 r2,r24,lo16(_class_binding_level)
	ld	 r6,r2,32
	extu	 r4,r6,4<12>
	extu	 r5,r6,3<9>
	ld	 r3,r2,28
	bsr.n	 _GNU_xref_end_scope
	extu	 r6,r6,1<8>
	ld	 r12,r25,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb0.n	 ne,r13,@L550
	st	 r12,r24,lo16(_class_binding_level)
	st	 r0,r24,lo16(_class_binding_level)
@L550:
	or.u	 r12,r0,hi16(_free_binding_level)
	ld	 r13,r12,lo16(_free_binding_level)
	st	 r13,r25,28
@Lte19:
	ld	 r1,r31,80
	ld	 r15,r31,36
	st	 r25,r12,lo16(_free_binding_level)
	ld.d	 r24,r31,72
	or	 r2,r0,r23
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L600,@L497-@L601

	global	 _no_print_functions
data
	align	 4
_no_print_functions:
	word	 0
	global	 _no_print_builtins
	align	 4
_no_print_builtins:
	word	 0
	align	 8
@LC4:
	string	 " blocks=\000"
	align	 8
@LC5:
	string	 "%x\000"
	align	 8
@LC6:
	string	 " n_incomplete=%d parm_flag=%d keep=%d\000"
	align	 8
@LC7:
	string	 " tag-transparent\000"
	align	 8
@LC8:
	string	 " more-cleanups-ok\000"
	align	 8
@LC9:
	string	 " have-cleanups\000"
	align	 8
@LC10:
	string	 " more-exceptions-ok\000"
	align	 8
@LC11:
	string	 " have-exceptions\000"
	align	 8
@LC12:
	string	 "\n\000"
	align	 8
@LC13:
	string	 " names:\t\000"
	align	 8
@LC14:
	string	 "<built-in>\000"
	align	 8
@LC15:
	string	 "\n\t\000"
	align	 8
@LC16:
	string	 "\000"
	align	 8
@LC17:
	string	 "\n\000"
	align	 8
@LC18:
	string	 " tags:\t\000"
	align	 8
@LC19:
	string	 "\n\t\000"
	align	 8
@LC20:
	string	 "<unnamed-typedef\000"
	align	 8
@LC21:
	string	 ">\000"
	align	 8
@LC22:
	string	 "\000"
	align	 8
@LC23:
	string	 "<typedef\000"
	align	 8
@LC24:
	string	 "\000"
	align	 8
@LC25:
	string	 ">\000"
	align	 8
@LC26:
	string	 "\n\000"
	align	 8
@LC27:
	string	 " shadowed:\000"
	align	 8
@LC28:
	string	 " %s \000"
	align	 8
@LC29:
	string	 "\n\000"
	align	 8
@LC30:
	string	 " class-shadowed:\000"
	align	 8
@LC31:
	string	 " %s \000"
	align	 8
@LC32:
	string	 "\n\000"
	align	 8
@LC33:
	string	 " type-shadowed:\000"
	align	 8
@LC34:
	string	 " %s \000"
	align	 8
@LC35:
	string	 "\n\000"
text
	align	 8
	global	 _print_binding_level
_print_binding_level:
	subu	 r31,r31,80
	or.u	 r3,r0,hi16(@LC4)
	st.d	 r22,r31,48
	or	 r22,r0,r2
	st.d	 r20,r31,40
	or.u	 r21,r0,hi16(__iob+64)
	st.d	 r24,r31,56
	or	 r25,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC4)
	st	 r1,r31,64
@Ltb20:
	bsr.n	 _fprintf
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC5)
	or	 r2,r0,r25
	ld	 r4,r22,20
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC5)
	or	 r2,r0,r25
	ld	 r6,r22,32
	or.u	 r3,r0,hi16(@LC6)
	ld.hu	 r4,r22,32
	extu	 r5,r6,4<12>
	or	 r3,r3,lo16(@LC6)
	bsr.n	 _fprintf
	extu	 r6,r6,3<9>
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L713
	or	 r23,r0,0
	or.u	 r3,r0,hi16(@LC7)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC7)
	ld	 r13,r22,32
@L713:
	bb0	 (31-24),r13,@L657
	or.u	 r3,r0,hi16(@LC8)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC8)
@L657:
	ld	 r13,r22,32
	bb0	 (31-25),r13,@L714
	or.u	 r3,r0,hi16(@LC9)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC9)
	ld	 r13,r22,32
@L714:
	bb0	 (31-26),r13,@L659
	or.u	 r3,r0,hi16(@LC10)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC10)
@L659:
	ld	 r13,r22,32
	bb0	 (31-27),r13,@L660
	or.u	 r3,r0,hi16(@LC11)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC11)
@L660:
	or.u	 r3,r0,hi16(@LC12)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC12)
	ld	 r13,r0,r22
	bcnd	 eq0,r13,@L661
	or.u	 r3,r0,hi16(@LC13)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC13)
	ld	 r24,r0,r22
	bcnd.n	 eq0,r24,@L663
	or.u	 r13,r0,hi16(_no_print_functions)
@L712:
	ld	 r13,r13,lo16(_no_print_functions)
	bcnd	 eq0,r13,@L666
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 eq,r13,@L664
@L666:
	or.u	 r13,r0,hi16(_no_print_builtins)
	ld	 r13,r13,lo16(_no_print_builtins)
	bcnd	 eq0,r13,@L667
	ld.bu	 r13,r24,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L667
	or.u	 r3,r0,hi16(@LC14)
	ld	 r2,r24,12
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC14)
	bcnd	 eq0,r2,@L664
@L667:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	ext	 r13,r13,1<eq>
	mask	 r13,r13,3
	or	 r25,r13,2
	addu	 r23,r23,r25
	cmp	 r13,r23,6
	bb0	 gt,r13,@L670
	or.u	 r3,r0,hi16(@LC15)
	or	 r2,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC15)
	bsr.n	 _fprintf
	or	 r23,r0,r25
@L670:
	or	 r2,r21,lo16(__iob+64)
	or	 r4,r0,r24
	or.u	 r3,r0,hi16(@LC16)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC16)
	ld.bu	 r13,r24,8
	bcnd	 eq0,r13,@L663
@L664:
	ld	 r24,r0,r24
	bcnd.n	 ne0,r24,@L712
	or.u	 r13,r0,hi16(_no_print_functions)
@L663:
	bcnd.n	 eq0,r23,@L661
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC17)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC17)
@L661:
	ld	 r13,r22,4
	bcnd	 eq0,r13,@L674
	or.u	 r21,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC18)
	or	 r25,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC18)
	bsr.n	 _fprintf
	or	 r2,r0,r25
	ld	 r24,r22,4
	bcnd.n	 eq0,r24,@L676
	or	 r23,r0,0
	or	 r20,r0,r21
	or	 r21,r0,r25
@L678:
	ld	 r12,r24,12
	bcnd	 ne0,r12,@L679
	or	 r25,r0,3
	br.n	 @L715
	addu	 r23,r23,r25
	align	 4
@L679:
	ld	 r13,r24,16
	ld	 r13,r13,48
	ld	 r13,r13,32
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L680
	or	 r25,r0,4
	or	 r25,r0,2
@L680:
	addu	 r23,r23,r25
@L715:
	cmp	 r13,r23,5
	bb0.n	 gt,r13,@L683
	or.u	 r3,r0,hi16(@LC19)
	or	 r2,r20,lo16(__iob+64)
	or	 r3,r3,lo16(@LC19)
	bsr.n	 _fprintf
	or	 r23,r0,r25
@L683:
	ld	 r4,r24,12
	bcnd	 ne0,r4,@L684
	ld	 r4,r24,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC20)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC20)
	or.u	 r3,r0,hi16(@LC21)
	or	 r2,r0,r21
	br.n	 @L711
	or	 r3,r3,lo16(@LC21)
	align	 4
@L684:
	ld	 r12,r24,16
	ld	 r13,r12,48
	ld	 r13,r13,32
	cmp	 r13,r4,r13
	bb1.n	 ne,r13,@L686
	or	 r2,r0,r21
	or	 r2,r20,lo16(__iob+64)
	or	 r4,r0,r12
	or.u	 r3,r0,hi16(@LC22)
	or	 r5,r0,0
	or	 r3,r3,lo16(@LC22)
	bsr.n	 _print_node_brief
	addu	 r1,r1,@L716
@L717:
	align	 4
@L686:
	or.u	 r3,r0,hi16(@LC23)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC23)
	ld	 r4,r24,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC24)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC24)
	or.u	 r3,r0,hi16(@LC25)
	or	 r2,r0,r21
	or	 r3,r3,lo16(@LC25)
@L711:
	bsr	 _fprintf
@L677:
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L678
@L676:
	bcnd.n	 eq0,r23,@L674
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC26)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC26)
@L674:
	ld	 r13,r22,8
	bcnd	 eq0,r13,@L690
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC27)
	or	 r2,r25,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC27)
	ld	 r24,r22,8
	bcnd	 eq0,r24,@L692
	or	 r23,r0,r25
	or.u	 r25,r0,hi16(@LC28)
@L694:
	ld	 r13,r24,12
	or	 r2,r23,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r25,lo16(@LC28)
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L694
@L692:
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC29)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC29)
@L690:
	ld	 r13,r22,12
	bcnd	 eq0,r13,@L696
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC30)
	or	 r2,r25,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC30)
	ld	 r24,r22,12
	bcnd	 eq0,r24,@L698
	or	 r23,r0,r25
	or.u	 r25,r0,hi16(@LC31)
@L700:
	ld	 r13,r24,12
	or	 r2,r23,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r25,lo16(@LC31)
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L700
@L698:
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC32)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC32)
@L696:
	ld	 r13,r22,16
	bcnd.n	 eq0,r13,@L702
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC33)
	or	 r2,r25,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC33)
	ld	 r24,r22,16
	bcnd.n	 eq0,r24,@L704
	or	 r23,r0,r25
	or.u	 r25,r0,hi16(@LC34)
@L706:
	ld	 r13,r24,12
	or	 r2,r23,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r25,lo16(@LC34)
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L706
@L704:
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC35)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC35)
@L702:
@Lte20:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L716,@L677-@L717

data
	align	 8
@LC36:
	string	 "binding level \000"
	align	 8
@LC37:
	string	 "%x\000"
	align	 8
@LC38:
	string	 "\n\000"
text
	align	 8
	global	 _print_other_binding_stack
_print_other_binding_stack:
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r22,r31,48
	or	 r22,r0,r2
	st.d	 r24,r31,56
	cmp	 r13,r22,r13
	bb0.n	 ne,r13,@L779
	st.d	 r20,r31,40
@Ltb21:
	or.u	 r20,r0,hi16(__iob+64)
	or	 r21,r20,lo16(__iob+64)
	or.u	 r3,r0,hi16(@LC36)
@L842:
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC36)
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC37)
	or	 r4,r0,r22
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC37)
	or.u	 r3,r0,hi16(@LC38)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC38)
	or.u	 r3,r0,hi16(@LC4)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC4)
	ld	 r4,r22,20
	or.u	 r3,r0,hi16(@LC5)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC5)
	ld.hu	 r4,r22,32
	ld	 r6,r22,32
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC6)
	extu	 r5,r6,4<12>
	or	 r3,r3,lo16(@LC6)
	bsr.n	 _fprintf
	extu	 r6,r6,3<9>
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L843
	or	 r23,r0,0
	or.u	 r3,r0,hi16(@LC7)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC7)
	ld	 r13,r22,32
@L843:
	bb0	 (31-24),r13,@L784
	or.u	 r3,r0,hi16(@LC8)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC8)
@L784:
	ld	 r13,r22,32
	bb0	 (31-25),r13,@L844
	or.u	 r3,r0,hi16(@LC9)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC9)
	ld	 r13,r22,32
@L844:
	bb0	 (31-26),r13,@L786
	or.u	 r3,r0,hi16(@LC10)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC10)
@L786:
	ld	 r13,r22,32
	bb0	 (31-27),r13,@L787
	or.u	 r3,r0,hi16(@LC11)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC11)
@L787:
	or.u	 r3,r0,hi16(@LC12)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC12)
	ld	 r13,r0,r22
	bcnd	 eq0,r13,@L788
	or.u	 r3,r0,hi16(@LC13)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC13)
	ld	 r25,r0,r22
	bcnd.n	 eq0,r25,@L790
	or.u	 r13,r0,hi16(_no_print_functions)
@L840:
	ld	 r13,r13,lo16(_no_print_functions)
	bcnd	 eq0,r13,@L793
	ld.bu	 r13,r25,8
	cmp	 r13,r13,29
	bb1	 eq,r13,@L791
@L793:
	or.u	 r13,r0,hi16(_no_print_builtins)
	ld	 r13,r13,lo16(_no_print_builtins)
	bcnd	 eq0,r13,@L794
	ld.bu	 r13,r25,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L794
	or.u	 r3,r0,hi16(@LC14)
	ld	 r2,r25,12
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC14)
	bcnd	 eq0,r2,@L791
@L794:
	ld.bu	 r13,r25,8
	cmp	 r13,r13,29
	ext	 r13,r13,1<eq>
	mask	 r13,r13,3
	or	 r24,r13,2
	addu	 r23,r23,r24
	cmp	 r13,r23,6
	bb0	 gt,r13,@L797
	or.u	 r3,r0,hi16(@LC15)
	or	 r2,r20,lo16(__iob+64)
	or	 r3,r3,lo16(@LC15)
	bsr.n	 _fprintf
	or	 r23,r0,r24
@L797:
	or	 r2,r20,lo16(__iob+64)
	or	 r4,r0,r25
	or.u	 r3,r0,hi16(@LC16)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC16)
	ld.bu	 r13,r25,8
	bcnd	 eq0,r13,@L790
@L791:
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L840
	or.u	 r13,r0,hi16(_no_print_functions)
@L790:
	bcnd	 eq0,r23,@L788
	or.u	 r3,r0,hi16(@LC17)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC17)
@L788:
	ld	 r13,r22,4
	bcnd	 eq0,r13,@L801
	or.u	 r3,r0,hi16(@LC18)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC18)
	ld	 r25,r22,4
	bcnd.n	 eq0,r25,@L803
	or	 r23,r0,0
@L805:
	ld	 r12,r25,12
	bcnd	 ne0,r12,@L806
	or	 r24,r0,3
	br.n	 @L845
	addu	 r23,r23,r24
	align	 4
@L806:
	ld	 r13,r25,16
	ld	 r13,r13,48
	ld	 r13,r13,32
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L807
	or	 r24,r0,4
	or	 r24,r0,2
@L807:
	addu	 r23,r23,r24
@L845:
	cmp	 r13,r23,5
	bb0.n	 gt,r13,@L810
	or.u	 r3,r0,hi16(@LC19)
	or	 r2,r20,lo16(__iob+64)
	or	 r3,r3,lo16(@LC19)
	bsr.n	 _fprintf
	or	 r23,r0,r24
@L810:
	ld	 r4,r25,12
	bcnd	 ne0,r4,@L811
	ld	 r4,r25,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC20)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC20)
	or.u	 r3,r0,hi16(@LC21)
	or	 r2,r0,r21
	br.n	 @L839
	or	 r3,r3,lo16(@LC21)
	align	 4
@L811:
	ld	 r12,r25,16
	ld	 r13,r12,48
	ld	 r13,r13,32
	cmp	 r13,r4,r13
	bb1.n	 ne,r13,@L813
	or	 r2,r0,r21
	or	 r2,r20,lo16(__iob+64)
	or	 r4,r0,r12
	or.u	 r3,r0,hi16(@LC22)
	or	 r5,r0,0
	or	 r3,r3,lo16(@LC22)
	bsr.n	 _print_node_brief
	addu	 r1,r1,@L846
@L847:
	align	 4
@L813:
	or.u	 r3,r0,hi16(@LC23)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC23)
	ld	 r4,r25,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC24)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC24)
	or.u	 r3,r0,hi16(@LC25)
	or	 r2,r0,r21
	or	 r3,r3,lo16(@LC25)
@L839:
	bsr	 _fprintf
@L804:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L805
@L803:
	bcnd	 eq0,r23,@L801
	or.u	 r3,r0,hi16(@LC26)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC26)
@L801:
	ld	 r13,r22,8
	bcnd	 eq0,r13,@L817
	or.u	 r3,r0,hi16(@LC27)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC27)
	ld	 r25,r22,8
	bcnd	 eq0,r25,@L819
	or.u	 r24,r0,hi16(@LC28)
@L821:
	ld	 r13,r25,12
	or	 r2,r20,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r24,lo16(@LC28)
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L821
@L819:
	or.u	 r3,r0,hi16(@LC29)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC29)
@L817:
	ld	 r13,r22,12
	bcnd	 eq0,r13,@L823
	or.u	 r3,r0,hi16(@LC30)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC30)
	ld	 r25,r22,12
	bcnd	 eq0,r25,@L825
	or.u	 r24,r0,hi16(@LC31)
@L827:
	ld	 r13,r25,12
	or	 r2,r20,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r24,lo16(@LC31)
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L827
@L825:
	or.u	 r3,r0,hi16(@LC32)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC32)
@L823:
	ld	 r13,r22,16
	bcnd.n	 eq0,r13,@L841
	or.u	 r13,r0,hi16(_global_binding_level)
	or.u	 r3,r0,hi16(@LC33)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC33)
	ld	 r25,r22,16
	bcnd	 eq0,r25,@L831
	or.u	 r24,r0,hi16(@LC34)
@L833:
	ld	 r13,r25,12
	or	 r2,r20,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r24,lo16(@LC34)
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L833
@L831:
	or.u	 r3,r0,hi16(@LC35)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC35)
	or.u	 r13,r0,hi16(_global_binding_level)
@L841:
	ld	 r22,r22,28
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r22,r13
	bb1.n	 ne,r13,@L842
	or.u	 r3,r0,hi16(@LC36)
@L779:
@Lte21:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L846,@L804-@L847

data
	align	 8
@LC39:
	string	 "current_binding_level=\000"
	align	 8
@LC40:
	string	 "%x\000"
	align	 8
@LC41:
	string	 "\nclass_binding_level=\000"
	align	 8
@LC42:
	string	 "%x\000"
	align	 8
@LC43:
	string	 "\nglobal_binding_level=\000"
	align	 8
@LC44:
	string	 "%x\000"
	align	 8
@LC45:
	string	 "\n\000"
	align	 8
@LC46:
	string	 "global:\n\000"
text
	align	 8
	global	 _print_binding_stack
_print_binding_stack:
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r24,r31,56
	or.u	 r3,r0,hi16(@LC39)
	st.d	 r22,r31,48
	or.u	 r25,r0,hi16(__iob+64)
	st.d	 r20,r31,40
@Ltb22:
	or	 r25,r25,lo16(__iob+64)
	or	 r3,r3,lo16(@LC39)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or.u	 r23,r0,hi16(_current_binding_level)
	ld	 r4,r23,lo16(_current_binding_level)
	or.u	 r3,r0,hi16(@LC40)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC40)
	or.u	 r3,r0,hi16(@LC41)
	or	 r2,r0,r25
	or	 r3,r3,lo16(@LC41)
	bsr.n	 _fprintf
	or.u	 r24,r0,hi16(_class_binding_level)
	ld	 r4,r24,lo16(_class_binding_level)
	or.u	 r3,r0,hi16(@LC42)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC42)
	or.u	 r3,r0,hi16(@LC43)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC43)
	or	 r2,r0,r25
	or.u	 r13,r0,hi16(_global_binding_level)
	or.u	 r3,r0,hi16(@LC44)
	ld	 r4,r13,lo16(_global_binding_level)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC44)
	or.u	 r3,r0,hi16(@LC45)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC45)
	ld	 r13,r24,lo16(_class_binding_level)
	bcnd.n	 eq0,r13,@L972
	or	 r4,r0,r13
	ld	 r12,r23,lo16(_current_binding_level)
	cmp	 r13,r4,r12
@L1103:
	bb0	 ne,r13,@L974
	ld	 r4,r4,28
	bcnd.n	 ne0,r4,@L1103
	cmp	 r13,r4,r12
@L974:
	bcnd.n	 eq0,r4,@L979
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r4,r13,lo16(_class_binding_level)
	br.n	 @L1104
	or.u	 r13,r0,hi16(_global_binding_level)
	align	 4
@L979:
	br.n	 @L981
	or	 r4,r0,r12
	align	 4
@L972:
	ld	 r4,r23,lo16(_current_binding_level)
@L981:
	or.u	 r13,r0,hi16(_global_binding_level)
@L1104:
	ld	 r13,r13,lo16(_global_binding_level)
	or	 r22,r0,r4
	cmp	 r13,r22,r13
	bb0	 ne,r13,@L982
	or.u	 r20,r0,hi16(__iob+64)
	or	 r21,r20,lo16(__iob+64)
@L986:
	or.u	 r3,r0,hi16(@LC36)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC36)
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC37)
	or	 r4,r0,r22
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC37)
	or.u	 r3,r0,hi16(@LC38)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC38)
	or.u	 r3,r0,hi16(@LC4)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC4)
	ld	 r4,r22,20
	or.u	 r3,r0,hi16(@LC5)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC5)
	ld.hu	 r4,r22,32
	ld	 r6,r22,32
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC6)
	extu	 r5,r6,4<12>
	or	 r3,r3,lo16(@LC6)
	bsr.n	 _fprintf
	extu	 r6,r6,3<9>
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L1108
	or	 r23,r0,0
	or.u	 r3,r0,hi16(@LC7)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC7)
	ld	 r13,r22,32
@L1108:
	bb0	 (31-24),r13,@L989
	or.u	 r3,r0,hi16(@LC8)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC8)
@L989:
	ld	 r13,r22,32
	bb0	 (31-25),r13,@L1109
	or.u	 r3,r0,hi16(@LC9)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC9)
	ld	 r13,r22,32
@L1109:
	bb0	 (31-26),r13,@L991
	or.u	 r3,r0,hi16(@LC10)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC10)
@L991:
	ld	 r13,r22,32
	bb0	 (31-27),r13,@L992
	or.u	 r3,r0,hi16(@LC11)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC11)
@L992:
	or.u	 r3,r0,hi16(@LC12)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC12)
	ld	 r13,r0,r22
	bcnd	 eq0,r13,@L993
	or.u	 r3,r0,hi16(@LC13)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC13)
	ld	 r25,r0,r22
	bcnd.n	 eq0,r25,@L995
	or.u	 r13,r0,hi16(_no_print_functions)
@L1105:
	ld	 r13,r13,lo16(_no_print_functions)
	bcnd	 eq0,r13,@L998
	ld.bu	 r13,r25,8
	cmp	 r13,r13,29
	bb1	 eq,r13,@L996
@L998:
	or.u	 r13,r0,hi16(_no_print_builtins)
	ld	 r13,r13,lo16(_no_print_builtins)
	bcnd	 eq0,r13,@L999
	ld.bu	 r13,r25,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L999
	or.u	 r3,r0,hi16(@LC14)
	ld	 r2,r25,12
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC14)
	bcnd	 eq0,r2,@L996
@L999:
	ld.bu	 r13,r25,8
	cmp	 r13,r13,29
	ext	 r13,r13,1<eq>
	mask	 r13,r13,3
	or	 r24,r13,2
	addu	 r23,r23,r24
	cmp	 r13,r23,6
	bb0	 gt,r13,@L1002
	or.u	 r3,r0,hi16(@LC15)
	or	 r2,r20,lo16(__iob+64)
	or	 r3,r3,lo16(@LC15)
	bsr.n	 _fprintf
	or	 r23,r0,r24
@L1002:
	or	 r2,r20,lo16(__iob+64)
	or	 r4,r0,r25
	or.u	 r3,r0,hi16(@LC16)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC16)
	ld.bu	 r13,r25,8
	bcnd	 eq0,r13,@L995
@L996:
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L1105
	or.u	 r13,r0,hi16(_no_print_functions)
@L995:
	bcnd	 eq0,r23,@L993
	or.u	 r3,r0,hi16(@LC17)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC17)
@L993:
	ld	 r13,r22,4
	bcnd	 eq0,r13,@L1006
	or.u	 r3,r0,hi16(@LC18)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC18)
	ld	 r25,r22,4
	bcnd.n	 eq0,r25,@L1008
	or	 r23,r0,0
@L1010:
	ld	 r12,r25,12
	bcnd	 ne0,r12,@L1011
	or	 r24,r0,3
	br.n	 @L1112
	addu	 r23,r23,r24
	align	 4
@L1011:
	ld	 r13,r25,16
	ld	 r13,r13,48
	ld	 r13,r13,32
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L1012
	or	 r24,r0,4
	or	 r24,r0,2
@L1012:
	addu	 r23,r23,r24
@L1112:
	cmp	 r13,r23,5
	bb0.n	 gt,r13,@L1015
	or.u	 r3,r0,hi16(@LC19)
	or	 r2,r20,lo16(__iob+64)
	or	 r3,r3,lo16(@LC19)
	bsr.n	 _fprintf
	or	 r23,r0,r24
@L1015:
	ld	 r4,r25,12
	bcnd	 ne0,r4,@L1016
	ld	 r4,r25,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC20)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC20)
	or.u	 r3,r0,hi16(@LC21)
	or	 r2,r0,r21
	br.n	 @L1101
	or	 r3,r3,lo16(@LC21)
	align	 4
@L1016:
	ld	 r12,r25,16
	ld	 r13,r12,48
	ld	 r13,r13,32
	cmp	 r13,r4,r13
	bb1.n	 ne,r13,@L1018
	or	 r2,r0,r21
	or	 r2,r20,lo16(__iob+64)
	or	 r4,r0,r12
	or.u	 r3,r0,hi16(@LC22)
	or	 r5,r0,0
	or	 r3,r3,lo16(@LC22)
	bsr.n	 _print_node_brief
	addu	 r1,r1,@L1114
@L1115:
	align	 4
@L1018:
	or.u	 r3,r0,hi16(@LC23)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC23)
	ld	 r4,r25,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC24)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC24)
	or.u	 r3,r0,hi16(@LC25)
	or	 r2,r0,r21
	or	 r3,r3,lo16(@LC25)
@L1101:
	bsr	 _fprintf
@L1009:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L1010
@L1008:
	bcnd	 eq0,r23,@L1006
	or.u	 r3,r0,hi16(@LC26)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC26)
@L1006:
	ld	 r13,r22,8
	bcnd	 eq0,r13,@L1022
	or.u	 r3,r0,hi16(@LC27)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC27)
	ld	 r25,r22,8
	bcnd	 eq0,r25,@L1024
	or.u	 r24,r0,hi16(@LC28)
@L1026:
	ld	 r13,r25,12
	or	 r2,r20,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r24,lo16(@LC28)
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L1026
@L1024:
	or.u	 r3,r0,hi16(@LC29)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC29)
@L1022:
	ld	 r13,r22,12
	bcnd	 eq0,r13,@L1028
	or.u	 r3,r0,hi16(@LC30)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC30)
	ld	 r25,r22,12
	bcnd	 eq0,r25,@L1030
	or.u	 r24,r0,hi16(@LC31)
@L1032:
	ld	 r13,r25,12
	or	 r2,r20,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r24,lo16(@LC31)
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L1032
@L1030:
	or.u	 r3,r0,hi16(@LC32)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC32)
@L1028:
	ld	 r13,r22,16
	bcnd.n	 eq0,r13,@L1106
	or.u	 r13,r0,hi16(_global_binding_level)
	or.u	 r3,r0,hi16(@LC33)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC33)
	ld	 r25,r22,16
	bcnd	 eq0,r25,@L1036
	or.u	 r24,r0,hi16(@LC34)
@L1038:
	ld	 r13,r25,12
	or	 r2,r20,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r24,lo16(@LC34)
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L1038
@L1036:
	or.u	 r3,r0,hi16(@LC35)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC35)
	or.u	 r13,r0,hi16(_global_binding_level)
@L1106:
	ld	 r22,r22,28
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r22,r13
	bb1	 ne,r13,@L986
@L982:
	or.u	 r21,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC46)
	or	 r25,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC46)
	bsr.n	 _fprintf
	or	 r2,r0,r25
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC4)
	or.u	 r13,r0,hi16(_global_binding_level)
	or	 r3,r3,lo16(@LC4)
	bsr.n	 _fprintf
	ld	 r22,r13,lo16(_global_binding_level)
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC5)
	ld	 r4,r22,20
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC5)
	ld.hu	 r4,r22,32
	ld	 r6,r22,32
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC6)
	extu	 r5,r6,4<12>
	or	 r3,r3,lo16(@LC6)
	bsr.n	 _fprintf
	extu	 r6,r6,3<9>
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L1110
	or	 r23,r0,0
	or.u	 r3,r0,hi16(@LC7)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC7)
	ld	 r13,r22,32
@L1110:
	bb0	 (31-24),r13,@L1043
	or.u	 r3,r0,hi16(@LC8)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC8)
@L1043:
	ld	 r13,r22,32
	bb0	 (31-25),r13,@L1111
	or.u	 r3,r0,hi16(@LC9)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC9)
	ld	 r13,r22,32
@L1111:
	bb0	 (31-26),r13,@L1045
	or.u	 r3,r0,hi16(@LC10)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC10)
@L1045:
	ld	 r13,r22,32
	bb0	 (31-27),r13,@L1046
	or.u	 r3,r0,hi16(@LC11)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC11)
@L1046:
	or.u	 r3,r0,hi16(@LC12)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC12)
	ld	 r13,r0,r22
	bcnd	 eq0,r13,@L1047
	or.u	 r3,r0,hi16(@LC13)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC13)
	ld	 r24,r0,r22
	bcnd.n	 eq0,r24,@L1049
	or.u	 r13,r0,hi16(_no_print_functions)
@L1107:
	ld	 r13,r13,lo16(_no_print_functions)
	bcnd	 eq0,r13,@L1052
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 eq,r13,@L1050
@L1052:
	or.u	 r13,r0,hi16(_no_print_builtins)
	ld	 r13,r13,lo16(_no_print_builtins)
	bcnd	 eq0,r13,@L1053
	ld.bu	 r13,r24,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L1053
	or.u	 r3,r0,hi16(@LC14)
	ld	 r2,r24,12
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC14)
	bcnd	 eq0,r2,@L1050
@L1053:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	ext	 r13,r13,1<eq>
	mask	 r13,r13,3
	or	 r25,r13,2
	addu	 r23,r23,r25
	cmp	 r13,r23,6
	bb0	 gt,r13,@L1056
	or.u	 r3,r0,hi16(@LC15)
	or	 r2,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC15)
	bsr.n	 _fprintf
	or	 r23,r0,r25
@L1056:
	or	 r2,r21,lo16(__iob+64)
	or	 r4,r0,r24
	or.u	 r3,r0,hi16(@LC16)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC16)
	ld.bu	 r13,r24,8
	bcnd	 eq0,r13,@L1049
@L1050:
	ld	 r24,r0,r24
	bcnd.n	 ne0,r24,@L1107
	or.u	 r13,r0,hi16(_no_print_functions)
@L1049:
	bcnd.n	 eq0,r23,@L1047
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC17)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC17)
@L1047:
	ld	 r13,r22,4
	bcnd	 eq0,r13,@L1060
	or.u	 r21,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC18)
	or	 r25,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC18)
	bsr.n	 _fprintf
	or	 r2,r0,r25
	ld	 r24,r22,4
	bcnd.n	 eq0,r24,@L1062
	or	 r23,r0,0
	or	 r20,r0,r21
	or	 r21,r0,r25
@L1064:
	ld	 r12,r24,12
	bcnd	 ne0,r12,@L1065
	or	 r25,r0,3
	br.n	 @L1113
	addu	 r23,r23,r25
	align	 4
@L1065:
	ld	 r13,r24,16
	ld	 r13,r13,48
	ld	 r13,r13,32
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L1066
	or	 r25,r0,4
	or	 r25,r0,2
@L1066:
	addu	 r23,r23,r25
@L1113:
	cmp	 r13,r23,5
	bb0.n	 gt,r13,@L1069
	or.u	 r3,r0,hi16(@LC19)
	or	 r2,r20,lo16(__iob+64)
	or	 r3,r3,lo16(@LC19)
	bsr.n	 _fprintf
	or	 r23,r0,r25
@L1069:
	ld	 r4,r24,12
	bcnd	 ne0,r4,@L1070
	ld	 r4,r24,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC20)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC20)
	or.u	 r3,r0,hi16(@LC21)
	or	 r2,r0,r21
	br.n	 @L1102
	or	 r3,r3,lo16(@LC21)
	align	 4
@L1070:
	ld	 r12,r24,16
	ld	 r13,r12,48
	ld	 r13,r13,32
	cmp	 r13,r4,r13
	bb1.n	 ne,r13,@L1072
	or	 r2,r0,r21
	or	 r2,r20,lo16(__iob+64)
	or	 r4,r0,r12
	or.u	 r3,r0,hi16(@LC22)
	or	 r5,r0,0
	or	 r3,r3,lo16(@LC22)
	bsr.n	 _print_node_brief
	addu	 r1,r1,@L1116
@L1117:
	align	 4
@L1072:
	or.u	 r3,r0,hi16(@LC23)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC23)
	ld	 r4,r24,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC24)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC24)
	or.u	 r3,r0,hi16(@LC25)
	or	 r2,r0,r21
	or	 r3,r3,lo16(@LC25)
@L1102:
	bsr	 _fprintf
@L1063:
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L1064
@L1062:
	bcnd.n	 eq0,r23,@L1060
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC26)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC26)
@L1060:
	ld	 r13,r22,8
	bcnd	 eq0,r13,@L1076
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC27)
	or	 r2,r25,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC27)
	ld	 r24,r22,8
	bcnd	 eq0,r24,@L1078
	or	 r23,r0,r25
	or.u	 r25,r0,hi16(@LC28)
@L1080:
	ld	 r13,r24,12
	or	 r2,r23,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r25,lo16(@LC28)
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L1080
@L1078:
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC29)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC29)
@L1076:
	ld	 r13,r22,12
	bcnd	 eq0,r13,@L1082
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC30)
	or	 r2,r25,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC30)
	ld	 r24,r22,12
	bcnd	 eq0,r24,@L1084
	or	 r23,r0,r25
	or.u	 r25,r0,hi16(@LC31)
@L1086:
	ld	 r13,r24,12
	or	 r2,r23,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r25,lo16(@LC31)
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L1086
@L1084:
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC32)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC32)
@L1082:
	ld	 r13,r22,16
	bcnd.n	 eq0,r13,@L1041
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC33)
	or	 r2,r25,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC33)
	ld	 r24,r22,16
	bcnd.n	 eq0,r24,@L1090
	or	 r23,r0,r25
	or.u	 r25,r0,hi16(@LC34)
@L1092:
	ld	 r13,r24,12
	or	 r2,r23,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r25,lo16(@LC34)
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L1092
@L1090:
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC35)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC35)
@L1041:
@Lte22:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L1116,@L1063-@L1117
	def	 @L1114,@L1009-@L1115

	align	 8
	global	 _push_to_top_level
_push_to_top_level:
	subu	 r31,r31,80
	st	 r1,r31,64
	st	 r19,r31,36
	st.d	 r24,r31,56
	st.d	 r22,r31,48
	or	 r2,r0,32
	bsr.n	 _xmalloc
	st.d	 r20,r31,40
@Ltb23:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r22,r13,lo16(_current_binding_level)
	or	 r21,r0,0
	bcnd.n	 eq0,r22,@L1148
	or	 r20,r0,r2
	or.u	 r19,r0,hi16(_global_binding_level)
@L1150:
	ld	 r23,r0,r22
	bcnd	 eq0,r23,@L1152
@L1154:
	ld	 r13,r19,lo16(_global_binding_level)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1153
	ld	 r25,r23,60
	bcnd	 eq0,r25,@L1153
	ld	 r13,r25,24
	bcnd	 ne0,r13,@L1156
	ld	 r13,r25,28
	bcnd	 eq0,r13,@L1153
@L1156:
	bcnd.n	 eq0,r21,@L1159
	or	 r12,r0,r21
@L1161:
	ld	 r13,r12,16
	cmp	 r13,r13,r25
	bb1	 eq,r13,@L1153
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L1161
@L1159:
	bsr.n	 _make_tree_vec
	or	 r2,r0,4
	bcnd.n	 eq0,r25,@L1165
	or	 r24,r0,r2
	ld.bu	 r2,r25,8
	cmp	 r2,r2,1
	or	 r3,r0,135
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	st	 r25,r24,16
	ld	 r13,r25,4
	st	 r13,r24,20
	ld	 r13,r25,24
	st	 r13,r24,24
	ld	 r13,r25,28
	st	 r13,r24,28
	or	 r2,r0,r25
	st	 r0,r25,24
	bsr.n	 _adjust_type_value
	st	 r0,r2,28
@L1165:
	st	 r21,r0,r24
	or	 r21,r0,r24
@L1153:
	ld	 r23,r0,r23
	bcnd	 ne0,r23,@L1154
@L1152:
	ld	 r13,r19,lo16(_global_binding_level)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1149
	ld	 r23,r22,16
	bcnd	 eq0,r23,@L1149
@L1171:
	ld	 r12,r23,12
	ld	 r13,r23,16
	st	 r13,r12,4
	ld	 r23,r0,r23
	bcnd	 ne0,r23,@L1171
@L1149:
	ld	 r22,r22,28
	bcnd	 ne0,r22,@L1150
@L1148:
	or.u	 r7,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r25,r7,lo16(_current_binding_level)
	or.u	 r24,r0,hi16(_current_class_name)
	ld	 r2,r13,lo16(_global_binding_level)
	or.u	 r3,r0,hi16(_current_class_type)
	ld	 r4,r24,lo16(_current_class_name)
	or.u	 r10,r0,hi16(_current_class_decl)
	ld	 r6,r3,lo16(_current_class_type)
	or.u	 r5,r0,hi16(_current_function_decl)
	ld	 r11,r10,lo16(_current_class_decl)
	or.u	 r9,r0,hi16(_class_binding_level)
	ld	 r12,r5,lo16(_current_function_decl)
	or.u	 r8,r0,hi16(_current_saved_scope)
	ld	 r13,r9,lo16(_class_binding_level)
	ld	 r1,r8,lo16(_current_saved_scope)
	st	 r21,r20,4
	st	 r25,r0,r20
	st	 r4,r20,12
	st	 r6,r20,16
	st	 r11,r20,20
	st	 r12,r20,24
	st	 r13,r20,28
	st	 r1,r20,8
@Lte23:
	ld	 r1,r31,64
	ld	 r19,r31,36
	st	 r0,r24,lo16(_current_class_name)
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	st	 r20,r8,lo16(_current_saved_scope)
	ld.d	 r20,r31,40
	st	 r2,r7,lo16(_current_binding_level)
	st	 r0,r10,lo16(_current_class_decl)
	st	 r0,r3,lo16(_current_class_type)
	st	 r0,r5,lo16(_current_function_decl)
	addu	 r31,r31,80
	jmp.n	 r1
	st	 r0,r9,lo16(_class_binding_level)

	align	 8
	global	 _pop_from_top_level
_pop_from_top_level:
	or.u	 r10,r0,hi16(_current_saved_scope)
	ld	 r2,r10,lo16(_current_saved_scope)
	subu	 r31,r31,48
	st	 r1,r31,36
@Ltb24:
	ld	 r9,r2,4
	ld	 r12,r0,r2
	ld	 r11,r2,8
	or.u	 r13,r0,hi16(_current_binding_level)
	st	 r12,r13,lo16(_current_binding_level)
	bcnd.n	 eq0,r9,@L1188
	st	 r11,r10,lo16(_current_saved_scope)
@L1190:
	ld	 r12,r9,16
	bcnd	 eq0,r12,@L1189
	ld	 r13,r9,20
	st	 r13,r12,4
	ld	 r13,r9,24
	st	 r13,r12,24
	ld	 r13,r9,28
	st	 r13,r12,28
@L1189:
	ld	 r9,r0,r9
	bcnd	 ne0,r9,@L1190
@L1188:
	ld	 r12,r2,12
	ld	 r11,r2,16
	or.u	 r13,r0,hi16(_current_class_name)
	st	 r12,r13,lo16(_current_class_name)
	ld	 r12,r2,20
	or.u	 r13,r0,hi16(_current_class_type)
	st	 r11,r13,lo16(_current_class_type)
	or.u	 r13,r0,hi16(_current_class_decl)
	bcnd.n	 eq0,r11,@L1193
	st	 r12,r13,lo16(_current_class_decl)
	ld	 r13,r11,80
	ld	 r12,r13,96
	or.u	 r13,r0,hi16(_C_C_D)
	br.n	 @L1194
	st	 r12,r13,lo16(_C_C_D)
	align	 4
@L1193:
	or.u	 r13,r0,hi16(_C_C_D)
	st	 r0,r13,lo16(_C_C_D)
@L1194:
	ld	 r12,r2,24
	or.u	 r13,r0,hi16(_current_function_decl)
	st	 r12,r13,lo16(_current_function_decl)
	ld	 r12,r2,28
	or.u	 r13,r0,hi16(_class_binding_level)
	bsr.n	 _free
	st	 r12,r13,lo16(_class_binding_level)
@Lte24:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _set_identifier_type_value
_set_identifier_type_value:
	subu	 r31,r31,64
	or.u	 r13,r0,hi16(_global_binding_level)
	st.d	 r24,r31,40
	or.u	 r24,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	ld	 r12,r24,lo16(_current_binding_level)
	or	 r25,r0,r2
	st	 r23,r31,36
	or	 r23,r0,r3
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1201
	st	 r1,r31,48
@Ltb25:
	ld	 r3,r25,4
	bsr.n	 _tree_cons
	ld	 r4,r12,16
	ld	 r13,r24,lo16(_current_binding_level)
	br.n	 @L1202
	st	 r2,r13,16
	align	 4
@L1201:
	or.u	 r24,r0,hi16(_class_binding_level)
	ld	 r13,r24,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L1202
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r24,lo16(_class_binding_level)
	st	 r2,r13,16
@L1202:
	st	 r23,r25,4
@Lte25:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
	global	 _set_identifier_local_value
_set_identifier_local_value:
	subu	 r31,r31,64
	or.u	 r13,r0,hi16(_global_binding_level)
	st.d	 r24,r31,40
	or.u	 r24,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	ld	 r12,r24,lo16(_current_binding_level)
	or	 r25,r0,r2
	st	 r23,r31,36
	or	 r23,r0,r3
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1210
	st	 r1,r31,48
@Ltb26:
	ld	 r3,r25,24
	bsr.n	 _tree_cons
	ld	 r4,r12,8
	ld	 r13,r24,lo16(_current_binding_level)
	br.n	 @L1211
	st	 r2,r13,8
	align	 4
@L1210:
	or.u	 r24,r0,hi16(_class_binding_level)
	ld	 r13,r24,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L1211
	ld	 r3,r25,24
	ld	 r4,r13,8
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r24,lo16(_class_binding_level)
	st	 r2,r13,8
@L1211:
	st	 r23,r25,24
@Lte26:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC47:
	string	 "%s::%s\000"
text
	align	 8
_set_nested_typename:
	subu	 r31,r31,64
	st	 r1,r31,52
	st	 r30,r31,48
	st.d	 r22,r31,32
	or	 r23,r0,r2
	st.d	 r24,r31,40
	addu	 r30,r31,48
@Ltb27:
	ld.bu	 r2,r23,8
	or	 r25,r0,r3
	or	 r24,r0,r4
	cmp	 r2,r2,32
	or	 r3,r0,136
	extu	 r2,r2,1<eq>
	bsr.n	 _my_friendly_assert
	or	 r22,r0,r5
	bcnd	 eq0,r25,@L1215
	ld.bu	 r2,r25,8
	cmp	 r2,r2,1
	or	 r3,r0,137
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	ld.bu	 r2,r24,8
	cmp	 r2,r2,1
	or	 r3,r0,138
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	ld	 r13,r24,12
	ld	 r12,r25,12
	addu	 r13,r13,r12
	addu	 r13,r13,19
	or.u	 r3,r0,hi16(@LC47)
	and	 r13,r13,0xfff0
	ld	 r4,r25,16
	subu	 r31,r31,r13
	ld	 r5,r24,16
	addu	 r25,r31,32
	or	 r3,r3,lo16(@LC47)
	bsr.n	 _sprintf
	or	 r2,r0,r25
	bsr.n	 _get_identifier
	or	 r2,r0,r25
	st	 r2,r23,40
	br.n	 @L1216
	st	 r22,r2,4
	align	 4
@L1215:
	st	 r24,r23,40
@L1216:
@Lte27:
	subu	 r31,r30,48
	ld	 r1,r31,52
	ld	 r30,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
	global	 _pushtag
_pushtag:
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r24,r31,56
	or	 r24,r0,r2
	st.d	 r22,r31,48
	or	 r23,r0,r3
	bcnd.n	 eq0,r13,@L1265
	st.d	 r20,r31,40
@Ltb28:
	br.n	 @L1266
	or	 r22,r0,r13
	align	 4
@L1265:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r22,r13,lo16(_current_binding_level)
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L1317
	or.u	 r13,r0,hi16(_global_binding_level)
@L1269:
	ld	 r22,r22,28
	ld	 r13,r22,32
	bb1	 (31-23),r13,@L1269
@L1266:
	or.u	 r13,r0,hi16(_global_binding_level)
@L1317:
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r22,r13
	bb1.n	 ne,r13,@L1271
	or	 r2,r0,r24
	ld	 r4,r22,4
	or	 r3,r0,r23
	bsr.n	 _perm_tree_cons
	addu	 r1,r1,@L1323
@L1324:
	align	 4
@L1271:
	ld	 r4,r22,4
	bsr.n	 _saveable_tree_cons
	or	 r3,r0,r23
@L1312:
	bcnd.n	 eq0,r24,@L1273
	st	 r2,r22,4
	ld	 r13,r23,48
	bcnd	 ne0,r13,@L1274
	st	 r24,r23,48
@L1274:
	ld	 r13,r24,4
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L1275
	ld.bu	 r13,r23,8
	cmp	 r13,r13,21
	bb1.n	 ne,r13,@L1318
	or.u	 r13,r0,hi16(_current_class_type)
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L1276
	ld	 r13,r23,80
	ld	 r13,r0,r13
	bb1	 (31-28),r13,@L1275
@L1276:
	or.u	 r13,r0,hi16(_current_class_type)
@L1318:
	ld	 r11,r13,lo16(_current_class_type)
	bcnd	 eq0,r11,@L1278
	ld	 r13,r11,16
	bcnd.n	 eq0,r13,@L1277
	or	 r4,r0,r23
@L1278:
	or.u	 r13,r0,hi16(_current_lang_name)
	or.u	 r12,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_current_lang_name)
	ld	 r12,r12,lo16(_lang_name_cplusplus)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1279
	or	 r25,r0,0
	bcnd.n	 eq0,r11,@L1280
	or	 r3,r0,0
	ld	 r3,r11,48
@L1280:
	bsr.n	 _lookup_nested_type
	or	 r2,r0,r23
	or	 r25,r0,r2
@L1279:
	bcnd.n	 ne0,r25,@L1283
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,1
	bsr.n	 _build_overload_name
	or	 r4,r0,1
	bsr.n	 _get_identifier
	or.u	 r21,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r21,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	st	 r2,r25,60
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1285
	st	 r0,r25,16
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r21,lo16(_current_binding_level)
	br.n	 @L1319
	st	 r2,r13,16
	align	 4
@L1285:
	or.u	 r21,r0,hi16(_class_binding_level)
	ld	 r13,r21,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L1286
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r21,lo16(_class_binding_level)
	st	 r2,r13,16
@L1286:
@L1319:
	br.n	 @L1288
	st	 r23,r24,4
	align	 4
@L1283:
	ld	 r25,r25,48
@L1288:
	ld	 r12,r24,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L1290
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb0	 ne,r13,@L1320
@L1290:
	ld	 r13,r23,48
	bcnd	 eq0,r13,@L1294
	ld.bu	 r13,r13,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L1321
	or.u	 r13,r0,hi16(_class_binding_level)
	or	 r2,r0,r24
	bsr.n	 _lookup_name
	or	 r3,r0,1
	ld	 r13,r23,48
	cmp	 r2,r2,r13
	bb0.n	 ne,r2,@L1294
	or.u	 r13,r0,hi16(_class_binding_level)
@L1321:
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd.n	 ne0,r13,@L1314
	or	 r2,r0,r25
	bsr.n	 _pushdecl
	addu	 r1,r1,@L1325
@L1326:
	align	 4
@L1277:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_lang_field_decl
	or.u	 r21,r0,hi16(_current_binding_level)
	ld	 r12,r21,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1296
	or	 r25,r0,r2
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r21,lo16(_current_binding_level)
	br.n	 @L1297
	st	 r2,r13,16
	align	 4
@L1296:
	or.u	 r21,r0,hi16(_class_binding_level)
	ld	 r13,r21,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L1297
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r21,lo16(_class_binding_level)
	st	 r2,r13,16
@L1297:
	or	 r2,r0,r25
	st	 r23,r24,4
@L1314:
	bsr	 _pushdecl_class_level
@L1315:
	or	 r25,r0,r2
@L1294:
	ld	 r12,r24,16
@L1320:
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1.n	 ne,r13,@L1322
	or.u	 r20,r0,hi16(_current_class_type)
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L1322
	ld	 r13,r25,28
	or.u	 r13,r13,0x2
	st	 r13,r25,28
	or.u	 r20,r0,hi16(_current_class_type)
@L1322:
	ld	 r11,r20,lo16(_current_class_type)
	bcnd.n	 ne0,r11,@L1302
	st	 r25,r23,48
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	bcnd	 eq0,r13,@L1301
@L1302:
	or.u	 r13,r0,hi16(_current_lang_name)
	or.u	 r12,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_current_lang_name)
	ld	 r12,r12,lo16(_lang_name_cplusplus)
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L1300
	or.u	 r21,r0,hi16(_current_function_decl)
@L1301:
	br.n	 @L1275
	st	 r24,r25,40
	align	 4
@L1300:
	ld	 r13,r21,lo16(_current_function_decl)
	bcnd.n	 eq0,r13,@L1304
	or	 r2,r0,r25
	or	 r4,r0,r24
	ld	 r3,r13,60
	bsr.n	 _set_nested_typename
	or	 r5,r0,r23
	ld	 r13,r21,lo16(_current_function_decl)
	br.n	 @L1275
	st	 r13,r25,36
	align	 4
@L1304:
	ld	 r13,r11,16
	bcnd	 ne0,r13,@L1275
	ld	 r13,r11,48
	or	 r2,r0,r25
	or	 r4,r0,r24
	ld	 r3,r13,40
	bsr.n	 _set_nested_typename
	or	 r5,r0,r23
	ld	 r13,r20,lo16(_current_class_type)
	ld	 r12,r25,80
	st	 r13,r25,36
	st	 r13,r12,8
@L1275:
	ld	 r13,r22,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1	 ne,r13,@L1273
	ld	 r13,r23,8
	or.u	 r12,r0,hi16(_current_class_type)
	ld	 r11,r23,48
	ld	 r12,r12,lo16(_current_class_type)
	or	 r13,r13,512
	st	 r13,r23,8
	st	 r11,r24,28
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L1273
	ld	 r12,r12,80
	ld	 r13,r22,4
	st	 r13,r12,48
@L1273:
	ld	 r12,r23,48
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb0.n	 eq,r13,@L1309
	or	 r2,r0,32
	br.n	 @L1310
	st	 r12,r0,r23
	align	 4
@L1309:
	or	 r3,r0,0
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr	 _pushdecl
	st	 r2,r0,r23
@L1310:
@Lte28:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L1325,@L1315-@L1326
	def	 @L1323,@L1312-@L1324

data
	align	 4
_anon_cnt:
	word	 0
	align	 8
@LC48:
	string	 "$_%d\000"
text
	align	 8
	global	 _make_anon_name
_make_anon_name:
	or.u	 r12,r0,hi16(_anon_cnt)
	ld	 r4,r12,lo16(_anon_cnt)
	subu	 r31,r31,80
	or.u	 r3,r0,hi16(@LC48)
	st	 r1,r31,36
@Ltb29:
	addu	 r2,r31,40
	or	 r3,r3,lo16(@LC48)
	addu	 r13,r4,1
	bsr.n	 _sprintf
	st	 r13,r12,lo16(_anon_cnt)
	bsr.n	 _get_identifier
	addu	 r2,r31,40
@Lte29:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,80

data
	align	 4
_last_cnt.68:
	word	 0
text
	align	 8
	global	 _clear_anon_tags
_clear_anon_tags:
@Ltb30:
	or.u	 r9,r0,hi16(_last_cnt.68)
	or.u	 r8,r0,hi16(_anon_cnt)
	ld	 r9,r9,lo16(_last_cnt.68)
	ld	 r8,r8,lo16(_anon_cnt)
	cmp	 r9,r9,r8
	bb0.n	 ne,r9,@L1356
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,32
	bb0	 (31-23),r9,@L1344
@L1345:
	ld	 r8,r8,28
	ld	 r9,r8,32
	bb1	 (31-23),r9,@L1345
@L1344:
	ld	 r8,r8,4
	bcnd.n	 eq0,r8,@L1355
	or.u	 r9,r0,hi16(_anon_cnt)
@L1349:
	ld	 r9,r8,12
	bcnd	 eq0,r9,@L1348
	ld	 r7,r9,16
	ld.b	 r9,r0,r7
	cmp	 r9,r9,36
	bb1	 ne,r9,@L1351
	ld.b	 r9,r7,1
	cmp	 r9,r9,95
	bb1	 ne,r9,@L1351
	st	 r0,r8,12
@L1351:
	ld	 r8,r0,r8
	bcnd	 ne0,r8,@L1349
@L1348:
	or.u	 r9,r0,hi16(_anon_cnt)
@L1355:
	ld	 r8,r9,lo16(_anon_cnt)
	or.u	 r9,r0,hi16(_last_cnt.68)
	st	 r8,r9,lo16(_last_cnt.68)
@L1356:
	jmp	 r1
@Lte30:

data
	align	 8
@LC49:
	string	 "`%s' redeclared as member function\000"
	align	 8
@LC50:
	string	 "`%s' redeclared as non-member function\000"
	align	 8
@LC51:
	string	 "declaration of `%s' with different language linka"
	string	 "ge\000"
	align	 8
@LC52:
	string	 "previous declaration here\000"
	align	 8
@LC53:
	string	 "`%s' redeclared as different kind of symbol\000"
	align	 8
@LC54:
	string	 "previous declaration of `%s'\000"
	align	 8
@LC55:
	string	 "declaration of `%s'\000"
	align	 8
@LC56:
	string	 "conflicts with built-in declaration `%s'\000"
	align	 8
@LC57:
	string	 "conflicting types for `%s'\000"
	align	 8
@LC58:
	string	 "A parameter list with an ellipsis can't match\000"
	align	 8
@LC59:
	string	 "an empty parameter name list declaration.\000"
	align	 8
@LC60:
	string	 "An argument type that has a default promotion\000"
	align	 8
@LC61:
	string	 "can't match an empty parameter name list declarat"
	string	 "ion.\000"
	align	 8
@LC62:
	string	 "previous declaration of `%s'\000"
	align	 8
@LC63:
	string	 "constructor cannot take as argument the type bein"
	string	 "g constructed\000"
	align	 8
@LC64:
	string	 "`%s' previously defined here\000"
	align	 8
@LC65:
	string	 "`%s' previously declared here\000"
	align	 8
@LC66:
	string	 "prototype for `%s'\000"
	align	 8
@LC67:
	string	 "follows non-prototype definition here\000"
	align	 8
@LC68:
	string	 "type qualifiers for `%s' conflict with previous d"
	string	 "ecl\000"
	align	 8
@LC69:
	string	 "redundant redeclaration of `%s' in same scope\000"
	align	 8
@LC70:
	string	 "previous declaration of `%s'\000"
	align	 8
@LC71:
	string	 "declaration of `%s' raises different exceptions.."
	string	 ".\000"
	align	 8
@LC72:
	string	 "...from previous declaration here\000"
text
	align	 8
_duplicate_decls:
	subu	 r31,r31,144
	st	 r1,r31,80
	st	 r17,r31,44
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	or	 r23,r0,r3
	st.d	 r18,r31,48
@Ltb31:
	ld.bu	 r13,r23,8
	or	 r24,r0,r2
	cmp	 r13,r13,3
	ld	 r17,r23,24
	bb1.n	 ne,r13,@L1519
	or	 r18,r0,0
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1401
	ld	 r13,r23,16
	bcnd.n	 ne0,r13,@L1374
	or	 r25,r0,r23
	or	 r2,r0,1
	br.n	 @L1518
	st	 r24,r23,16
	align	 4
@L1374:
	bcnd.n	 eq0,r23,@L1518
	or	 r2,r0,1
@L1377:
	ld	 r9,r25,16
	st	 r24,r31,88
	st	 r9,r31,92
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1380
	ld.bu	 r13,r9,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1380
	ld	 r13,r24,4
	ld	 r12,r9,4
	ld	 r11,r13,12
	ld	 r10,r12,12
	st	 r13,r31,120
	st	 r12,r31,128
	st	 r11,r31,124
	st	 r10,r31,132
	ld.bu	 r13,r13,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L1381
	ld	 r13,r9,80
	ld	 r13,r0,r13
	bb0.n	 (31-13),r13,@L1381
	addu	 r2,r31,120
	addu	 r3,r31,88
	br.n	 @L1523
	addu	 r4,r31,124
	align	 4
@L1381:
	ld	 r13,r31,128
	ld.bu	 r13,r13,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L1382
	ld	 r13,r31,88
	ld	 r13,r13,80
	ld	 r13,r0,r13
	bb0.n	 (31-13),r13,@L1382
	addu	 r2,r31,128
	addu	 r3,r31,92
	addu	 r4,r31,132
@L1523:
	bsr	 _revert_static_member_fn
@L1382:
	ld	 r11,r31,120
	ld	 r10,r31,128
	ld.bu	 r12,r11,8
	ld.bu	 r13,r10,8
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1384
	cmp	 r13,r12,14
	bb1.n	 ne,r13,@L1385
	or.u	 r3,r0,hi16(@LC49)
	ld	 r2,r31,88
	br.n	 @L1524
	or	 r3,r3,lo16(@LC49)
	align	 4
@L1385:
	or.u	 r3,r0,hi16(@LC50)
	ld	 r2,r31,88
	or	 r3,r3,lo16(@LC50)
@L1524:
	bsr	 _compiler_error_with_decl
	br.n	 @L1379
	or	 r2,r0,0
	align	 4
@L1384:
	ld	 r13,r11,4
	ld	 r12,r10,4
	ld	 r2,r13,64
	ld	 r3,r12,64
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L1387
	or	 r4,r0,1
	ld	 r2,r31,124
	ld	 r3,r31,132
	bsr.n	 _compparms
	addu	 r1,r1,@L1535
@L1536:
	align	 4
@L1387:
	br.n	 @L1379
	or	 r2,r0,0
	align	 4
@L1380:
	ld	 r13,r31,88
	or.u	 r12,r0,hi16(_error_mark_node)
	ld	 r2,r13,4
	ld	 r13,r12,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb1	 ne,r13,@L1390
	ld	 r13,r31,92
	ld	 r13,r13,4
	cmp	 r13,r13,r2
	br.n	 @L1379
	extu	 r2,r13,1<eq>
	align	 4
@L1390:
	ld	 r13,r31,92
	ld	 r3,r13,4
	bcnd.n	 ne0,r3,@L1392
	cmp	 r13,r2,0
	br.n	 @L1379
	extu	 r2,r13,1<eq>
	align	 4
@L1392:
	bsr.n	 _comptypes
	or	 r4,r0,1
@L1379:
	bcnd	 eq0,r2,@L1378
	ld.bu	 r13,r24,8
	cmp	 r13,r13,33
	bb0	 ne,r13,@L1395
	ld	 r13,r25,16
	ld	 r12,r24,80
	ld	 r11,r13,80
	ld.bu	 r13,r0,r12
	ld.bu	 r12,r0,r11
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L1395
	or.u	 r3,r0,hi16(@LC51)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC51)
	or.u	 r3,r0,hi16(@LC52)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC52)
@L1395:
	br.n	 @L1376
	or	 r20,r0,1
	align	 4
@L1378:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L1377
@L1376:
	bcnd	 eq0,r25,@L1517
	ld	 r23,r23,16
	br	 @L1400
	align	 4
@L1519:
	ld	 r13,r23,80
	bcnd	 eq0,r13,@L1401
	ld	 r13,r0,r13
	extu	 r13,r13,1<19>
	subu	 r13,r0,r13
	subu	 r18,r0,r13
@L1401:
	st	 r24,r31,88
	st	 r23,r31,92
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1404
	ld.bu	 r13,r23,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1404
	ld	 r13,r24,4
	ld	 r12,r23,4
	ld	 r11,r13,12
	ld	 r10,r12,12
	st	 r13,r31,120
	st	 r12,r31,128
	st	 r11,r31,124
	st	 r10,r31,132
	ld.bu	 r13,r13,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L1405
	ld	 r13,r23,80
	ld	 r13,r0,r13
	bb0.n	 (31-13),r13,@L1405
	addu	 r2,r31,120
	addu	 r3,r31,88
	br.n	 @L1525
	addu	 r4,r31,124
	align	 4
@L1405:
	ld	 r13,r31,128
	ld.bu	 r13,r13,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L1406
	ld	 r13,r31,88
	ld	 r13,r13,80
	ld	 r13,r0,r13
	bb0.n	 (31-13),r13,@L1406
	addu	 r2,r31,128
	addu	 r3,r31,92
	addu	 r4,r31,132
@L1525:
	bsr	 _revert_static_member_fn
@L1406:
	ld	 r11,r31,120
	ld	 r10,r31,128
	ld.bu	 r12,r11,8
	ld.bu	 r13,r10,8
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1408
	cmp	 r13,r12,14
	bb1.n	 ne,r13,@L1409
	or.u	 r3,r0,hi16(@LC49)
	ld	 r2,r31,88
	br.n	 @L1526
	or	 r3,r3,lo16(@LC49)
	align	 4
@L1409:
	or.u	 r3,r0,hi16(@LC50)
	ld	 r2,r31,88
	or	 r3,r3,lo16(@LC50)
@L1526:
	bsr.n	 _compiler_error_with_decl
	or	 r20,r0,0
	br	 @L1400
	align	 4
@L1408:
	ld	 r13,r11,4
	ld	 r12,r10,4
	ld	 r2,r13,64
	ld	 r3,r12,64
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L1411
	or	 r4,r0,1
	ld	 r2,r31,124
	ld	 r3,r31,132
	bsr.n	 _compparms
	addu	 r1,r1,@L1537
@L1538:
	align	 4
@L1411:
	br.n	 @L1413
	or	 r2,r0,0
	align	 4
@L1404:
	ld	 r13,r31,88
	or.u	 r12,r0,hi16(_error_mark_node)
	ld	 r2,r13,4
	ld	 r13,r12,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb1	 ne,r13,@L1414
	ld	 r13,r31,92
	ld	 r13,r13,4
	cmp	 r13,r13,r2
	br.n	 @L1413
	extu	 r2,r13,1<eq>
	align	 4
@L1414:
	ld	 r13,r31,92
	ld	 r3,r13,4
	bcnd.n	 ne0,r3,@L1416
	cmp	 r13,r2,0
	br.n	 @L1413
	extu	 r2,r13,1<eq>
	align	 4
@L1416:
	bsr.n	 _comptypes
	or	 r4,r0,1
@L1413:
	or	 r20,r0,r2
@L1400:
	ld	 r13,r24,4
	bcnd	 eq0,r13,@L1420
	ld.bu	 r13,r13,8
	bcnd	 eq0,r13,@L1419
@L1420:
	ld	 r13,r23,4
	bcnd	 eq0,r13,@L1418
	ld.bu	 r13,r13,8
	bcnd	 ne0,r13,@L1418
@L1419:
	or	 r20,r0,0
@L1418:
	ld.bu	 r12,r23,8
	ld.bu	 r13,r24,8
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1421
	or.u	 r3,r0,hi16(@LC53)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC53)
	ld.bu	 r13,r23,8
	cmp	 r13,r13,3
	bb1	 ne,r13,@L1422
	ld	 r23,r23,16
@L1422:
	or.u	 r3,r0,hi16(@LC54)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC54)
	br.n	 @L1518
	or	 r2,r0,0
	align	 4
@L1421:
	cmp	 r13,r12,29
	bb1.n	 ne,r13,@L1528
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r13,r23,76
	bcnd	 eq0,r13,@L1424
	st	 r13,r24,76
@L1424:
	ld	 r13,r23,36
	bcnd	 eq0,r13,@L1425
	st	 r13,r24,36
@L1425:
	ld	 r13,r23,80
	ld	 r12,r13,8
	bcnd	 eq0,r12,@L1426
	ld	 r13,r24,80
	st	 r12,r13,8
@L1426:
	ld	 r12,r24,80
	ld	 r13,r12,28
	bcnd	 ne0,r13,@L1529
	ld	 r13,r23,80
	ld	 r13,r13,28
	st	 r13,r12,28
	ld	 r12,r24,80
@L1529:
	ld	 r13,r12,20
	bcnd.n	 ne0,r13,@L1528
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r13,r23,80
	ld	 r13,r13,20
	st	 r13,r12,20
	or.u	 r13,r0,hi16(_flag_traditional)
@L1528:
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd	 eq0,r13,@L1429
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1429
	ld	 r13,r24,60
	ld	 r13,r13,36
	bcnd	 ne0,r13,@L1430
	bcnd	 eq0,r23,@L1432
	br	 @L1429
	align	 4
@L1430:
	ld	 r13,r13,4
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L1432
@L1429:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1433
	ld	 r13,r23,28
	bb0	 (31-12),r13,@L1433
	bcnd.n	 ne0,r20,@L1432
	or.u	 r3,r0,hi16(@LC55)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC55)
	or.u	 r3,r0,hi16(@LC56)
	or	 r2,r0,r23
	br.n	 @L1527
	or	 r3,r3,lo16(@LC56)
	align	 4
@L1521:
	bsr.n	 _error
	or	 r2,r2,lo16(@LC58)
	or.u	 r2,r0,hi16(@LC59)
	or	 r2,r2,lo16(@LC59)
	bsr.n	 _error
	addu	 r1,r1,@L1539
@L1540:
	align	 4
@L1433:
	bcnd.n	 ne0,r20,@L1436
	or	 r2,r0,r24
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r25,r23,4
	ld	 r12,r13,lo16(_current_class_type)
	ld	 r21,r24,4
	bcnd.n	 eq0,r12,@L1438
	or	 r22,r0,0
	ld	 r13,r24,60
	ld	 r13,r13,36
	bcnd	 eq0,r13,@L1438
	ld	 r13,r13,16
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L1437
@L1438:
	or.u	 r3,r0,hi16(@LC57)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC57)
	bsr.n	 _error_with_decl
	or	 r22,r0,1
@L1437:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,29
	bb0	 eq,r13,@L1441
	ld	 r2,r25,4
	ld	 r3,r21,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd	 eq0,r2,@L1441
	ld	 r13,r25,12
	bcnd	 ne0,r13,@L1443
	ld	 r13,r23,48
	bcnd	 eq0,r13,@L1442
@L1443:
	ld	 r13,r21,12
	bcnd	 ne0,r13,@L1441
	ld	 r13,r24,48
	bcnd	 ne0,r13,@L1441
@L1442:
	ld	 r10,r25,12
	bcnd.n	 ne0,r10,@L1448
	or.u	 r9,r0,hi16(_float_type_node)
	ld	 r10,r21,12
	bcnd	 eq0,r10,@L1441
@L1448:
	ld	 r13,r0,r10
	ld	 r12,r10,16
	bcnd.n	 ne0,r13,@L1449
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r13,r13,lo16(_void_type_node)
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L1521
	or.u	 r2,r0,hi16(@LC58)
@L1449:
	ld	 r11,r12,64
	ld	 r13,r9,lo16(_float_type_node)
	cmp	 r13,r11,r13
	bb0	 ne,r13,@L1451
	ld.bu	 r13,r12,8
	cmp	 r13,r13,7
	bb1.n	 ne,r13,@L1447
	or.u	 r13,r0,hi16(_char_type_node)
	ld	 r13,r13,lo16(_char_type_node)
	cmp	 r13,r11,r13
	bb0.n	 ne,r13,@L1451
	or.u	 r13,r0,hi16(_signed_char_type_node)
	ld	 r13,r13,lo16(_signed_char_type_node)
	cmp	 r13,r11,r13
	bb0.n	 ne,r13,@L1451
	or.u	 r13,r0,hi16(_unsigned_char_type_node)
	ld	 r13,r13,lo16(_unsigned_char_type_node)
	cmp	 r13,r11,r13
	bb0.n	 ne,r13,@L1451
	or.u	 r13,r0,hi16(_short_integer_type_node)
	ld	 r13,r13,lo16(_short_integer_type_node)
	cmp	 r13,r11,r13
	bb0.n	 ne,r13,@L1451
	or.u	 r13,r0,hi16(_short_unsigned_type_node)
	ld	 r13,r13,lo16(_short_unsigned_type_node)
	cmp	 r13,r11,r13
	bb1	 ne,r13,@L1447
@L1451:
	or.u	 r2,r0,hi16(@LC60)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC60)
	or.u	 r2,r0,hi16(@LC61)
	or	 r2,r2,lo16(@LC61)
	bsr.n	 _error
	addu	 r1,r1,@L1541
@L1542:
	align	 4
@L1447:
	ld	 r10,r0,r10
	bcnd	 ne0,r10,@L1448
@L1441:
	bcnd	 eq0,r22,@L1453
	or.u	 r3,r0,hi16(@LC62)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC62)
@L1453:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1432
	ld	 r13,r24,80
	ld	 r13,r0,r13
	bb0	 (31-9),r13,@L1432
	ld	 r13,r21,12
	ld	 r22,r0,r13
	bcnd	 eq0,r22,@L1432
	ld	 r2,r22,16
	ld	 r12,r21,56
	ld	 r13,r2,64
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L1432
	ld	 r13,r24,40
	bsr.n	 _build_reference_type
	ld	 r25,r0,r13
	bsr.n	 _hash_tree_chain
	ld	 r3,r0,r22
	ld	 r13,r22,16
	ld	 r13,r13,36
	st	 r13,r25,4
	st	 r13,r25,48
	or	 r4,r0,r2
	ld	 r2,r21,56
	bsr.n	 _build_cplus_method_type
	ld	 r3,r21,4
	or.u	 r13,r0,hi16(@LC63)
	st	 r2,r24,4
	bsr.n	 _error
	or	 r2,r13,lo16(@LC63)
	ld	 r13,r24,60
	ld	 r13,r13,36
	bcnd.n	 ne0,r13,@L1457
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	ld	 r13,r24,60
	st	 r2,r13,36
@L1457:
	ld	 r13,r24,60
	or.u	 r12,r0,hi16(_current_class_type)
	ld	 r11,r13,36
	ld	 r13,r12,lo16(_current_class_type)
	br.n	 @L1432
	st	 r13,r11,16
	align	 4
@L1436:
	bsr.n	 _redeclaration_error_message
	or	 r3,r0,r23
	or	 r3,r0,r2
	bcnd	 eq0,r3,@L1459
	bsr.n	 _error_with_decl
	or	 r2,r0,r24
	ld	 r13,r23,32
	bcnd	 eq0,r13,@L1463
	ld	 r13,r23,48
	bcnd.n	 eq0,r13,@L1461
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1530
	or.u	 r13,r0,hi16(@LC65)
	or.u	 r13,r0,hi16(@LC64)
	br.n	 @L1462
	or	 r3,r13,lo16(@LC64)
	align	 4
@L1461:
	or.u	 r13,r0,hi16(@LC65)
@L1530:
	or	 r3,r13,lo16(@LC65)
@L1462:
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L1543
@L1544:
	align	 4
@L1459:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L1531
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r23,48
	bcnd	 eq0,r13,@L1463
	ld	 r13,r23,4
	ld	 r13,r13,12
	bcnd.n	 ne0,r13,@L1531
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r24,4
	ld	 r13,r13,12
	bcnd	 eq0,r13,@L1463
	or.u	 r3,r0,hi16(@LC66)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC66)
	or.u	 r3,r0,hi16(@LC67)
	or	 r2,r0,r23
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC67)
@L1463:
	or.u	 r13,r0,hi16(_pedantic)
@L1531:
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 eq0,r13,@L1432
	ld	 r13,r24,8
	ld	 r12,r23,8
	or.u	 r11,r0,0xc
	and	 r13,r13,r11
	and	 r12,r12,r11
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L1432
	or.u	 r3,r0,hi16(@LC68)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC68)
@L1527:
	bsr	 _error_with_decl
@L1432:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L1466
	ld	 r13,r24,4
	ld	 r12,r13,80
	bcnd	 eq0,r12,@L1466
	ld	 r13,r23,4
	ld	 r13,r13,80
	bcnd	 eq0,r13,@L1466
	ld	 r13,r13,16
	st	 r13,r12,16
	ld	 r13,r23,4
	ld	 r12,r24,4
	ld	 r13,r13,80
	ld	 r12,r12,80
	ld	 r13,r13,100
	st	 r13,r12,100
@L1466:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L1468
	or	 r19,r0,0
	ld	 r13,r24,48
	cmp	 r13,r13,0
	extu	 r19,r13,1<ne>
@L1468:
	or.u	 r13,r0,hi16(_warn_redundant_decls)
	ld	 r13,r13,lo16(_warn_redundant_decls)
	bcnd	 eq0,r13,@L1469
	ld	 r13,r23,16
	bcnd	 eq0,r13,@L1469
	bcnd	 eq0,r19,@L1470
	ld	 r13,r23,48
	bcnd	 eq0,r13,@L1469
@L1470:
	or.u	 r3,r0,hi16(@LC69)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC69)
	or.u	 r3,r0,hi16(@LC70)
	or	 r2,r0,r23
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC70)
@L1469:
	bcnd	 eq0,r20,@L1471
	ld	 r21,r23,4
	ld	 r2,r24,4
	bsr.n	 _common_type
	or	 r3,r0,r21
	ld.bu	 r12,r24,8
	cmp	 r13,r12,33
	bb1.n	 ne,r13,@L1472
	or	 r22,r0,r2
	ld	 r13,r23,28
	bb0	 (31-19),r13,@L1474
	ld	 r13,r24,28
	or	 r13,r13,4096
	br.n	 @L1474
	st	 r13,r24,28
	align	 4
@L1472:
	cmp	 r13,r12,29
	bb1	 ne,r13,@L1474
	ld	 r13,r24,4
	ld	 r12,r23,4
	ld	 r4,r13,72
	ld	 r13,r12,72
	cmp	 r13,r4,r13
	bb0	 ne,r13,@L1474
	ld	 r13,r24,80
	ld	 r25,r13,8
	or	 r3,r0,r22
	bsr.n	 _build_exception_variant
	or	 r2,r0,r25
	st	 r2,r24,4
	or	 r2,r0,r25
	ld	 r4,r21,72
	bsr.n	 _build_exception_variant
	or	 r3,r0,r22
	or	 r3,r0,r2
	st	 r3,r23,4
	bsr.n	 _compexcepttypes
	ld	 r2,r24,4
	bcnd	 ne0,r2,@L1474
	or.u	 r3,r0,hi16(@LC71)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC71)
	or.u	 r3,r0,hi16(@LC72)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC72)
@L1474:
	st	 r22,r23,4
	cmp	 r13,r21,r22
	bb0.n	 ne,r13,@L1477
	st	 r22,r24,4
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r22,r13
	bb0	 ne,r13,@L1478
	bsr.n	 _layout_type
	or	 r2,r0,r22
@L1478:
	ld.bu	 r11,r24,8
	cmp	 r13,r11,29
	cmp	 r12,r11,32
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L1480
	cmp	 r13,r11,31
	bb0.n	 ne,r13,@L1480
	or	 r2,r0,r24
	or	 r3,r0,0
	bsr.n	 _layout_decl
	addu	 r1,r1,@L1545
@L1546:
	align	 4
@L1477:
	ld	 r13,r23,20
	st	 r13,r24,20
@L1480:
	ld	 r13,r24,8
	bb0.n	 (31-13),r13,@L1532
	or.u	 r12,r0,0x4
	ld	 r13,r23,8
	or	 r13,r13,r12
	st	 r13,r23,8
	ld	 r13,r24,8
@L1532:
	bb0.n	 (31-12),r13,@L1482
	or.u	 r12,r0,0x8
	ld	 r13,r23,8
	or	 r13,r13,r12
	st	 r13,r23,8
@L1482:
	ld	 r13,r24,48
	bcnd	 ne0,r13,@L1483
	ld	 r13,r23,48
	st	 r13,r24,48
@L1483:
	ld	 r13,r23,80
	bcnd	 eq0,r13,@L1486
	ld	 r13,r0,r13
	bb0	 (31-16),r13,@L1485
@L1486:
	or.u	 r13,r0,hi16(_abort_fndecl)
	ld	 r12,r13,lo16(_abort_fndecl)
	ld	 r13,r23,64
	ld	 r12,r12,64
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L1487
@L1485:
	ld	 r13,r23,64
	br.n	 @L1487
	st	 r13,r24,64
	align	 4
@L1471:
	or.u	 r13,r0,hi16(_static_aggregates)
	ld	 r3,r13,lo16(_static_aggregates)
	bsr.n	 _value_member
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L1488
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r2,16
@L1488:
	ld	 r12,r24,4
	ld	 r13,r23,8
	st	 r12,r23,4
	ld	 r12,r24,8
	and.u	 r13,r13,0xfffb
	mask.u	 r12,r12,0x4
	or	 r13,r13,r12
	st	 r13,r23,8
	ld	 r12,r24,8
	and.u	 r13,r13,0xfff7
	mask.u	 r12,r12,0x8
	or	 r13,r13,r12
	st	 r13,r23,8
	ld	 r12,r24,8
	and.u	 r13,r13,0xff7f
	mask.u	 r12,r12,0x80
	or	 r13,r13,r12
	st	 r13,r23,8
@L1487:
	ld	 r13,r24,28
	bb0	 (31-8),r13,@L1489
	ld	 r13,r24,8
	ld	 r12,r23,8
	ld	 r11,r24,28
	and	 r13,r13,0xdfff
	mask	 r12,r12,8192
	or	 r13,r13,r12
	st	 r13,r24,8
	ld	 r13,r23,28
	and.u	 r11,r11,0xff7f
	ld.bu	 r12,r24,8
	mask.u	 r13,r13,0x80
	cmp	 r12,r12,29
	or	 r11,r11,r13
	bb1.n	 ne,r12,@L1490
	st	 r11,r24,28
	ld	 r13,r23,8
	bb1	 (31-19),r13,@L1491
	ld	 r13,r24,8
	and	 r13,r13,0xefff
	st	 r13,r24,8
@L1491:
	ld	 r12,r23,8
	ld	 r13,r24,8
	and	 r12,r12,0xefff
	mask	 r13,r13,4096
	or	 r12,r12,r13
	bb1.n	 (31-19),r12,@L1494
	st	 r12,r23,8
	ld	 r12,r23,60
	ld	 r13,r12,8
	and	 r13,r13,0xefff
	br.n	 @L1494
	st	 r13,r12,8
	align	 4
@L1490:
	ld	 r12,r24,8
	ld	 r13,r23,8
	and	 r12,r12,0xefff
	mask	 r13,r13,4096
	or	 r12,r12,r13
	br.n	 @L1494
	st	 r12,r24,8
	align	 4
@L1489:
	ld	 r12,r23,8
	ld	 r13,r24,8
	and	 r12,r12,0xdfff
	mask	 r13,r13,8192
	or	 r12,r12,r13
	st	 r12,r23,8
	ld	 r11,r24,8
	or.u	 r12,r0,0x2104
	or	 r12,r12,0x2000
	and.u	 r13,r11,0xff04
	and	 r13,r13,0x2000
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L1495
	ld	 r13,r24,28
	bb1.n	 (31-19),r13,@L1495
	and	 r13,r11,0xefff
	st	 r13,r24,8
@L1495:
	ld	 r12,r23,8
	ld	 r13,r24,8
	and	 r12,r12,0xefff
	mask	 r13,r13,4096
	or	 r12,r12,r13
	st	 r12,r23,8
@L1494:
	ld	 r13,r24,28
	bb0.n	 (31-11),r13,@L1533
	or.u	 r12,r0,0x10
	ld	 r13,r23,48
	bcnd	 ne0,r13,@L1496
	ld	 r13,r23,28
	or	 r13,r13,r12
	st	 r13,r23,28
@L1496:
	ld	 r13,r24,28
@L1533:
	and.u	 r11,r13,0xffef
	ld	 r13,r23,28
	ld.bu	 r12,r24,8
	mask.u	 r13,r13,0x10
	cmp	 r12,r12,29
	or	 r11,r11,r13
	bb1.n	 ne,r12,@L1497
	st	 r11,r24,28
	bcnd	 eq0,r19,@L1498
	ld	 r13,r23,80
	ld	 r12,r24,80
	ld.bu	 r13,r0,r13
	br.n	 @L1497
	st.b	 r13,r0,r12
	align	 4
@L1498:
	ld	 r13,r23,28
	bb0.n	 (31-12),r13,@L1500
	or.u	 r12,r0,0x8
	or	 r13,r11,r12
	st	 r13,r24,28
	ld	 r13,r23,68
	st	 r13,r24,68
	ld	 r13,r23,64
	br.n	 @L1501
	st	 r13,r24,64
	align	 4
@L1500:
	ld	 r13,r23,68
	st	 r13,r24,68
@L1501:
	ld	 r13,r23,44
	st	 r13,r24,44
	ld	 r13,r23,72
	bcnd.n	 eq0,r13,@L1502
	st	 r13,r24,72
	ld	 r13,r23,48
	st	 r13,r24,48
@L1502:
	ld	 r13,r23,40
	bcnd	 eq0,r13,@L1497
	st	 r13,r24,40
@L1497:
	ld	 r12,r24,8
	ld	 r13,r23,8
	and.u	 r12,r12,0xffef
	mask.u	 r13,r13,0x10
	or	 r12,r12,r13
	st	 r12,r24,8
	ld	 r13,r23,8
	and.u	 r12,r12,0xfffe
	mask.u	 r13,r13,0x1
	or	 r12,r12,r13
	st	 r12,r24,8
	ld	 r13,r23,80
	bcnd	 eq0,r13,@L1534
	ld	 r12,r24,28
	ld	 r13,r23,28
	and	 r12,r12,0xf7ff
	mask	 r13,r13,2048
	or	 r12,r12,r13
	st	 r12,r24,28
	ld	 r13,r23,80
@L1534:
	ld	 r19,r23,24
	bcnd	 eq0,r13,@L1505
	ld	 r13,r0,r13
	br.n	 @L1506
	extu	 r20,r13,1<19>
	align	 4
@L1505:
	or	 r20,r0,0
@L1506:
	ld.bu	 r12,r24,8
	cmp	 r13,r12,29
	bb1.n	 ne,r13,@L1507
	or.u	 r13,r0,hi16(_tree_code_length)
	ld	 r25,r23,80
	addu	 r2,r24,12
	addu	 r3,r23,12
	or	 r4,r0,72
	bsr.n	 _bcopy
	ld	 r22,r24,80
	or.u	 r12,r0,hi16(_permanent_obstack+24)
	ld	 r13,r12,lo16(_permanent_obstack+24)
	or	 r21,r12,lo16(_permanent_obstack+24)
	addu	 r12,r13,116
	subu	 r11,r21,12
	and.c	 r13,r12,r13
	ld	 r12,r0,r11
	addu	 r13,r24,r13
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L1508
	ld	 r13,r24,80
	or	 r2,r0,r22
	or	 r3,r0,r25
	st	 r23,r13,16
	or	 r4,r0,32
	bsr.n	 _bcopy
	st	 r3,r23,80
	subu	 r11,r21,24
	ld	 r10,r11,4
	subu	 r2,r24,r10
	bcnd.n	 le0,r2,@L1509
	st	 r2,r11,20
	ld	 r13,r11,16
	subu	 r13,r13,r10
	cmp	 r13,r2,r13
	bb1.n	 ge,r13,@L1509
	addu	 r13,r10,r2
	st	 r13,r11,8
	br.n	 @L1515
	st	 r13,r11,12
	align	 4
@L1509:
	or.u	 r2,r0,hi16(_permanent_obstack)
	or	 r2,r2,lo16(_permanent_obstack)
	ld	 r13,r2,4
	ld	 r3,r2,20
	addu	 r3,r13,r3
	bsr.n	 __obstack_free
	addu	 r1,r1,@L1547
@L1548:
	align	 4
@L1508:
	ld	 r13,r0,r25
	bb0	 (31-17),r13,@L1515
	ld	 r13,r23,80
	ld	 r13,r13,16
	cmp	 r13,r13,r23
	bb1.n	 ne,r13,@L1515
	or.u	 r12,r0,hi16(_free_lang_decl_chain)
	ld	 r13,r12,lo16(_free_lang_decl_chain)
	st	 r13,r0,r25
	br.n	 @L1515
	st	 r25,r12,lo16(_free_lang_decl_chain)
	align	 4
@L1507:
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r4,r13[r12]
	addu	 r2,r24,12
	mak	 r4,r4,0<2>
	addu	 r3,r23,12
	bsr.n	 _bcopy
	addu	 r4,r4,72
@L1515:
	bcnd.n	 eq0,r18,@L1516
	st	 r17,r23,24
	ld	 r12,r23,80
	ld	 r13,r0,r12
	or.u	 r13,r13,0x8
	st	 r13,r0,r12
@L1516:
	ld	 r11,r23,80
	bcnd.n	 eq0,r11,@L1517
	st	 r19,r23,24
	ld	 r13,r0,r11
	and.u	 r12,r13,0xfff7
	extu	 r13,r13,1<19>
	or	 r13,r13,r20
	mak	 r13,r13,0<19>
	or	 r12,r12,r13
	st	 r12,r0,r11
@L1517:
	or	 r2,r0,1
@L1518:
@Lte31:
	ld	 r1,r31,80
	ld	 r17,r31,44
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	jmp.n	 r1
	addu	 r31,r31,144
	def	 @L1547,@L1515-@L1548
	def	 @L1545,@L1480-@L1546
	def	 @L1543,@L1463-@L1544
	def	 @L1541,@L1441-@L1542
	def	 @L1539,@L1441-@L1540
	def	 @L1537,@L1413-@L1538
	def	 @L1535,@L1379-@L1536

	align	 8
	global	 _adjust_type_value
_adjust_type_value:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	subu	 r31,r31,48
	st	 r25,r31,32
	or	 r25,r0,r2
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1560
	st	 r1,r31,36
@Ltb32:
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L1561
	ld	 r12,r25,24
	bcnd	 eq0,r12,@L1564
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L1569
	or.u	 r13,r0,hi16(_current_class_type)
@L1563:
	ld	 r13,r12,4
	br.n	 @L1559
	st	 r13,r25,4
	align	 4
@L1561:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,7
@L1564:
	or.u	 r13,r0,hi16(_current_class_type)
@L1569:
	ld	 r13,r13,lo16(_current_class_type)
	bcnd	 eq0,r13,@L1560
	ld	 r12,r25,28
	bcnd	 eq0,r12,@L1560
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1	 eq,r13,@L1563
@L1560:
	ld	 r12,r25,20
	bcnd	 eq0,r12,@L1559
	ld.bu	 r11,r12,8
	cmp	 r13,r11,32
	bb1.n	 eq,r13,@L1563
	cmp	 r13,r11,129
	bb1	 ne,r13,@L1559
	st	 r0,r25,4
@L1559:
@Lte32:
	ld	 r1,r31,36
	ld	 r25,r31,32
	jmp.n	 r1
	addu	 r31,r31,48

