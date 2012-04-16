-- By considering the terms in the Fibonacci sequence 
-- whose values do not exceed four million, 
-- find the sum of the even-valued terms.

import Numerix (fibonacci)

main = putStrLn . show . sum $ filter even $ takeWhile (< 4000000) fibonacci