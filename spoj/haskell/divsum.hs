import Data.Maybe
import qualified Data.ByteString.Lazy.Char8 as BS

intSqrt :: Int -> Int
intSqrt = floor . sqrt . fromIntegral

divisors :: Int -> [Int]
divisors n = divisors' n (intSqrt n)

divisors' :: Int -> Int -> [Int]
divisors' n x
	| x == 1 = [1]
	| n `mod` x == 0 = x : n `div` x : divisors' n (x - 1)
	| otherwise = divisors' n (x - 1)

divsum :: Int -> Int
divsum = sum . divisors

-- -- -- -- -- -- -- -- -- -- --

toInt :: BS.ByteString -> Int
toInt = fst . fromJust . BS.readInt

main = BS.getContents
	   >>= (putStr . unlines . map (show . divsum . toInt) . tail . BS.lines)