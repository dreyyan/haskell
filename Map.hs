-- squareAll []            -> []
-- squareAll [5]           -> [25]
-- squareAll [1, 2, 3]     -> [1, 4, 9]
-- squareAll [-2, 0, 3]    -> [4, 0, 9]
-- squareAll [10, 20]      -> [100, 400]
squareAll :: [Int] -> [Int]
squareAll [] = []
squareAll xs = map (\x -> x * x) xs

-- addTen []            -> []
-- addTen [5]           -> [15]
-- addTen [1, 2, 3]     -> [11, 12, 13]
-- addTen [-10, 0, 10]  -> [0, 10, 20]
-- addTen [20, 30]      -> [30, 40]
addTen :: [Int] -> [Int]
addTen xs = map (\x -> x + 10) xs

main :: IO()
main = do
  print (squareAll [])
  print (squareAll [5])
  print (squareAll [1, 2, 3])
  print (squareAll [-2, 0, 3])
  print (squareAll [10, 20])

  print (addTen [])
  print (addTen [5])
  print (addTen [1, 2, 3])
  print (addTen [-10, 0, 10])
  print (addTen [20, 30])  