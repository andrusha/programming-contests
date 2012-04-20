-- Find the sum of all the numbers that can be written
-- as the sum of fifth powers of their digits.

--import Data.Char (digitToInt)

pwrSum :: Int -> Int
pwrSum 0 = 0
pwrSum n = (n `mod` 10)^5 + pwrSum (n `div` 10)

answer = sum $ filter good [10..(9^5)*7]
	where good x = pwrSum x == x

main = print answer