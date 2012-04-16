-- Which starting number, under one million, produces the longest chain?

import Data.Maybe
import Data.List

collatz :: Int -> Int
collatz n
	| odd  n = 1 + collatz (n `div` 2)
	| even n = 1 + collatz (3 * n + 1)
	| otherwise = 1

collatzList = map collatz [0..999999]

answer :: Int
answer = fromJust $ elemIndex (maximum collatzList) collatzList

main = putStrLn . show $ answer