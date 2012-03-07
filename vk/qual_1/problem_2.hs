import List

splitBy :: (a -> Bool) -> [a] -> [[a]]
splitBy _ [] = []
splitBy f list = first : splitBy f (dropWhile f rest) 
	where
  		(first, rest) = break f list

toIList :: String -> [Int]
toIList str = (map read splitted) :: [Int]
	where
		splitted = splitBy (== ' ') str

minimumTaxis :: [Int] -> Int
minimumTaxis ppls = c4 + c3 + res2 + res1
	where
		count = map length $ group $ sort (ppls ++ [1, 2, 3, 4])
		c4 = count !! 3 - 1
		c3 = count !! 2 - 1
		c2 = count !! 1 - 1
		c1 = count !! 0 - 1
		left1 = if c1 - c3 > 0 then c1 - c3 else 0
		full2 = floor $ (fromIntegral c2)/2
		left2 = c2 `mod` 2
		res2 = full2 + left2
		res1 = if left1 - left2*2 > 0 then ceiling $ (fromIntegral (left1 - left2*2))/4 else 0


main = do
	line1 <- getLine
	line2 <- getLine
	let result = minimumTaxis $ toIList line2

	putStr $ show result