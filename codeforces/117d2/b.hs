
answer :: Int -> [Int] -> Int
answer d as = sum . map (d -) . init $ as

main = do
	d <- getLine
	_ <- getLine
	as <- getLine
	putStrLn . show $ answer (read d) (map read . words $ as)