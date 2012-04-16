-- Let d(n) be defined as the sum of proper divisors of n 
-- (numbers less than n which divide evenly into n).
-- If d(a) = b and d(b) = a, where a /= b, 
-- then a and b are an amicable pair and each of a and b 
-- are called amicable numbers.
--
-- Evaluate the sum of all the amicable numbers under 10000.

import Numerix (amicable)

answer = foldl (\x y -> x + (fst y) + (snd y)) 0 . takeWhile ((< 10^4).snd) $ amicable

main = print $ answer