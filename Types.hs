isAdult :: Int -> Bool
isAdult age = age >= 18

remainder :: Int -> Int -> Int
remainder x y = x `mod` y

isValidAge :: Int -> Bool
isValidAge age = (age >= 0) && (age <= 120)

main :: IO()
main = do
  print (isAdult 18)
  print (5 `remainder` 2)
  print (isValidAge 30)