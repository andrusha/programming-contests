-- Find the sum of all numbers 
-- which are equal to the sum of the factorial of their digits.

import Numerix (factorial)

digitSum :: Int -> Int
digitSum 0 = 0
digitSum n =  (factorial (n `mod` 10)) + digitSum (n `div` 10)

answer = sum . filter (\x -> x == digitSum x) $ [3..(factorial 9)*7]

main = print answer