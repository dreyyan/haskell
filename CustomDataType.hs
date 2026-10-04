data Role = Admin | Member | Guest

-- canEdit Admin  -> True
-- canEdit Member -> True
-- canEdit Guest  -> False

canEdit :: Role -> Bool
canEdit Admin = True
canEdit Member = True
canEdit Guest = False

data Account
  = GuestAccount
  | UserAccount String

-- getUsername GuestAccount            -> "Guest"
-- getUsername (UserAccount "Adrian")  -> "Adrian"
-- getUsername (UserAccount "John")    -> "John"
-- getUsername (UserAccount "")        -> ""

getUsername :: Account -> String
getUsername GuestAccount = "Guest"
getUsername (UserAccount name) = name

data Payment
  = Cash
  | CreditCard String

-- paymentLabel Cash                        -> "Cash"
-- paymentLabel (CreditCard "Visa")         -> "Visa"
-- paymentLabel (CreditCard "Mastercard")   -> "Mastercard"
-- paymentLabel (CreditCard "Discover")     -> "Discover"

paymentLabel :: Payment -> String
paymentLabel Cash = "Cash"
paymentLabel (CreditCard company) = company

data LoginResult
  = LoginSuccess String
  | LoginFailed

-- loginMessage (LoginSuccess "Adrian") -> "Welcome, Adrian"
-- loginMessage (LoginSuccess "John")   -> "Welcome, John"
-- loginMessage (LoginSuccess "Alice")  -> "Welcome, Alice"
-- loginMessage LoginFailed             -> "Login failed"

loginMessage :: LoginResult -> String
loginMessage (LoginSuccess name) = "Welcome, " ++ name
loginMessage LoginFailed = "Login failed"

data Product
  = Product String Int

-- getPrice (Product "Keyboard" 50) -> 50
-- getPrice (Product "Mouse" 25)    -> 25
-- getPrice (Product "Monitor" 200) -> 200
-- getPrice (Product "Laptop" 1000) -> 1000

getPrice :: Product -> Int
getPrice (Product _ price) = price

data Book = Book String String Int

-- getTitle (Book "Dune" "Frank Herbert" 1965)       -> "Dune"
-- getTitle (Book "1984" "George Orwell" 1949)       -> "1984"
-- getTitle (Book "The Hobbit" "J.R.R. Tolkien" 1937) -> "The Hobbit"

getTitle :: Book -> String
getTitle (Book name _ _) = name

data Order
  = Pending String
  | Shipped String Int
  | Cancelled

-- orderMessage (Pending "Laptop")
-- -> "Pending: Laptop"

-- orderMessage (Shipped "Keyboard" 123)
-- -> "Shipped: Keyboard"

-- orderMessage (Shipped "Mouse" 456)
-- -> "Shipped: Mouse"

-- orderMessage Cancelled
-- -> "Order cancelled"

orderMessage :: Order -> String
orderMessage (Pending product) = "Pending: " ++ product
orderMessage (Shipped product _) = "Shipped: " ++ product
orderMessage Cancelled = "Order cancelled"

main :: IO ()
main = do
  print (canEdit Admin)
  print (canEdit Member)
  print (canEdit Guest)

  print (getUsername GuestAccount)
  print (getUsername (UserAccount "Adrian"))
  print (getUsername (UserAccount "John"))
  print (getUsername (UserAccount ""))

  print (paymentLabel Cash)
  print (paymentLabel (CreditCard "Visa"))
  print (paymentLabel (CreditCard "Mastercard"))
  print (paymentLabel (CreditCard "Discover"))

  print (loginMessage (LoginSuccess "Adrian"))
  print (loginMessage (LoginSuccess "John"))
  print (loginMessage (LoginSuccess "Alice"))
  print (loginMessage LoginFailed)

  print (getPrice (Product "Keyboard" 50))
  print (getPrice (Product "Mouse" 25))
  print (getPrice (Product "Monitor" 200))
  print (getPrice (Product "Laptop" 1000))

  print (getTitle (Book "Dune" "Frank Herbert" 1965))
  print (getTitle (Book "1984" "George Orwell" 1949))
  print (getTitle (Book "The Hobbit" "J.R.R. Tolkien" 1937))

  print (orderMessage (Pending "Laptop"))
  print (orderMessage (Shipped "Keyboard" 123))
  print (orderMessage (Shipped "Mouse" 456))
  print (orderMessage Cancelled)