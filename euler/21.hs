-- Let d(n) be defined as the sum of proper divisors of n 
-- (numbers less than n which divide evenly into n).
-- If d(a) = b and d(b) = a, where a /= b, 
-- then a and b are an amicable pair and each of a and b 
-- are called amicable numbers.
--
-- Evaluate the sum of all the amicable numbers under 10000.


floorSqrt = floor . sqrt . fromIntegral
ceilSqrt = ceiling . sqrt . fromIntegral

factors :: Int -> [Int]
factors n
	| n <= 1 = []
	| fsqrt == ceilSqrt n = fsqrt : factors' n (fsqrt - 1)
	| otherwise = factors' n fsqrt
	where fsqrt = floorSqrt n

-- If number is proper square (like 4 = 2^2 or 16 = 4^2)
-- then this algorithm will add √x twice because of n `div` x
-- so we check this corener case in factors
factors' :: Int -> Int -> [Int]
factors' n x
	| x == 1 = [1]
	| n `mod` x == 0 = x : n `div` x : factors' n (x - 1)
	| otherwise = factors' n (x - 1)

divsum = sum . factors

amicable :: [(Int, Int)]
amicable = amicable' 1

amicable' n
	| ds > n && (divsum . divsum) n == n = (n, ds) : amicable' (n+1)
	| otherwise 						 =           amicable' (n+1)
	where ds = divsum n

answer = foldl (\x y -> x + (fst y) + (snd y)) 0 . takeWhile ((< 10^4).snd) $ amicable