-- Considering natural numbers of the form, a^b, where a, b  100, 
-- what is the maximum digital sum?

digitSum :: Integer -> Integer
digitSum 0 = 0
digitSum n = (n `mod` 10) + digitSum (n `div` 10)

answer = maximum [maximum [digitSum (b^a) | b <- [2..99]] | a <- [70..100]]

main = print answer