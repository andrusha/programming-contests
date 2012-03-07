#!/usr/bin/env python
import sys
from cStringIO import StringIO
#import psyco
#psyco.full()

def main():
    out = StringIO()
    out.write('Ready\n')
    ln = sys.stdin.readline()
    while ln not in ['  \r\n', '  \n', '  ']:
        if ln.strip() in ['qp', 'pq', 'db', 'bd']:
            out.write('Mirrored pair\n')
        else:
            out.write('Ordinary pair\n')
        ln = sys.stdin.readline()
    print out.getvalue()

main()