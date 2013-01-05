-- Take the number 192 and multiply it by each of 1, 2, and 3:
-- 192 x 1 = 192
-- 192 x 2 = 384
-- 192 x 3 = 576
--
-- By concatenating each product we get the 1 to 9 pandigital, 192384576. 
-- We will call 192384576 the concatenated product of 192 and (1,2,3)
--
-- The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, 
-- giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
--
-- What is the largest 1 to 9 pandigital 9-digit number 
-- that can be formed as the concatenated product of an integer 
-- with (1,2, ... , n) where n > 1?

import Data.List (intersect, sort, permutations)

ltos :: [Int] -> String
ltos = foldr (++) "" . map show

atoi :: [Int] -> Int
atoi = read . ltos

takeWhileAcc  f xs        = takeWhileAcc' f [] xs
takeWhileAcc' _ ys []     = ys
takeWhileAcc' f ys (x:xs)
	| f zs      = takeWhileAcc' f zs xs
	| xs == []  = ys
	| otherwise = ys
	where zs = ys ++ [x]

--

pandigitList x = map (*x) [1..]

pandigitMaxLen n = takeWhileAcc ((<=n).length.ltos) . pandigitList

--

answer :: [Int]
answer = maximum . intersect (map atoi $ permutations [0..9]) . map atoi . filter ((>1).length) . map (pandigitMaxLen 9) $ [9000..9999]

main = print $ answer