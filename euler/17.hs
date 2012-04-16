-- If all the numbers from 1 to 1000 (one thousand) inclusive were
-- written out in words, how many letters would be used?
--
-- NOTE: Do not count spaces or hyphens. 
-- For example, 342 (three hundred and forty-two) contains 
-- 23 letters and 115 (one hundred and fifteen) contains 20 letters. 
-- The use of "and" when writing out numbers is in compliance with British usage.


(!!!) :: Int -> Int -> Int
(!!!) x y = (x `rem` 10^y) `div` 10^(y-1)

thousands :: Int -> String
thousands n
	| n !!! 4 == 0 = hundreds n
	| otherwise    = (ones (n !!! 4)) ++ ("thousand") ++ rest
	where rest
			| n `rem` 1000 > 0 = "and" ++ (hundreds n)
			| otherwise        = ""

hundreds :: Int -> String
hundreds n
	| n !!! 3 == 0 = tens n
	| otherwise    = (ones (n !!! 3))  ++ ("hundred") ++ rest
	where rest
			| n `rem` 100 > 0 = "and" ++ (tens (n `rem` 100))
			| otherwise       = ""

tens :: Int -> String
tens n
	| n  < 10   = ones n
	| n == 10   = "ten"
	| n == 11   = "eleven"
	| n == 12   = "twelve"
	| n == 13   = "thirteen"
	| n == 14   = "fourteen"
	| n  < 20   = (short (n !!! 1)) ++ ("teen")
	| otherwise = (short (n !!! 2)) ++ ("ty") ++ rest
	where
		rest
			| n !!! 1 > 0 = ones (n !!! 1)
			| otherwise   = ""

ones :: Int -> String
ones 1 = "one"
ones 2 = "two"
ones 3 = "three"
ones 4 = "four"
ones 5 = "five"
ones 6 = "six"
ones 7 = "seven"
ones 8 = "eight"
ones 9 = "nine"
ones _ = error "wrong number"

short :: Int -> String
short 2 = "twen"
short 3 = "thir"
short 4 = "for"
short 5 = "fif"
short 6 = "six"
short 7 = "seven"
short 8 = "eigh"
short 9 = "nine"
short _ = error "wrong number"

main = print $ sum . map (length.thousands) $ [1..1000]