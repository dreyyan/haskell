-- safeLast []              -> Nothing
-- safeLast [5]             -> Just 5
-- safeLast [1, 2, 3]       -> Just 3
-- safeLast ["A", "B", "C"] -> Just "C"

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast [x] = Just x
safeLast (_:xs) = safeLast xs

-- maybeNumber Nothing   -> 0
-- maybeNumber (Just 5)  -> 5
-- maybeNumber (Just 20) -> 20
-- maybeNumber (Just -3) -> -3

maybeNumber :: Maybe Int -> Int
maybeNumber Nothing = 0
maybeNumber (Just x) = x

-- fromMaybe 0 Nothing             -> 0
-- fromMaybe 0 (Just 10)           -> 10
-- fromMaybe "Guest" Nothing       -> "Guest"
-- fromMaybe "Guest" (Just "Adrian") -> "Adrian"
-- fromMaybe False (Just True)      -> True

fromMaybe :: a -> Maybe a -> a
fromMaybe defaultVal Nothing = defaultVal
fromMaybe _ (Just a) = a

-- doubleMaybe Nothing    -> Nothing
-- doubleMaybe (Just 0)   -> Just 0
-- doubleMaybe (Just 5)   -> Just 10
-- doubleMaybe (Just -3)  -> Just -6

doubleMaybe :: Maybe Int -> Maybe Int
doubleMaybe Nothing = Nothing
doubleMaybe (Just x) = Just (x * 2)

-- positiveOnly 5    -> Just 5
-- positiveOnly 1    -> Just 1
-- positiveOnly 0    -> Nothing
-- positiveOnly (-3) -> Nothing

positiveOnly :: Int -> Maybe Int
positiveOnly x =
  if x > 0 then Just x else Nothing

-- safeDivide 10 2  -> Just 5
-- safeDivide 20 4  -> Just 5
-- safeDivide 7 2   -> Just 3
-- safeDivide 10 0  -> Nothing
-- safeDivide 0 5   -> Just 0

safeDivide :: Int -> Int -> Maybe Int
safeDivide _ 0 = Nothing
safeDivide x y = Just (x `div` y)

-- addTenMaybe Nothing    -> Nothing
-- addTenMaybe (Just 5)   -> Just 15
-- addTenMaybe (Just 0)   -> Just 10
-- addTenMaybe (Just (-3)) -> Just 7

addTenMaybe :: Maybe Int -> Maybe Int
addTenMaybe Nothing = Nothing
addTenMaybe (Just x) = Just (x + 10)

-- usernameLength Nothing           -> Nothing
-- usernameLength (Just "")         -> Just 0
-- usernameLength (Just "Adrian")   -> Just 6
-- usernameLength (Just "Haskell")  -> Just 7

usernameLength :: Maybe String -> Maybe Int
usernameLength Nothing = Nothing
usernameLength (Just x) = Just (length x)

-- safeDivideEither 10 2 -> Right 5
-- safeDivideEither 7 2  -> Right 3
-- safeDivideEither 10 0 -> Left "Cannot divide by zero"
-- safeDivideEither 0 5  -> Right 0

safeDivideEither :: Int -> Int -> Either String Int
safeDivideEither _ 0 = Left "Cannot divide by zero"
safeDivideEither x y = Right (x `div` y)

-- validateAge (-5) -> Left "Age cannot be negative"
-- validateAge 0    -> Right 0
-- validateAge 20   -> Right 20
-- validateAge 120  -> Right 120
-- validateAge 121  -> Left "Age is too high"

validateAge :: Int -> Either String Int
validateAge x
  | x < 0 = Left "Age cannot be negative"
  | x > 120 = Left "Age is too high"
  | otherwise = Right x

-- resultMessage (Left "Invalid age")
-- -> "Error: Invalid age"
--
-- resultMessage (Left "Not found")
-- -> "Error: Not found"
--
-- resultMessage (Right 20)
-- -> "Success: 20"
--
-- resultMessage (Right 100)
-- -> "Success: 100"

resultMessage :: Either String Int -> String
-- resultMessage (Left err) = "Error: " ++ err
-- resultMessage (Right x) = "Success: " ++ show x
resultMessage val =
  case val of
    Left err -> "Error: " ++ err
    Right x -> "Success: " ++ show x

