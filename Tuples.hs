getUsername :: (String, Int) -> String
getUsername (name, _) = name

getAge :: (String, Int) -> Int
getAge (_, age) = age

calculate :: Int -> Int -> (Int, Int, Int)
calculate x y = (x + y, x - y, x * y)

main :: IO ()
main = do
  print (getUsername ("Adrian", 20))
  print (getAge ("Adrian", 20))
  print (calculate 10 5)