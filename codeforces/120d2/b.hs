import Text.Printf

distance (x1, y1) (x2, y2) = sqrt $ (x2 - x1)**2 + (y2 - y1)**2

answer :: (Double, Double, Double) -> (Double, Double, Double) -> Double
answer (x1, y1, r1) (x2, y2, r2) = (d - r1 - r2) / 2
	where d = distance (x1, y1) (x2, y2)

getCircle = do
	circle <- getLine
	let [x, y, r] = map read . words $ circle
	return (x, y, r)

main = do
	c1 <- getCircle
	c2 <- getCircle
	printf "%.15f\n" $ answer c1 c2