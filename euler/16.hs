-- What is the sum of the digits of the number 2^1000?

import Data.Char

digitSum = sum . map digitToInt . show

main = print $ digitSum . truncate $ 2**1000