temperatureStatus :: Int -> String
temperatureStatus temp
  | temp < 0 = "Freezing"
  | temp <= 20 = "Cold"
  | temp <= 30 = "Warm"
  | otherwise = "Hot"

canVote :: Int -> Bool
canVote age =
  if age >= 18
    then True
    else False
  -- or canVote age = age >= 18

main :: IO()
main = do
  print (temperatureStatus (-10))
  print (temperatureStatus 20)
  print (temperatureStatus 30)
  print (temperatureStatus 40)

  print (canVote 18)
  print (canVote 10)