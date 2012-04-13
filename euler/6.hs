-- Find the difference between the sum of the squares of
-- the first one hundred natural numbers and the square of the sum.

sumSqr = sum . map (** 2)
sqrSum = (** 2) . sum

main = putStrLn . show $ (sqrSum [1..100]) - (sumSqr [1..100])