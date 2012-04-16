-- Starting in the top left corner of a 2x2 grid, 
-- there are 6 routes (without backtracking) to the bottom right corner.
-- How many routes are there through a 20x20 grid?

fac n = product [1..n]

binominal n k = (fac n)/((fac k) * (fac (n - k)))

paths n = binominal (2*n) n

main = print $ paths 20