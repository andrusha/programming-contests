-- What is the millionth lexicographic permutation 
-- of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

import Data.List ((\\))
import Numerix   (factorial)

fitPermut n x 
	| n == 0 || x == 0 = []
	| otherwise        = cur : fitPermut rest (pred x)
	where 
		cur  = n `div` (factorial x)
		rest = n - (factorial x) * cur

coeffToNum [] nums     = nums
coeffToNum _ []        = []
coeffToNum (x:xs) nums = num : coeffToNum xs (nums\\[num])
	where num = nums !! x

answer = flip coeffToNum [0..9] $ fitPermut (10^6-1) 9

main = print $ answer