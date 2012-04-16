-- Find the sum of the digits in the number 100!

import Data.Char (digitToInt)
import Numerix   (factorial)

digitSum = sum . map digitToInt . show

main = print $ digitSum . factorial $ 100