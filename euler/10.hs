-- Find the sum of all the primes below two million.

import Numerix (primes)

main = putStrLn . show $ sum . takeWhile (< 2*10^6) $ primes