import os
import sys
import json
from pprint import pprint
import xlwt
import subprocess as sub
# Super duper test runner
# Not neat but it works...
# By Zach and John

# Helpers
currentRow = 0
currentCol = 0
# Set the column number to 0 and the row number to row++
def incrementRow():
    global currentRow
    global currentCol
    currentRow+=1
    currentCol=0

# Load our input data
if len(sys.argv)<2:
    print 'Too Few Arguments. Need runner.py name_of_test_file'
    exit()   
file_name=sys.argv[1]
data=[]
with open(file_name) as d:
  data = json.load(d)
num_isns=data['NumberIsns']
output_name=data['OutputName']
benchmarks=data['Benchmarks']
tests=data
print('File {} loaded...'.format(file_name))
print('Outputting results of test to {}'.format(output_name))
print('Num Instructions: {}'.format(num_isns))
print('Benchmarks: {}'.format(', '.join(benchmarks)))

# Create our workbook
print('Creating output Excel File...')
book=xlwt.Workbook()
sh = book.add_sheet("Results")


# Run all our tests and output results to excel spreadsheet
font = xlwt.Font()
num_predictors = len(data["Params"])
current_predictor = 1;
for test in data["Params"]:
    print('Running test for predictor: {}'.format("_".join(test['BPredName'])))
    font.bold = True
    sh.write(currentRow,currentCol,"Predictor Name")
    currentCol+=1
    sh.write(currentRow,currentCol,"Benchmark")
    currentCol+=1
    args = test['Arg Names']
    for arg in args:
        for arg_name in arg:
            sh.write(currentRow,currentCol,arg_name)
            currentCol+=1
    result_first_col = currentCol
    sh.write(currentRow,currentCol,"Num Branches")
    currentCol+=1
    sh.write(currentRow,currentCol,"Branches Correctly Predicted")
    currentCol+=1
    sh.write(currentRow,currentCol,"Hit Rate")
    currentCol+=1
    sh.write(currentRow,currentCol,"Miss Per Thousand")
    font.bold = False
    incrementRow()
    # Start the Quadruple for loop of testing goodness
    test_strings=[];

    base_test_string="-bpred {} -bpred:{} ".format(test['BPredName'][0],test['BPredName'][0])
    # This code assumes more than 1 argument for a given predictor... it should work then. Incoming messiness
    # This code also assumes a maximum of 4 arguments
    arg = args[0];
    if len(arg) > 0:
        for arg0 in test[arg[0]]:
            if len(arg) > 1:
                for arg1 in test[arg[1]]:
                    if len(arg) > 2:
                        for arg2 in test[arg[2]]:
                            if len(arg) > 3:
                                for arg3 in test[arg[3]]:
                                    if len(arg) > 4:
                                        for arg4 in test[arg[4]]:
                                            test_strings.append((base_test_string+"{} {} {} {} {}".format(arg0,arg1,arg2,arg3,arg4),arg0,arg1,arg2,arg3,arg4))
                                    else:       
                                        test_strings.append((base_test_string+"{} {} {} {}".format(arg0,arg1,arg2,arg3),arg0,arg1,arg2,arg3))
                            else:
                                test_strings.append((base_test_string+"{} {} {}".format(arg0,arg1,arg2),arg0,arg1,arg2))
                    else:
                        test_strings.append((base_test_string+"{} {}".format(arg0,arg1),arg0,arg1))
            else:
                test_strings.append((base_test_string+"{}".format(arg0),arg0))
    # Warning: Please cover your eyes... More ugly, hardcoded crap to follow...
    test_strings_copy=[]
    if len(args)>1:
        arg = args[1];
        if len(arg) > 0:
            for index,temp_test_string in enumerate(test_strings):
                test_strings[index] = (temp_test_string[0]+" -bpred:{} ".format(test['BPredName'][1]),)+temp_test_string[1:]
            for arg0 in test[arg[0]]:
                if len(arg) > 1:
                    for arg1 in test[arg[1]]:
                        if len(arg) > 2:
                            for arg2 in test[arg[2]]:
                                if len(arg) > 3:
                                    for arg3 in test[arg[3]]:
                                        if len(arg) > 4:
                                            for arg4 in test[arg[4]]:
                                                for temp_test_string in test_strings:
                                                    test_strings_copy.append((temp_test_string[0]+"{} {} {} {} {}".format(arg0,arg1,arg2,arg3,arg4),)+temp_test_string[1:]+(arg0,arg1,arg2,arg3,arg4))
                                        else:   
                                            for temp_test_string in test_strings:
                                                test_strings_copy.append((temp_test_string[0]+"{} {} {} {}".format(arg0,arg1,arg2,arg3),)+temp_test_string[1:]+(arg0,arg1,arg2,arg3))
                                else:
                                    for temp_test_string in test_strings:
                                        test_strings_copy.append((temp_test_string[0]+"{} {} {}".format(arg0,arg1,arg2),)+temp_test_string[1:]+(arg0,arg1,arg2))
                        else:
                            for temp_test_string in test_strings:
                                test_strings_copy.append((temp_test_string[0]+"{} {}".format(arg0,arg1),)+temp_test_string[1:]+(arg0,arg1))
                else:
                    for temp_test_string in test_strings:
                        test_strings_copy.append((temp_test_string[0]+"{}".format(arg0),)+temp_test_string[1:]+(arg0))
            test_strings = test_strings_copy
    # Hardcode the number of perceptrons Note: This strictly depends on ordering and won't work on GGH
    for index,test_str in enumerate(test_strings):
        num_perceptrons = ((test['Size']-test_str[3])/((test_str[3]+1)*test_str[2]+test_str[6])-test_str[5])
        if num_perceptrons<=0:
            num_perceptrons = 1
        test_strings[index] = test_str[0:1]+(num_perceptrons,)+test_str[2:]
        test_strings[index] = (test_str[0].replace("-1","{}".format(num_perceptrons)),)+test_str[1:] 
    # Navigate to the spec2000 args folder then execute our benchmarks. This assumes we're in the SPEC2000 main folder
    num_tests=len(test_strings)*len(benchmarks)
    current_test=1
    for test_string in test_strings:
        for benchmark in benchmarks:
            print("")
            print("")
            print("On predictor {} of {} evaluating test {} of {}".format(current_predictor,num_predictors,current_test,num_tests))
            temp_command = 'cd spec2000args/{}; ./RUN{} ../../../benchmarks/sim-bpred ../../spec2000binaries/{}00.peak.ev6 -max:inst {} {}'.format(benchmark,benchmark,benchmark,num_isns,test_string[0])
            print("Running command: {}".format(temp_command))
            p = sub.Popen(temp_command,stdout=sub.PIPE,stderr=sub.PIPE,shell=True)
            p.wait()
            # Grab the test output and pull our parameters of interest from it
            test_output =  p.communicate()[1].strip()
            # Fill in basic information
            sh.write(currentRow,currentCol,"_".join(test['BPredName']))
            currentCol+=1
            sh.write(currentRow,currentCol,benchmark)
            currentCol+=1
            index=0
            for arg in args:
                for arg_name in arg:
                    sh.write(currentRow,currentCol,test_string[index+1])
                    currentCol+=1
                    index+=1
            num_branches_seen = 0
            num_branches_correct = 0
            hit_rate = 0
            miss_per_thousand = 0;
            for item in test_output.split('\n'):
                if "sim_num_branches" in item:
                    ints = (int(s) for s in str.split(item) if s.isdigit())
                    for num in ints:
                        num_branches_seen = num
                        sh.write(currentRow,currentCol,'{}'.format(num))
                    currentCol+=1
                if "addr_hits" in item:
                    ints = (int(s) for s in str.split(item) if s.isdigit())
                    for num in ints:
                        num_branches_correct = num
                        sh.write(currentRow,currentCol,'{}'.format(num))
                    currentCol+=1
            hit_rate = num_branches_correct*1.0/num_branches_seen
            miss_per_thousand = (1-hit_rate)*1000
            sh.write(currentRow,currentCol,'{}'.format(hit_rate))
            currentCol+=1
            sh.write(currentRow,currentCol,'{}'.format(miss_per_thousand))
            currentCol+=1
            print('Saving temporary output file...')
            book.save(os.path.join(os.getcwd(),output_name))
            current_test+=1
            incrementRow()

    current_predictor+=1

        

# Save the workbook
print('Saving output file...')
book.save(os.path.join(os.getcwd(),output_name))
print("Done!")





