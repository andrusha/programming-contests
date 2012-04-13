-- A palindromic number reads the same both ways. 
-- The largest palindrome made from the product of two
-- 2-digit numbers is 9009 = 91 99.

-- Find the largest palindrome made from the product of two 3-digit numbers.

-- 999*999 = 998001
palindromes = [x*100000 + y*10000 + z*1000 + z*100 + y*10 + x | x <- [9,8..1], y <- [9,8..0], z <- [7,6..0]]

threeFactors' x 1000 = False
threeFactors' x y = x `mod` y == 0
					&& between (x `div` y) 100 999 
					|| threeFactors' x (y + 1)
	where between x y z = y <= x && x <= z

threeFactors x = threeFactors' x 100

result = head . dropWhile (not . threeFactors) $ palindromes

main = putStrLn . show $ result