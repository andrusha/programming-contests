--import Data.List
import qualified Data.ByteString as B

---------------

-- Factorization in O(√n)
floorSqrt = floor . sqrt . fromIntegral
ceilSqrt = ceiling . sqrt . fromIntegral

factors :: Int -> [Int]
factors n
	| n <= 1              = []
	| fsqrt == ceilSqrt n = n : fsqrt : factors' n (fsqrt - 1)
	| otherwise           = n :         factors' n fsqrt
	where 
		fsqrt = floorSqrt n

-- If number is proper square (like 4 = 2^2 or 16 = 4^2)
-- then this algorithm will add √x twice because of n `div` x
-- so we check this corener case in factors
factors' :: Int -> Int -> [Int]
factors' n x
	| x == 1         = [1]
	| n `mod` x == 0 = x : n `div` x : factors' n (x - 1)
	| otherwise      =                 factors' n (x - 1)

---------------

mutualFactors a b = mutualFactors' a b (min a b)
mutualFactors' _ _ 0 = []
mutualFactors' a b x
	| (a `mod` x == 0) && (b `mod` x == 0) = x : mutualFactors' a b (pred x)
	| otherwise                            =     mutualFactors' a b (pred x)

---------------

answer :: B.ByteString -> B.ByteString -> Int
answer a b = length . filter (isMutual a b) $ fac
	where
		isMutual a b c = (a `B.index` (c-1)) == (b `B.index` (c-1))
						 && (sameChar a c)
						 && (sameChar b c)
		fac = mutualFactors (B.length a) (B.length b)
		--fac = (factors $ B.length a) `intersect` (factors $ B.length b)

sameChar :: B.ByteString -> Int -> Bool
sameChar s step = all (== True) $ map call [0..step-1]
	where
		call x = sameChar' s (s `B.index` x) step x

sameChar' s chr step x
	| x >= B.length s        = True
	| (s `B.index` x) == chr = sameChar' s chr step (x + step)
	| otherwise              = False

----------------

main = do
	a <- B.getLine
	b <- B.getLine
	putStrLn . show $ answer a b