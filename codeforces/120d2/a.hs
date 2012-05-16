answer 0 _ = "Impossible"
answer n m = (show n1) ++ " " ++ (show m1)
	where (n1, m1) = answer' n m

answer' n m
	| m == 0 || n > m = (n, n)
	| otherwise       = (m, n + m - 1)

main = do
	tmp <- getLine
	let [n,m] = map read . words $ tmp
	putStrLn $ answer n m