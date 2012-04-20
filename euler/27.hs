-- Considering quadratics of the form:
-- 
-- n² + an + b, where |a| < 1000 and |b| < 1000
--
-- Find the product of the coefficients, a and b, 
-- for the quadratic expression that produces 
-- the maximum number of primes for 
-- consecutive values of n, starting with n = 0.

import Data.List  (maximumBy)
import Data.Ord   (comparing)
import Data.Array (listArray)
import Data.Maybe (Maybe (Nothing, Just))
import Numerix    (primes, bisect)

primeArr = listArray (0, len - 1) x
	where
		x   = takeWhile (< 10^4) primes
		len = length x

isPrime = toBool . bisect primeArr
	where
		toBool (Just _) = True
		toBool Nothing  = False

euler :: Int -> Int -> [Int]
euler a b = map (\n -> n^2 + a*n + b) [0..]

eulers = [(a * b, euler a b) | a <- [-999..999], b <- [-999..999]]

match = length . takeWhile isPrime

answer = maximumBy (comparing (match.snd)) eulers

main = print $ fst answer