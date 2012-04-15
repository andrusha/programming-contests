-- The sequence of triangle numbers is generated by adding the natural numbers.
-- What is the value of the first triangle number to have over five hundred divisors?

-- sum n, n=0..inf = n * (n + 1) / 2
triangle n = n * (n + 1) `div` 2
triangles = map triangle [1..]

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

answer = head . dropWhile ((< 500).length.factors) $ triangles

main = putStrLn . show $ answer