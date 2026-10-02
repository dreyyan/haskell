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