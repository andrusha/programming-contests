
triangles :: Integer -> Integer
triangles n = (m * (m + 1) `div` 2) `mod` (10^9 + 7)
	where m = 2^n


triangles' :: Integer -> Integer
triangles' k = ((2 * z + 1) * z) `mod` (10^9 + 6)
	where
		z = (pow2 (k - 1)) `mod` (10^9 + 6)

pow2 :: Integer -> Integer
pow2 k = pow2' k 1 1

pow2' 0 res _   = res
pow2' k res pow
	| odd k     = pow2' nk nres npow
	| otherwise = pow2' nk res  npow 
	where
		npow = (pow * 2) `mod` (10^9 + 7)
		nres = (res * npow) `mod` (10^9 + 7)
		nk   = k `div` 2

main = do
	tmp <- getLine
	let n = read tmp
	print $ triangles n