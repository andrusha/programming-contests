-- A collection of number sequences, algorithms
-- which are proved to be useful in Project Euler
-- or that kind of programming contest

module Numerix (fibonacci, collatz, amicable, abundant, primes, factorial, binomial, factors, primeFactors) where

-- Fibonacci numbers as an infinite list
fibonacci = 1 : 2 : zipWith (+) fibonacci (tail fibonacci)

-- Collatz sequence
collatz n
	| n == 1    = [1]
	| odd  n    = n : collatz (n `div` 2)
	| even n    = n : collatz (3 * n + 1)
	| otherwise = []

-- Amicable number pairs
amicable = amicable' 1
amicable' n
	| ds > n && (divsum . divsum) n == n = (n, ds) : amicable' (n+1)
	| otherwise 						 =           amicable' (n+1)
	where 
		ds 	   = divsum n
		divsum = sum . factors

-- Abundant numbers
abundant = abundant' 12
abundant' n
	| divsum n > n = n : abundant' (succ n)
	| otherwise    =     abundant' (succ n)
	where
		divsum = sum . factors

-- Prime numbers generator, based on sieve
minus (x:xs) (y:ys) = case (compare x y) of 
           LT -> x : minus  xs  (y:ys)
           EQ ->     minus  xs     ys 
           GT ->     minus (x:xs)  ys
minus  xs     _     = xs

primes = 2 : primes'
  where 
    primes' = sieve [3,5..] 9 primes'
    sieve [] _ _  = []
    sieve (x:xs) q ps@ ~(p:t)
      | x < q     = x : sieve xs q ps
      | otherwise =     sieve (xs `minus` [q, q+2*p..]) (head t^2) t

-- Factorial
factorial n = product [1..n]

-- Binomial coefficent
binomial n k = (factorial n) `div` ((factorial k) * (factorial (n - k)))

-- Factorization in O(√n)
floorSqrt = floor . sqrt . fromIntegral
ceilSqrt = ceiling . sqrt . fromIntegral

factors :: Int -> [Int]
factors n
	| n <= 1              = []
	| fsqrt == ceilSqrt n = fsqrt : factors' n (fsqrt - 1)
	| otherwise           =         factors' n fsqrt
	where 
		fsqrt = floorSqrt n

-- If number is proper square (like 4 = 2^2 or 16 = 4^2)
-- then this algorithm will add √x twice because of n `div` x
-- so we check this corener case in factors
factors' :: Int -> Int -> [Int]
factors' n x
	| x == 1         = [1]
	| n `mod` x == 0 = x : n `div` x : factors' n (x - 1)
	| otherwise      =                 factors' n (x - 1)

-- Prime factorization
primeFactors n 
	| n > 1 = go n primes
	| otherwise = []
		where
	    	go n ps@(p:ps')
		        | p*p > n        = [n]
		        | n `rem` p == 0 =  p : go (n `quot` p) ps
		        | otherwise      =      go n ps'
