-- By considering the terms in the Fibonacci sequence 
-- whose values do not exceed four million, 
-- find the sum of the even-valued terms.

fibs = 1 : 2 : zipWith (+) fibs (tail fibs)
main = putStrLn . show . sum $ filter even $ takeWhile (< 4000000) fibs