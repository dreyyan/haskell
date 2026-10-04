data Product = Product
  { productName :: String
  , price :: Int
  , inStock :: Bool
  }

-- productLabel (Product "Keyboard" 50 True)
-- -> "Keyboard"

-- productLabel (Product "Mouse" 25 False)
-- -> "Mouse"

-- productLabel (Product "Monitor" 200 True)
-- -> "Monitor"

productLabel :: Product -> String
productLabel = productName

-- isExpensive (Product "Keyboard" 50 True)   -> False
-- isExpensive (Product "Monitor" 200 True)   -> True
-- isExpensive (Product "Laptop" 1000 False)  -> True
-- isExpensive (Product "Mouse" 25 True)      -> False

isExpensive :: Product -> Bool
isExpensive product = price product > 100

-- canPurchase (Product "Keyboard" 50 True)   -> True
-- canPurchase (Product "Monitor" 200 False)  -> False
-- canPurchase (Product "Mouse" 25 True)      -> True
-- canPurchase (Product "Laptop" 1000 False)  -> False

canPurchase :: Product -> Bool
canPurchase product = inStock product

-- markOutOfStock (Product "Keyboard" 50 True)
-- -> Product "Keyboard" 50 False
--
-- markOutOfStock (Product "Mouse" 25 True)
-- -> Product "Mouse" 25 False
--
-- markOutOfStock (Product "Monitor" 200 False)
-- -> Product "Monitor" 200 False

markOutOfStock :: Product -> Product
markOutOfStock product = product { inStock = False }

-- applyDiscount (Product "Keyboard" 100 True)
-- -> Product "Keyboard" 90 True
--
-- applyDiscount (Product "Monitor" 200 True)
-- -> Product "Monitor" 180 True
--
-- applyDiscount (Product "Mouse" 50 False)
-- -> Product "Mouse" 45 False

applyDiscount :: Product -> Product
applyDiscount product = product { price = price product * 90 `div` 100 }

main :: IO ()
main = do
  print (productLabel (Product "Keyboard" 50 True))
  print (productLabel (Product "Mouse" 25 False))
  print (productLabel (Product "Monitor" 200 True))

  print (isExpensive (Product "Keyboard" 50 True))
  print (isExpensive (Product "Monitor" 200 True))
  print (isExpensive (Product "Laptop" 1000 False))
  print (isExpensive (Product "Mouse" 25 True))

  print (canPurchase (Product "Keyboard" 50 True))
  print (canPurchase (Product "Monitor" 200 False))
  print (canPurchase (Product "Mouse" 25 True))
  print (canPurchase (Product "Laptop" 1000 False))

  print (price (applyDiscount (Product "Keyboard" 100 True)))
  print (price (applyDiscount (Product "Monitor" 200 True)))
  print (price (applyDiscount (Product "Mouse" 50 False)))