-- Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.

main = putStrLn . take 10 . show . sum . map read . lines =<< readFile "13.txt"