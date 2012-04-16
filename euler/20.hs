import Data.Char

fac n = product [1..n]

digitSum = sum . map digitToInt . show

main = print $ digitSum . fac $ 100