-- []         -> 0
-- [1, 2, 3]  -> 1
-- Note: Don't use `head`
first :: [Int] -> Int
first [] = 0
first (x:_) = x

-- []         -> True
-- [1, 2, 3]  -> False
isEmpty :: [Int] -> Bool
isEmpty [] = True
isEmpty (_:_) = False

-- []         -> 0
-- [1]        -> 0
-- [1, 2]     -> 2
-- [1, 2, 3]  -> 2
second :: [Int] -> Int
second [] = 0
second [_] = 0
second (_: (y:_)) = y


main :: IO()
main = do
  print (first [])
  print (first [1, 2, 3])

  print (isEmpty [])
  print (isEmpty [1, 2, 3])

  print (second [])
  print (second [1])
  print (second [1, 2])
  print (second [1, 2, 3])