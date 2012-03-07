splitBy :: (a -> Bool) -> [a] -> [[a]]
splitBy _ [] = []
splitBy f list = first : splitBy f (dropWhile f rest) 
	where
  		(first, rest) = break f list

toIList :: String -> [Int]
toIList str = (map read splitted) :: [Int]
	where
		splitted = splitBy (== ' ') str

findWinnersCount :: [Int] -> Int -> Int
findWinnersCount ppls pos = length $ takeWhile (\i -> 0 < i && i >= target) ppls
	where
		target = ppls !! (pos - 1)

main = do
	line1 <- getLine
	let [n, k] = toIList line1

	line2 <- getLine
	let result = findWinnersCount (toIList line2) k

	putStr $ show result