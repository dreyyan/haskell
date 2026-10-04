-- onlyEven []              -> []
-- onlyEven [2]             -> [2]
-- onlyEven [1]             -> []
-- onlyEven [1, 2, 3, 4]    -> [2, 4]
-- onlyEven [-4, -3, 0, 5]  -> [-4, 0]
-- onlyEven [10, 20, 30]    -> [10, 20, 30]
onlyEven :: [Int] -> [Int]
onlyEven xs = filter (\x -> x `mod` 2 == 0) xs

-- squarePositives []              -> []
-- squarePositives [2]             -> [4]
-- squarePositives [-2]            -> []
-- squarePositives [1, -2, 3]      -> [1, 9]
-- squarePositives [-3, 0, 4, 5]   -> [16, 25]
-- squarePositives [2, 3, 4]       -> [4, 9, 16]
squarePositives :: [Int] -> [Int]
squarePositives xs = map (\x -> x * x) (filter (\x -> x > 0) xs)

main :: IO()
main = do
  print (onlyEven [])
  print (onlyEven [2])
  print (onlyEven [1])
  print (onlyEven [1, 2, 3, 4])
  print (onlyEven [-4, -3, 0, 5])
  print (onlyEven [10, 20, 30])

  print (squarePositives [])
  print (squarePositives [2])
  print (squarePositives [-2])
  print (squarePositives [1, -2, 3])
  print (squarePositives [-3, 0, 4, 5])
  print (squarePositives [2, 3, 4])