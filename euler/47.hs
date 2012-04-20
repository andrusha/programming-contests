-- Find the first four consecutive integers to have four 
-- distinct primes factors. What is the first of these numbers?

import Data.List (nub)
import Numerix (primeFactors)

fours = map (\x -> [x, x+1, x+2, x+3]) [0..]

fourPF = (== 4) . length . nub . primeFactors

answer = head . dropWhile (not . all fourPF) $ fours

main = print $ head answer