-- myLength []        -> 0
-- myLength [5]       -> 1
-- myLength [5,10]    -> 2
-- myLength [5,10,15] -> 3
myLength :: [Int] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

-- mySum []        -> 0
-- mySum [5]       -> 5
-- mySum [5,10]    -> 15
-- mySum [5,10,15] -> 30
mySum :: [Int] -> Int
mySum [] = 0
mySum (x:xs) = x + mySum xs

-- myProduct []        -> 1
-- myProduct [1]       -> 1
-- myProduct [1, 2]    -> 2
-- myProduct [1, 2, 3]  -> 6
myProduct :: [Int] -> Int
myProduct [] = 1
myProduct (x:xs) = x * myProduct xs

-- containsZero []          -> False
-- containsZero [5]         -> False
-- containsZero [0]         -> true
-- containsZero [5, 10, 0]  -> True
-- containsZero [5, 10, 15] -> False
containsZero :: [Int] -> Bool
containsZero [] = False
containsZero (0:_) = True
containsZero (_:xs) = containsZero xs

-- countZeros []            -> 0
-- countZeros [5]           -> 0
-- countZeros [0]           -> 1
-- countZeros [0, 5, 0]     -> 2
-- countZeros [0, 0, 0, 0]  -> 4
-- countZeros [5, 10, 15]   -> 0
countZeros :: [Int] -> Int
countZeros [] = 0
countZeros (0:xs) = 1 + countZeros xs
countZeros (_:xs) = countZeros xs

-- countPositive []             -> 0
-- countPositive [5]            -> 1
-- countPositive [-5]           -> 0
-- countPositive [0]            -> 0
-- countPositive [5, -2, 3]     -> 2
-- countPositive [-1, -2, -3]   -> 0
-- countPositive [1, 0, -2, 10] -> 2
countPositive :: [Int] -> Int
countPositive [] = 0
countPositive (x:xs) =
  if x > 0
    then 1 + countPositive xs
    else countPositive xs

-- onlyPositive []             -> []
-- onlyPositive [5]            -> [5]
-- onlyPositive [-5]           -> []
-- onlyPositive [0]            -> []
-- onlyPositive [5, -2, 3]     -> [5, 3]
-- onlyPositive [-1, -2, -3]   -> []
-- onlyPositive [1, 0, -2, 10] -> [1, 10]
onlyPositive :: [Int] -> [Int]
onlyPositive [] = []
onlyPositive (x:xs) =
  if x > 0
    then x : onlyPositive xs
    else onlyPositive xs

-- doubleAll []            -> []
-- doubleAll [5]           -> [10]
-- doubleAll [1, 2, 3]     -> [2, 4, 6]
-- doubleAll [-1, 0, 4]    -> [-2, 0, 8]
-- doubleAll [10, 20, 30]  -> [20, 40, 60]
doubleAll :: [Int] -> [Int]
doubleAll [] = []
doubleAll (x:xs) =
  (x * 2) : doubleAll xs

-- maximumList [5]             -> 5
-- maximumList [1, 5, 3]       -> 5
-- maximumList [10, 2, 8, 4]   -> 10
-- maximumList [-5, -2, -10]   -> -2
-- maximumList [3, 3, 3]       -> 3
-- maximumList [-10, 0, 10]    -> 10
maximumList :: [Int] -> Int
maximumList [x] = x
maximumList (x:y:xs) =
  -- If x is greater, remove y and reinsert x into the list.
  -- Else, remove x and reinsert y into the list.
  if x > y
    then maximumList (x:xs)
    else maximumList (y:xs)

-- reverseList []            -> []
-- reverseList [5]           -> [5]
-- reverseList [1, 2]        -> [2, 1]
-- reverseList [1, 2, 3]     -> [3, 2, 1]
-- reverseList [10, 20, 30]  -> [30, 20, 10]
-- reverseList [-1, 0, 1]    -> [1, 0, -1]
reverseList :: [Int] -> [Int]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

-- zipLists [] []               -> []
-- zipLists [1] [10]            -> [(1, 10)]
-- zipLists [1, 2] [10, 20]     -> [(1, 10), (2, 20)]
-- zipLists [1, 2, 3] [4, 5, 6] -> [(1, 4), (2, 5), (3, 6)]
-- zipLists [] [1, 2]            -> []
-- zipLists [1, 2] []            -> []
zipLists :: [Int] -> [Int] -> [(Int, Int)]
zipLists _ [] = []
zipLists [] _ = []
zipLists (x:xs) (y:ys) = 
  (x, y) : zipLists xs ys

main :: IO()
main = do
  print (myLength [])
  print (myLength [1])
  print (myLength [1, 2])
  print (myLength [1, 2, 3])

  print (mySum [])
  print (mySum [1])
  print (mySum [1, 2])
  print (mySum [1, 2, 3])

  print (myProduct [])
  print (myProduct [1])
  print (myProduct [1, 2])
  print (myProduct [1, 2, 3])

  print (containsZero [])
  print (containsZero [5])
  print (containsZero [0])
  print (containsZero [5, 10, 0])
  print (containsZero [5, 10, 15])

  print (countZeros [])
  print (countZeros [5])
  print (countZeros [0])
  print (countZeros [0, 5, 0])
  print (countZeros [0, 0, 0, 0])
  print (countZeros [5, 10, 15])

  print (countPositive [])
  print (countPositive [5])
  print (countPositive [-5])
  print (countPositive [0])
  print (countPositive [5, -2, 3])
  print (countPositive [-1, -2, -3])
  print (countPositive [1, 0, -2, 10])

  print (onlyPositive [])
  print (onlyPositive [5])
  print (onlyPositive [-5])
  print (onlyPositive [0])
  print (onlyPositive [5, -2, 3])
  print (onlyPositive [-1, -2, -3])
  print (onlyPositive [1, 0, -2, 10])

  print (doubleAll [])
  print (doubleAll [5])
  print (doubleAll [1, 2, 3])
  print (doubleAll [-1, 0, 4])
  print (doubleAll [10, 20, 30])

  print (maximumList [5])
  print (maximumList [1, 5, 3])
  print (maximumList [10, 2, 8, 4])
  print (maximumList [-5, -2, -10])
  print (maximumList [3, 3, 3])
  print (maximumList [-10, 0, 10])

  print (reverseList [])
  print (reverseList [5])
  print (reverseList [1, 2])
  print (reverseList [1, 2, 3])
  print (reverseList [10, 20, 30])
  print (reverseList [-1, 0, 1])

  print (zipLists [] [])
  print (zipLists [1] [10])
  print (zipLists [1, 2] [10, 20])
  print (zipLists [1, 2, 3] [4, 5, 6])
  print (zipLists [] [1, 2])
  print (zipLists [1, 2] [])