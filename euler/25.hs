-- What is the first term in the Fibonacci sequence to contain 1000 digits?

fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

main = print $ fst . head . dropWhile ((< 10^999).snd) $ zip [1..] fibs