-- Starting with the number 1 and moving to the right in a clockwise
-- direction a 5 by 5 spiral is formed as follows:
--
-- 21 22 23 24 25
-- 20  7  8  9 10
-- 19  6  1  2 11
-- 18  5  4  3 12
-- 17 16 15 14 13
--
-- What is the sum of the numbers on the diagonals in a 1001 by 1001
-- spiral formed in the same way?

-- It is easy to notice that number in upper-right corner
-- of each square is... odd square
oddSqrs = [x^2 | x <- [1,3..]]

-- We can copute the rest of square numbers like so
divide (x,y) = [y - i*step | i <- [0..3]]
	where step = (y - x) `div` 4

sqrNumbers = map divide $ zip oddSqrs (tail oddSqrs)

answer n = succ . sum . concat . take (n `div` 2) $ sqrNumbers

main = зкште $ answer 1001