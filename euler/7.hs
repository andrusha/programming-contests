-- What is the 10 001st prime number?

import Numerix (primes)

main = putStrLn . show $ primes !! 10000