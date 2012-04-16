-- Starting in the top left corner of a 2x2 grid, 
-- there are 6 routes (without backtracking) to the bottom right corner.
-- How many routes are there through a 20x20 grid?

import Numerix (binomial)

paths n = binomial (2*n) n

main = print $ paths 20