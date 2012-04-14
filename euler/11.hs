-- What is the greatest product of four adjacent numbers
-- in any direction (up, down, left, right, or diagonally) in the 20x20 grid?

import Data.Array (listArray, Array, (!))
import Data.List (maximumBy)
import Data.Ord (comparing)

products :: Array Int Int -> [[(Int,Int,Int,Int)]]
products arr = [[down x y, right x y, diag x y, diagl x y] |
				y <- [0 .. 20],
				x <- [1 .. 20]]
		where 
			idx   x y = if x > 20 || y > 20 then -1 else x + y*20
			el    x y = if idx x y == -1 || idx x y > 400 || idx x y < 1 then 1 else arr ! (idx x y)
			down  x y = (el x y, el x (y+1), el x (y+2), el x (y+3))
			right x y = (el x y, el (x+1) y, el (x+2) y, el (x+3) y)
			diag  x y = (el x y, el (x+1) (y+1), el (x+2) (y+2), el (x+3) (y+3))
			diagl x y = (el x y, el (x-1) (y+1), el (x-2) (y+2), el (x-3) (y+3))

toArray :: String -> Array Int Int
toArray = listArray (1, 400) . map read . words

flat = foldl (++) []

prod4 (a,b,c,d) = a*b*c*d
answer = prod4 . maximumBy (comparing prod4). flat . products

main = putStrLn . show . answer . toArray =<< readFile "11.txt"
