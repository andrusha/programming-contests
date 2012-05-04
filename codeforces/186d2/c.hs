
triangles :: Integer -> Integer
triangles n = (m * (m + 1) `div` 2) `mod` (10^9 + 7)
	where m = 2^n

main = do
	tmp <- getLine
	let n = read tmp
	print $ triangles n