-- Find the sum of all numbers, less than one million, 
-- which are palindromic in base 10 and base 2.
--
-- (Please note that the palindromic number, in either base, 
--	may not include leading zeros.)

import Numeric
import Data.Char

palindromes :: [Int]
palindromes = concat [onetwo, threefour, fivesix]
	where
		onetwo    = concat [[x, x*10 + x] | x <- [0..9]]
		threefour = concat [[x*10^2 + y*10   + x, 
							 x*10^3 + y*10^2 + y*10 + x]
							 | x <- [0..9], y <- [0..9]]
		fivesix   = concat [[x*10^4 + y*10^3 + z*10^2 + y*10^1 + x,
							 x*10^5 + y*10^4 + z*10^3 + z*10^2 + y*10 + x]
							 | x <- [0..9], y <- [0..9], z <- [0..9]]

isBinPalindrome x = isStrPalindrome bin
	where
		bin   = showIntAtBase 2 intToDigit x ""

isStrPalindrome "" = True
isStrPalindrome x  = all (== True) [eq i | i <- [0..size `div` 2]]
	where
		size  = length x
		eq i  = (x !! i) == (x !! (size - i - 1))

answer = sum . filter isBinPalindrome $ palindromes

main = print $ answer