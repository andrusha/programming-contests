-- The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1).
-- Using 42.txt a 16K text file containing nearly two-thousand common English words,
-- how many are triangle words?

import Data.Char  (ord)
import Data.Array (listArray)
import Data.Maybe (Maybe (Nothing, Just), fromJust)
import Numerix    (bisect)

triangles :: [Int]
triangles = map (\n -> n * (n + 1) `div` 2) [1..]

triangleArr = listArray (0, 10^4) triangles

isTriangle = toBool . bisect triangleArr
	where
		toBool (Just _) = True
		toBool Nothing  = False

toInt = sum . map toInt'
	where
		toInt' c = ord(c) - ord('A') + 1

answer = length . filter isTriangle . map toInt

toList :: String -> [String]
toList = read . (\x -> "[" ++ x ++ "]")

main = do
	wrds <- readFile "42.txt"
	print $ answer . toList $ wrds