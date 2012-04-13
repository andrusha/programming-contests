-- Find the sum of all the multiples of 3 or 5 below 1000.

mult35 x = x `mod` 3 == 0 || x `mod` 5 == 0
main = putStrLn . show . sum $ filter mult35 [3..999]