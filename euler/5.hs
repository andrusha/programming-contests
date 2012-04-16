-- 2520 is the smallest number that can be divided
-- by each of the numbers from 1 to 10 without any remainder.

-- What is the smallest positive number that is evenly 
-- divisible by all of the numbers from 1 to 20?

-- Done it with pen and paper, answer is
-- П p^n, 
-- where p - prime divisors of X
-- and n - maximum power of p you can fit in

minus (x:xs) (y:ys) = case (compare x y) of 
           LT -> x : minus  xs  (y:ys)
           EQ ->     minus  xs     ys 
           GT ->     minus (x:xs)  ys
minus  xs     _     = xs

primesToG m = 2 : sieve [3,5..m]  where
    sieve (p:xs) 
       | p*p > m   = p : xs
       | otherwise = p : sieve (xs `minus` [p*p, p*p+2*p..])

maxPower x y = x ^ (floor $ logBase x y)

answer x = product . map (flip maxPower x) . primesToG $ x

main = putStrLn . show $ answer 20