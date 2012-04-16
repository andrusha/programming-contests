-- A number n is called deficient if the sum of its proper divisors is less
-- than n and it is called abundant if this sum exceeds n.
-- 
-- By mathematical analysis, it can be shown that all integers greater than
-- 28123 can be written as the sum of two abundant numbers. 
-- However, this upper limit cannot be reduced any further by analysis even
-- though it is known that the greatest number that cannot be expressed as 
-- the sum of two abundant numbers is less than this limit.
--
-- Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

import Data.List (sort)
import Numerix   (abundant)

allSums :: [Int] -> [Int]
allSums [] = []
allSums (x:xs) = intSum x xs
	where
		intSum n [] = n*2 : allSums xs
		intSum n (y:ys)
			| yn > 28123 = allSums xs
			| otherwise  = yn : intSum n ys
			where yn = y + n

missing :: [Int] -> [Int] -> [Int]
missing xs     []     = xs
missing []     _      = []
missing i@(x:xs) j@(y:ys)
	| x == y          =     missing xs ys
	| x > y           =     missing i ys
	| otherwise       = x : missing xs j

answer = sum . missing [1..28123] . sort . allSums . takeWhile (< 28123) $ abundant

main = print $ answer