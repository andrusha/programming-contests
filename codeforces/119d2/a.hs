
maxLen n a b c
	| n `mod` a == 0 = n `div` a
	| (n - b)

max' n a ex b c
	| x == 0 || x `mod` b == 0 || x `mod` c == 0 = ex
	| ex == 0  									 = 0
	| otherwise 								 = max' n a (pred ex) b c 
	where
		x = n `mod` (a * ex)

main = do
	tmp <- getStrLn
	let n:xs     = map read $ words tmp
	let a:b:c:[] = sort xs
	print $ maxLen n a b c