#!/usr/bin/env python3

import sys
from collections import defaultdict

def solve(case):
    tokens = case.split()
    
    combine = defaultdict(dict)
    C = int(tokens[0])
    for x in range(1, C+1):
        tmp = tokens[x]
        combine[tmp[0]][tmp[1]] = tmp[2]
        combine[tmp[1]][tmp[0]] = tmp[2]

    opposed = {}
    tokens = tokens[C+1:]
    D = int(tokens[0])
    for x in range(1, D+1):
        tmp = tokens[x]
        opposed[tmp[0]] = tmp[1]
        opposed[tmp[1]] = tmp[0]

    #N = int(tokens[C+1+D+1])
    tokens = tokens[D+1:]
    elements = list(tokens[1])

    result = []
    expect = {}
    for e in elements:
        previous = result[-1] if result else None
        if previous in combine and e in combine[previous]:
            result = result[:-1]
            result += [combine[previous][e]]
            continue
        elif e in expect:
            result = result[:expect[e]]
            expect = {}
            continue
        elif e in opposed:
            expect[opposed[e]] = len(result)

        result += [e]

    return result

def main(data):
    lines = int(data[0])
    result = []
    for case in range(1, lines+1):
        solution = solve(data[case])
        
        result += [('Case #%i: %s' % (case, solution)).replace("'", '')]

    return '\n'.join(result) + '\n'

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Usage: <file> input.file output.file')
        sys.exit()

    data = open(sys.argv[1], 'r').readlines()
    result = main(data)
    open(sys.argv[2], 'w').write(result)
