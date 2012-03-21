import Data.Maybe
import qualified Data.ByteString.Lazy.Char8 as BS

floorSqrt = floor . sqrt . fromIntegral
ceilSqrt = ceiling . sqrt . fromIntegral

divsum :: Int -> Int
divsum n
	| n <= 1 = 0
	| fsqrt == ceilSqrt n = fsqrt + divsum' n (fsqrt - 1)
	| otherwise = divsum' n fsqrt
	where fsqrt = floorSqrt n

-- If number is proper square (like 4 = 2^2 or 16 = 4^2)
-- then this algorithm will add √x twice because of n `div` x
-- so we check this corener case in divsum
divsum' :: Int -> Int -> Int
divsum' n x
	| x == 1 = 1
	| n `mod` x == 0 = x + n `div` x + divsum' n (x - 1)
	| otherwise = divsum' n (x - 1)

-- -- -- -- -- -- -- -- -- -- --

toInt :: BS.ByteString -> Int
toInt = fst . fromJust . BS.readInt

main = BS.getContents
	   >>= (putStr . unlines . map (show . divsum . toInt) . tail . BS.lines)