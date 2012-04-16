-- What is the first term in the Fibonacci sequence to contain 1000 digits?

import Numerix (fibonacci)

main = print $ fst . head . dropWhile ((< 10^999).snd) $ zip [1..] fibonacci