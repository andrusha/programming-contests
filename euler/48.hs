-- Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

series = [x^x | x <- [1..]]

main = print $ (`rem` 10^10) . sum . take 1000 $ series