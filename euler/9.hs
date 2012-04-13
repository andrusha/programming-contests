-- A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
-- a^2 + b^2 = c^2
-- There exists exactly one Pythagorean triplet for which a + b + c = 1000.
-- Find the product abc.

-- O (n log n)
answer = head $ [a * b * sqrt(a**2 + b**2) | 
				a <- [1..1000],
				b <- [a..1000-a],
				a + b + sqrt(a**2 + b**2) == 1000]

main = putStrLn . show $ answer