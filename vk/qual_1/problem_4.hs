import List
import Array

splitBy :: (a -> Bool) -> [a] -> [[a]]
splitBy _ [] = []
splitBy f list = first : splitBy f (dropWhile f rest) 
	where
  		(first, rest) = break f list

toIntArray :: Int -> String -> Array Int Int
toIntArray n str = array (1, n) indexed
	where
		splitted = splitBy (== ' ') str
		converted = (map read splitted) :: [Int]
		indexed = zip [1..] converted

-- All possible platonic solids indices
platonic :: Int -> [[Int]]
platonic m = [[x,x+y..m] | x <- [1..m `div` 3], y <- [1..m `div` 3]]

elemsFromIndices :: Array Int Int -> [Int] -> [Int]
elemsFromIndices xs indices = map (xs !) indices

findMaxSum :: Array Int Int -> Int -> Int
findMaxSum xs n = maximum $ map (sum.(elemsFromIndices xs)) $ platonic n

main = do
	line1 <- getLine
	let n = read line1 :: Int

	line2 <- getLine
	let result = findMaxSum (toIntArray n line2) n

	putStr $ show result