#!/usr/bin/env python3

import sys

def solve(problem):
    tokens = problem.split()
    buttons = int(tokens[0])

    min_actions = 0

    actions = {'O': 0, 'B': 0}
    position = {'O': 1, 'B': 1}
    credit = {'O': 0, 'B' : 0}
    previous = tokens[1]
    for cur in range(1, buttons + 1):
         letter = tokens[cur*2 - 1]
         button = int(tokens[cur*2])
         
         if letter != previous and all(actions.values()):
             min_actions += max(actions['O'] - credit['O'], actions['B'] - credit['B'])

             if actions['O'] >= actions['B']:
                 credit = {'B': actions['O'] - actions['B'], 'O': 0}
             else:
                 credit = {'B': 0, 'O': actions['B'] - actions['O']}

             actions = {'O': 0, 'B': 0}

         diff = abs(position[letter] - button)
         position[letter] = button

         # 1 stands for button press
         actions[letter] += diff + 1

         #previous = letter

    if any(actions.values()):
        min_actions += max(actions['O'], actions['B'])

    return min_actions

def main(data):
    cases = int(data[0])
    result = []
    for case in range(1, cases + 1):
        tmp = solve(data[case])
        result += ['Case #%i: %i' % (case, tmp)]

    return '\n'.join(result)

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Usage: <file> input.file output.file')
        sys.exit()

    data = open(sys.argv[1], 'r').readlines()
    result = main(data)
    open(sys.argv[2], 'w').write(result)
