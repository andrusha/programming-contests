-- 2520 is the smallest number that can be divided
-- by each of the numbers from 1 to 10 without any remainder.

-- What is the smallest positive number that is evenly 
-- divisible by all of the numbers from 1 to 20?

-- Done it with pen and paper, answer is
-- П p^n, 
-- where p - prime divisors of X
-- and n - maximum power of p you can fit in

import Numerix (primes)

maxPower x y = x ^ (floor $ logBase (fromIntegral x) (fromIntegral y))
answer x = product . map (flip maxPower x) . takeWhile (< x) $ primes

main = putStrLn . show $ answer 20