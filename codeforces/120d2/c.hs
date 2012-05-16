import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as B
--import qualified Data.ByteString.Lazy.Char8 as BS

-- wrong order + pairs might have commas too
answer :: Int -> [BS.ByteString] -> BS.ByteString
answer ex wrds = if n == ex then (BS.append str (B.pack ">")) else (B.pack "Error occurred")
	where (n, str, _) = foldr frmt (0, (B.pack ""), 0) wrds

frmt :: BS.ByteString -> (Int, BS.ByteString, Int) -> (Int, BS.ByteString, Int)
frmt s (n, x, sincePair)
	| s == (B.pack "pair") = (n, BS.append (B.pack "pair<") x, 0)
	| otherwise            = (succ n, BS.append (B.pack $ i sincePair) x, succ sincePair)

i 0 = "int"
i _ = ",int>"
--i _ = ",int"

main = do
	tmp <- getLine
	let expected = read tmp
	input <- BS.getLine
	let wrds = B.split ' ' input
	BS.putStrLn $ answer expected wrds