-- divideMessage 10 2 -> "Result: 5"
-- divideMessage 7 2  -> "Result: 3"
-- divideMessage 10 0 -> "Error: Cannot divide by zero"
-- divideMessage 0 5  -> "Result: 0"

divideMessage :: Int -> Int -> String
divideMessage x y =
  case safeDivideEither x y of
    Left err -> "Error: " ++ err
    Right result -> "Result: " ++ show result

-- ageMessage 20   -> "Valid age: 20"
-- ageMessage 0    -> "Valid age: 0"
-- ageMessage (-5) -> "Invalid: Age cannot be negative"
-- ageMessage 150  -> "Invalid: Age is too high"

ageMessage :: Int -> String
ageMessage age =
  case validateAge age of
    Left err -> "Invalid: " ++ err
    Right x -> "Valid age: " ++ show x

doubleAge :: Int -> Either String Int
doubleAge age = Right (age * 2)

-- validateAndDouble 20   -> Right 40
-- validateAndDouble 50   -> Right 100
-- validateAndDouble (-5) -> Left "Age cannot be negative"
-- validateAndDouble 150  -> Left "Age is too high"

validateAndDouble :: Int -> Either String Int
validateAndDouble x =
  case validateAge x of
    Left err -> Left err
    Right x -> doubleAge x

validatePositive :: Int -> Either String Int
validatePositive x
  | x <= 0    = Left "Must be positive"
  | otherwise = Right x

validateEven :: Int -> Either String Int
validateEven x
  | odd x     = Left "Must be even"
  | otherwise = Right x

-- validateNumber 10   -> Right 10
-- validateNumber 4    -> Right 4
-- validateNumber 5    -> Left "Must be even"
-- validateNumber 0    -> Left "Must be positive"
-- validateNumber (-2) -> Left "Must be positive"

validateNumber :: Int -> Either String Int
validateNumber x =
  case validatePositive x of
    Left err -> Left err
    Right x ->
      case validateEven x of
        Left err -> Left err
        Right x -> Right x

main :: IO()
main = do
  print (safeLast ([] :: [Int]))
  print (safeLast [5])
  print (safeLast [1, 2, 3])
  print (safeLast ["A", "B", "C"])

  print (maybeNumber Nothing)
  print (maybeNumber (Just 5))
  print (maybeNumber (Just 20))
  print (maybeNumber (Just (-3)))

  print (fromMaybe 0 Nothing)
  print (fromMaybe 0 (Just 10))
  print (fromMaybe "Guest" Nothing)
  print (fromMaybe "Guest" (Just "Adrian"))
  print (fromMaybe False (Just True))

  print (doubleMaybe Nothing)
  print (doubleMaybe (Just 0))
  print (doubleMaybe (Just 5))
  print (doubleMaybe (Just (-3)))

  print (positiveOnly 5)
  print (positiveOnly 1)
  print (positiveOnly 0)
  print (positiveOnly (-3))

  print (safeDivide 10 2)
  print (safeDivide 20 4)
  print (safeDivide 7 2)
  print (safeDivide 10 0)
  print (safeDivide 0 5)

  print (addTenMaybe Nothing)
  print (addTenMaybe (Just 5))
  print (addTenMaybe (Just 0))
  print (addTenMaybe (Just (-3)))

  print (usernameLength Nothing)
  print (usernameLength (Just ""))
  print (usernameLength (Just "Adrian"))
  print (usernameLength (Just "Haskell"))

  print (safeDivideEither 10 2)
  print (safeDivideEither 7 2)
  print (safeDivideEither 10 0)
  print (safeDivideEither 0 5)

  print (validateAge (-5))
  print (validateAge 0)
  print (validateAge 20)
  print (validateAge 120)
  print (validateAge 121)

  print (resultMessage (Left "Invalid age"))
  print (resultMessage (Left "Not found"))
  print (resultMessage (Right 20))
  print (resultMessage (Right 100))

  print (divideMessage 10 2)
  print (divideMessage 7 2)
  print (divideMessage 10 0)
  print (divideMessage 0 5)

  print (ageMessage 20)
  print (ageMessage 0)
  print (ageMessage (-5))
  print (ageMessage 150)

  print (validateAndDouble 20)
  print (validateAndDouble 50)
  print (validateAndDouble (-5))
  print (validateAndDouble 150)

  print (validateNumber 10)
  print (validateNumber 4)
  print (validateNumber 5)
  print (validateNumber 0)
  print (validateNumber (-2))