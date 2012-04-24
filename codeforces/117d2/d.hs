import Data.List
import qualified Data.ByteString.Char8 as B

answer a b = length . filter (isMutual a b) $ fac
	where
		isMutual a b c = (a `B.index` (c-1)) == (b `B.index` (c-1))
		fac = (factors a) `intersect` (factors b)

factors s = filter (sameChar s) possible
	where
		lens = B.length s
		possible = if odd lens then [1,3..lens] else [1]++[2,4..lens]

sameChar s step = all (== True) $ map call [0..step-1]
	where
		call x = sameChar' s (s `B.index` x) step x

sameChar' s chr step x
	| x >= B.length s        = True
	| (s `B.index` x) == chr = sameChar' s chr step (x + step)
	| otherwise              = False

main = do
	a <- B.getLine
	b <- B.getLine
	putStrLn . show $ answer a b