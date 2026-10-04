square :: Int -> Int
square x = x * x

double :: Int -> Int
double x = x * 2

addThree :: Int -> Int
addThree x = x + 3

add :: Int -> Int -> Int
add x y = x + y

multiply :: Int -> Int -> Int
multiply x y = x * y

-- squareThenDouble 2    -> 8
-- squareThenDouble 3    -> 18
-- squareThenDouble 5    -> 50
-- squareThenDouble 0    -> 0
-- squareThenDouble (-2) -> 8

squareThenDouble :: Int -> Int
squareThenDouble = double . square

-- addThenDouble 1  -> 8
-- addThenDouble 2  -> 10
-- addThenDouble 5  -> 16
-- addThenDouble 0  -> 6
-- addThenDouble (-3) -> 0

addThenDouble :: Int -> Int
addThenDouble = double . addThree

-- addTen 0    -> 10
-- addTen 5    -> 15
-- addTen 10   -> 20
-- addTen (-3) -> 7

addTen :: Int -> Int
addTen = add 10

-- triple 0    -> 0
-- triple 1    -> 3
-- triple 5    -> 15
-- triple 10   -> 30
-- triple (-2) -> -6

triple :: Int -> Int
triple = multiply 3

sumThree :: Int -> Int -> Int -> Int
sumThree x y z = x + y + z

-- addTenAndTwenty 0    -> 30
-- addTenAndTwenty 5    -> 35
-- addTenAndTwenty 10   -> 40
-- addTenAndTwenty (-5) -> 25

addTenAndTwenty :: Int -> Int
addTenAndTwenty = sumThree 10 20

main :: IO()
main = do
  print (squareThenDouble 2)
  print (squareThenDouble 3)
  print (squareThenDouble 5)
  print (squareThenDouble 0)
  print (squareThenDouble (-2))

  print (addThenDouble 1)
  print (addThenDouble 2)
  print (addThenDouble 5)
  print (addThenDouble 0)
  print (addThenDouble (-3))

  print (addTen 0)
  print (addTen 5)
  print (addTen 10)
  print (addTen (-3))

  print (triple 0)
  print (triple 1)
  print (triple 5)
  print (triple 10)
  print (triple (-2))

  print (addTenAndTwenty 0)
  print (addTenAndTwenty 5)
  print (addTenAndTwenty 10)
  print (addTenAndTwenty (-5))