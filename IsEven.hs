isEven :: Int -> Bool
isEven x = x `mod` 2 == 0

main :: IO()
main = print (isEven 5)
