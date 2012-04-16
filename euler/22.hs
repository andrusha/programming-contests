-- Using 22.txt (right click and 'Save Link/Target As...'), 
-- a 46K text file containing over five-thousand first names, 
-- begin by sorting it into alphabetical order. 
-- Then working out the alphabetical value for each name, 
-- multiply this value by its alphabetical position in the list 
-- to obtain a name score.
--
-- What is the total of all the name scores in the file?

import Data.List  (sort, elemIndex)
import Data.Maybe (fromJust)

charSum = sum . map (succ.fromJust.(flip elemIndex ['A'..'Z']))
score x = (fst x) * (charSum $ snd x)

answer = sum . map score . zip [1..] . sort

toList :: String -> [String]
toList = read . (\x -> "[" ++ x ++ "]")

main = do
	names <- readFile "22.txt"
	print $ answer . toList $ names