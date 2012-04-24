import Data.List
import Data.Maybe
import qualified Data.ByteString.Char8 as BS

answer :: [Int] -> Int -> Int -> Int
answer xs n k = maximum . map (bestGuess k) $ takeAll xs n

modSum = abs . sum

bestGuess k xs = max left right
	where
		rest     = (length xs) - k
		sorted   = sort xs
		msum     = sum xs
		leftSum  = modSum . filter (< 0) . take k $ sorted
		left     = msum + 2 * leftSum
		rightSum = modSum . filter (> 0) . drop rest $ sorted
		right    = abs $ msum - 2 * rightSum

takeAll xs n = seed : takeAll' (drop n xs) seed
	where
		seed = take n xs

takeAll' []     _      = []
takeAll' _      []     = []
takeAll' (x:xs) (_:ys) = next : takeAll' xs next
	where
		next = ys ++ [x]

--

toIntArr :: BS.ByteString -> [Int]
toIntArr = (map $ fst . fromJust . BS.readInt) . BS.words

main = do
	line1 <- getLine
	xs    <- BS.getLine
	k     <- getLine
	putStrLn . show $ answer (toIntArr xs) ((map read . words $ line1) !! 1) (read k)