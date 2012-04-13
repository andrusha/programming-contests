-- The prime factors of 13195 are 5, 7, 13 and 29.
-- What is the largest prime factor of the number 600851475143 ?

isPrime n = n > 1 &&
              foldr (\p r -> p*p > n || ((n `rem` p) /= 0 && r))
                True primes
 
primeFactors n | n > 1 = go n primes
   where
     go n ps@(p:ps')
        | p*p > n        = [n]
        | n `rem` p == 0 =  p : go (n `quot` p) ps
        | otherwise      =      go n ps'

primes = 2 : filter isPrime [3,5..]

oddSqrt n = if odd x then x else x - 1
    where x = ceiling . sqrt $ fromIntegral n

isFactor x y = x `mod` y == 0

lrgstPrimeFactor x = head . dropWhile (not . gotcha) $ [oddSqrt x, oddSqrt x - 2 .. 1]
    where gotcha y = isFactor x y && isPrime y

main = putStrLn . show . lrgstPrimeFactor $ 600851475143