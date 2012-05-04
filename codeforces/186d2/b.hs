import Data.List   (sortBy)
import Text.Printf (printf)

sortGT (a1, b1) (a2, b2)
  | b1 <  b2 = GT
  | b1 >  b2 = LT
  | b1 == b2 = EQ

answer :: Double -> Double -> Double -> [(Double, Double)] -> [(Int, Double)]
answer t1 t2 k gnomes = sortBy sortGT $ zipWith maxHeight [1..] gnomes
	where
		maxHeight n (a, b) = (n, max (height a b) (height b a))
		height a b = t1 * a * k + t2 * b

showGnome :: (Int, Double) -> String
showGnome (i, h) = printf "%i %.2f" i h

toTuple :: [a] -> (a, a)
toTuple (x:y:[]) = (x,y)
toTuple _        = error "wrong input"

main = do
	tmp <- getLine
	let (n:t1:t2:k:[]) = map read . words $ tmp
	gnomeTmp <- getContents
	let gnomes = map (toTuple . map read . words) . lines $ gnomeTmp
	putStrLn . unlines . map showGnome $ answer t1 t2 (k/100) gnomes