-- An irrational decimal fraction is created by concatenating 
-- the positive integers:
--
-- 0.123456789101112131415161718192021...
--
-- If dn represents the nth digit of the fractional part, 
-- find the value of the following expression.
--
-- d1 x d10 x d100 x d1000 x d10000 x d100000 x d1000000

import Data.Char

ser n = ser' n [0..] 0

-- Smart, but can be better
ser' :: Int -> [Int] -> Int -> (Int, Int, Int, Int)
ser' n (x:xs) summ
	| summ < n  = ser' n xs (summ + digits)
	| otherwise = (x, summ, summ - n, n - summ - digits)
	where
		digits = if x < 10 then 1 else ceiling (logBase 10 (fromIntegral x))

-- Not so smart
series = series' [2*10^5,2*(10^5)-1..0]
series' :: [Int] -> String
series' = foldl (\x y -> show y ++ x) ""

answer = product . map digitToInt . map (series !!) $ [10^x | x <- [0..6]]