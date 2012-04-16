-- How many Sundays fell on the first of the month 
-- during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

weekDays :: [String]
weekDays = [] : cycle ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]

daysInMonth :: Int -> Int -> Int
daysInMonth year n
	| n == 2               = february
	| elem n [4, 6, 9, 11] = 30
	| otherwise            = 31
	where
		february
			| year `mod` 4 == 0 && 
				(not (year `mod` 100 == 0) || 
				      year `mod` 400 == 0) = 29
			| otherwise                    = 28

monthStarts year yend month day
	| year > yend   = []
	| month == 13   = monthStarts (succ year) yend 1 day
	| otherwise     = (weekDays !! day) : monthStarts year yend (succ month) newday
	where newday = day + (daysInMonth year month)

daysInYear :: Int -> Int
daysInYear year = sum . map (daysInMonth year) $ [1..12]

answer = length . filter (== "sunday") $ monthStarts 1901 2000 1 (succ $ daysInYear 1900)

main = print $ answer