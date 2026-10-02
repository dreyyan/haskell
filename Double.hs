double :: Int -> Int
double x = x * 2

square :: Int -> Int
square x = x * x

main :: IO ()
-- main = print (double 5)
main = print (square 5)