-- Find the greatest product of five consecutive digits in the 1000-digit number.

import System.IO
import Data.Char

greatProduct = maximum . fiveProduct

fiveProduct []     = []
fiveProduct (x:xs) = x * (product . take 4) xs : fiveProduct xs

main = do
    inh <- openFile "8.txt" ReadMode
    number <- hGetLine inh
    hClose inh
    putStrLn . show $ greatProduct $ map digitToInt number