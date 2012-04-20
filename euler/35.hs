-- The number, 197, is called a circular prime because all
-- rotations of the digits: 197, 971, and 719, are themselves prime.
--
-- How many circular primes are there below one million?

import Data.List (permutations)
import Data.Array (Array, listArray, (!), indices, Ix)
import Data.Maybe (Maybe (Nothing, Just))
import Numerix (primes)

import Debug.Trace

primeArr = listArray (0, len - 1) x
	where
		x   = takeWhile (< 10^6) primes
		len = length x

bisect arr n = bisect' arr n start end
	where 
		start = (head . indices) arr
		end   = (last . indices) arr

bisect' arr n start end
	| start >= end     = Nothing
	| end - start == 1 = checkCorners start end
	| found == n       = Just center
	| found >  n       = bisect' arr n start  center
	| found <  n       = bisect' arr n center end
	| otherwise        = Nothing
	where
		--center = trace ((show start) ++ "\t" ++ (show end)) (start + ((end - start) `div` 2))
		center = start + ((end - start) `div` 2)
		found  = arr ! center
		checkCorners x y
			| (arr ! x) == n ||
			  (arr ! y) == n = Just n
			| otherwise      = Nothing

digits :: Integral a => a -> [a]
digits 0 = []
digits n = (n `mod` 10) : digits (n `div` 10)

number :: Integral a => [a] -> a
number ds = foldl toNum 0 (zip ds [0..])
	where
		toNum res (x,e) = res + x * (10^e)

rotations :: [a] -> [[a]]
rotations xx@(x:xs) = xx : rotations' xx []
	where
		rotations' (x:[]) ys     = []
		rotations' (x:xs) ys = (xs ++ yy) : rotations' xs yy
			where yy = ys ++ [x]

isCircular :: Int -> Bool
isCircular = all (toBool . bisect primeArr . number) . rotations . digits
	where
		toBool (Just _) = True
		toBool Nothing  = False

answer = length . filter isCircular . takeWhile (< 10^6) $ primes

main = print answer