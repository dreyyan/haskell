-- pair 5 10          -> (5, 10)
-- pair "Adrian" 20   -> ("Adrian", 20)
-- pair True "Hello"  -> (True, "Hello")
-- pair 'A' False     -> ('A', False)

pair :: a -> b -> (a, b)
pair a b = (a, b)

-- sameTypePair 5 10        -> (5, 10)
-- sameTypePair "A" "B"     -> ("A", "B")
-- sameTypePair True False   -> (True, False)

sameTypePair :: a -> a -> (a, a)
sameTypePair x y = (x, y)

-- getLast [1]             -> 1
-- getLast [1, 2, 3]       -> 3
-- getLast ["A", "B", "C"] -> "C"
-- getLast [True, False]    -> False

getLast :: [a] -> a
getLast [x] = x
getLast (_:xs) = getLast xs

main :: IO()
main = do
  print (pair 5 10)
  print (pair "Adrian" 20)
  print (pair True "Hello")
  print (pair 'A' False)

  print (sameTypePair 5 10)
  print (sameTypePair "A" "B")
  print (sameTypePair True False)

  print (getLast [1])
  print (getLast [1, 2, 3])
  print (getLast ["A", "B", "C"])
  print (getLast [True, False])