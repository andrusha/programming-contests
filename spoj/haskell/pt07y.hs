import List
import qualified Data.ByteString.Lazy.Char8 as BS

xchg :: (a, b) -> (b, a)
xchg x = (snd x, fst x)

uniq :: Eq a => [(a, a)] -> [(a, a)]
uniq xs = nubBy ((==) . xchg) xs

flat :: [(a,a)] -> [a]
flat [] = []
flat (x:xs) = fst x : snd x : flat xs

hasCycles :: Ord a => [(a,a)] -> Bool
hasCycles = any (> 2) . map length . group . sort . flat . uniq

-- -- -- -- -- -- -- -- -- -- --

tuplify2 :: [a] -> (a, a)
tuplify2 [x, y] = (x, y)

toInt :: BS.ByteString -> Int
toInt x =
	case BS.readInt x of 
		Just (i,_) -> i
		Nothing    -> error "Unparsable Int"

convert :: BS.ByteString -> [(Int, Int)]
convert = map lineToTuple . BS.lines
	where lineToTuple = tuplify2 . map toInt . BS.words

boolToStr :: Bool -> String
boolToStr x = if x then "YES" else "NO"

main = do
	input <- BS.getContents
	putStrLn . boolToStr . not . hasCycles . convert $ input