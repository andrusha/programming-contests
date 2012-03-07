#!/usr/bin/env python
while True:
    try:
        x = int(raw_input())
        if x == 42 or x > 100:
            break
        print(x)            
    except ValueError:
        pass