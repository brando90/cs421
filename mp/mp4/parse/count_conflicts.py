

import sys
import re

## points taken for each conflict:
SHIFT_RED = 1
RED_RED = 2
# MAX_ERR = 10


def main():

    file = sys.argv[1]

    fr = open(file,'r')


    errs = dict();  # key: line, value: points deduced

    for line in fr:
        line = line.rstrip()
        #print line
        x = re.match( r'([0-9]+): reduce/reduce .*', line)
        y = re.match(r'([0-9]+): shift/reduce .*', line)
        if x:
            print x.group()
            errs[int(x.group(1))] = RED_RED
        else:
            if y:
                print( y.group() )
                errs[int(y.group(1))] = SHIFT_RED
        if x or y:
            print >>sys.stderr, errs


    sumerr = 0;
    for (k, v) in errs.items():
        sumerr += v

#    sumerr = min(sumerr, MAX_ERR) # Let the test file figure this out

    print >>sys.stderr, "Error count:", sumerr

    f = open('conflict_count.txt','w')
    f.write("%d\n" % sumerr)
    f.close()




if __name__ == "__main__":
    main()
