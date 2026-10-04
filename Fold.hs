-- sumAll []            -> 0
-- sumAll [5]           -> 5
-- sumAll [1, 2, 3]     -> 6
-- sumAll [-2, 5, 3]    -> 6
-- sumAll [10, 20, 30]  -> 60
sumAll :: [Int] -> Int
sumAll xs = foldr (+) 0 xs

-- countAll []            -> 0
-- countAll [5]           -> 1
-- countAll [1, 2, 3]     -> 3
-- countAll [-2, 0, 5, 8] -> 4
-- countAll [10, 20]      -> 2
countAll :: [Int] -> Int
countAll xs = foldr (\_ acc -> acc + 1) 0 xs

-- allPositive []            -> True
-- allPositive [5]           -> True
-- allPositive [1, 2, 3]     -> True
-- allPositive [1, -2, 3]    -> False
-- allPositive [0, 1, 2]     -> False
-- allPositive [-1, -2, -3]  -> False
allPositive :: [Int] -> Bool
allPositive xs = foldr (\el acc -> acc && el > 0) True xs

-- anyNegative []             -> False
-- anyNegative [5]            -> False
-- anyNegative [-5]           -> True
-- anyNegative [1, 2, 3]      -> False
-- anyNegative [1, -2, 3]     -> True
-- anyNegative [-1, -2, -3]   -> True

anyNegative :: [Int] -> Bool
anyNegative xs = foldr (\el acc -> acc || el < 0) False xs

-- sumEven []            -> 0
-- sumEven [5]           -> 0
-- sumEven [2]           -> 2
-- sumEven [1, 2, 3]     -> 2
-- sumEven [2, 4, 6]     -> 12
-- sumEven [1, 2, 3, 4]  -> 6
-- sumEven [-2, 3, -4]   -> -6

sumEven :: [Int] -> Int
sumEven xs = foldr (\el acc -> acc + (if mod el 2 == 0 then el else 0)) 0 xs

-- countPositive []             -> 0
-- countPositive [5]            -> 1
-- countPositive [-5]           -> 0
-- countPositive [1, 2, 3]      -> 3
-- countPositive [1, -2, 3]     -> 2
-- countPositive [0, 1, -2, 5]  -> 2

countPositive :: [Int] -> Int
countPositive xs = foldr (\el acc -> acc + (if el > 0 then 1 else 0)) 0 xs

main :: IO()
main = do
  print (sumAll [])
  print (sumAll [5])
  print (sumAll [1, 2, 3])
  print (sumAll [-2, 5, 3])
  print (sumAll [10, 20, 30])

  print (countAll [])
  print (countAll [5])
  print (countAll [1, 2, 3])
  print (countAll [-2, 0, 5, 8])
  print (countAll [10, 20])

  print (allPositive [])
  print (allPositive [5])
  print (allPositive [1, 2, 3])
  print (allPositive [1, -2, 3])
  print (allPositive [0, 1, 2])
  print (allPositive [-1, -2, -3])

  print (anyNegative [])
  print (anyNegative [5])
  print (anyNegative [-5])
  print (anyNegative [1, 2, 3])
  print (anyNegative [1, -2, 3])
  print (anyNegative [-1, -2, -3])

  print (sumEven [])
  print (sumEven [5])
  print (sumEven [2])
  print (sumEven [1, 2, 3])
  print (sumEven [2, 4, 6])
  print (sumEven [1, 2, 3, 4])
  print (sumEven [-2, 3, -4])

  print (countPositive [])
  print (countPositive [5])
  print (countPositive [-5])
  print (countPositive [1, 2, 3])
  print (countPositive [1, -2, 3])
  print (countPositive [0, 1, -2, 5])