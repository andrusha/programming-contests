#!/usr/bin/python

import sys

def interpret(line, stack = []):
	if line == 'pwd':
		if stack:
			print '/' + '/'.join(stack) + '/'
		else:
			print '/'
	else:
		if line[3] == '/':
			del stack[::]

		path = line[3:].strip('/').split('/')
		for part in path:
			if part == '..':
				try:
					stack.pop()
				except IndexError:
					pass
			else:
				stack.append(part)

def main():
	N = int(sys.stdin.readline())
	for _ in xrange(N):
		interpret(sys.stdin.readline().strip())

main()