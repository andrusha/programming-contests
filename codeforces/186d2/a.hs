pairCmp :: Eq a => (a,a) -> (a,a) -> Bool
pairCmp x y = fst x == snd y && snd x == fst y

isOk :: Eq b => [(a,(b,b))] -> Bool
isOk pairs
    | l == 0    = True
	| l == 2    = x `pairCmp` y
	| otherwise = False
    where
        l = length pairs
        x = snd $ pairs !! 0
        y = snd $ pairs !! 1

equal :: Char -> Char -> (Bool, (Char, Char))
equal x y = (x == y, (x, y))

cmp :: String -> String -> Bool
cmp a b
    | length a == length b = isOk . filter (not . fst) $ zipWith equal a b
    | otherwise            = False

boolToStr :: Bool -> String
boolToStr x = if x then "YES" else "NO"

main = do
	a <- getLine
	b <- getLine
	putStrLn $ boolToStr $ cmp a b