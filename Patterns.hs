describeNumber :: Int -> String
describeNumber 0 = "Zero"
describeNumber 1 = "One"
describeNumber _ = "Other"

calculate :: Char -> Int -> Int -> Int
calculate '+' x y = x + y
calculate '-' x y = x - y
calculate '*' x y = x * y

-- for any operator and any two numbers without matching definitions, return 0.
calculate _ _ _ = 0

main :: IO()
main = do
  print (describeNumber 0)
  print (describeNumber 1)
  print (describeNumber 2)

  print (calculate '+' 4 2)
  print (calculate '-' 4 2)
  print (calculate '*' 4 2)
  print (calculate 'A' 4 2)