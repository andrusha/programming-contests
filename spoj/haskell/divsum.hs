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
toInt x =
	case BS.readInt x of 
		Just (i,_) -> i
		Nothing    -> error "Unparsable Int"

main = do
	input <- BS.getContents
	mapM_ (putStrLn . show) $ map (divsum . toInt) . tail . BS.lines $ input