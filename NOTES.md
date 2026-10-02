# Haskell Notes

## Basic Types

```haskell
Int      -- fixed-size integer
Integer  -- arbitrary-sized integer

Bool     -- True or False
Char     -- single character, e.g. 'A'
String   -- list of characters, e.g. "Hello"
```

### `Int` vs `Integer`

```haskell
Int      -- fixed-size integer
Integer  -- arbitrary-sized integer
```

---

## Operators

```haskell
-- not
not

-- not equal to
/=

-- integer division
`div`

-- fractional division
/

-- remainder
`mod`
```

JavaScript comparisons:

```text
Haskell    JavaScript
/=         !==
not        !
```

Examples:

```haskell
10 /= 5       -- True
not True      -- False
10 `div` 3    -- 3
10 / 3        -- fractional result
10 `mod` 3    -- 1
```

---

## Backticks

Backticks allow a **two-argument function** to be written in infix form.

```haskell
mod 4 2
```

can be written as:

```haskell
4 `mod` 2
```

General form:

```haskell
function x y

-- can become:

x `function` y
```

A one-argument function cannot be used this way:

```haskell
isValidAge 18    -- correct

18 `isValidAge`  -- wrong
```

---

## If Expressions

An `if` expression always needs an `else`.

```haskell
if age >= 18
  then "Adult"
  else "Minor"
```

Both branches must produce compatible types.

```haskell
if age >= 18
  then "Adult"   -- String
  else "Minor"   -- String
```

---

## Guards

Use **guards** when checking multiple conditions instead of deeply nested `if-else` expressions.

```haskell
ageGroup :: Int -> String
ageGroup age
  | age <= 12 = "Child"
  | age <= 17 = "Teenager"
  | otherwise = "Adult"
```

Guards are checked **top to bottom**.

`otherwise` is defined as `True`, so it acts like the final `else`.

---

## Pattern Matching

Use **pattern matching** when checking exact values or data structures.

Use **guards** when checking conditions.

Example:

```haskell
calculate :: Char -> Int -> Int -> Int
calculate '+' x y = x + y
calculate '-' x y = x - y
calculate '*' x y = x * y
calculate _ _ _ = 0
```

`_` is a **wildcard**:

```haskell
_
```

It means:

> A value exists here, but I don't care what it is.

---

# Tuples

A tuple can contain values of **different types**.

```haskell
person :: (String, Int)
person = ("Adrian", 20)
```

A function can also return a tuple:

```haskell
calculate :: Int -> Int -> (Int, Int, Int)
calculate x y = (x + y, x - y, x * y)
```

For pairs:

```haskell
fst ("Adrian", 20)  -- "Adrian"
snd ("Adrian", 20)  -- 20
```

- `fst` accesses the first element.
- `snd` accesses the second element.

Pattern matching is often more useful:

```haskell
getName :: (String, Int) -> String
getName (name, _) = name
```

### Parentheses vs Tuples

Parentheses alone do **not** create a tuple.

```haskell
(x)       -- grouping; just x
(x:xs)    -- grouping a list pattern

(x, y)    -- tuple
(x, y, z) -- tuple
```

A comma inside parentheses indicates a tuple.

---

# Lists

A list contains elements of the **same type**.

```haskell
numbers :: [Int]
numbers = [1, 2, 3]

names :: [String]
names = ["Adrian", "John", "Alice"]
```

An empty list is:

```haskell
[]
```

---

## Cons Operator `:`

Use `:` to add an element to the **front** of a list.

```haskell
1 : [2, 3, 4]

-- result:
[1, 2, 3, 4]
```

Lists are structurally built using `:`:

```haskell
[1, 2, 3]

-- equivalent to:

1 : 2 : 3 : []
```

---

## List Concatenation `++`

Use `++` to combine two lists.

```haskell
[1, 2] ++ [3, 4]

-- result:
[1, 2, 3, 4]
```

Difference:

```haskell
:   -- adds ONE element to the front
++  -- combines TWO lists
```

---

## Strings Are Lists

A `String` is a list of `Char`s:

```haskell
String = [Char] -- conceptually
```

For example:

```haskell
"Hello"

-- can be thought of as:

['H', 'e', 'l', 'l', 'o']
```

Therefore:

```haskell
'H' : "ello"

-- result:
"Hello"
```

---

## Common List Functions

```haskell
head [1, 2, 3]       -- 1
tail [1, 2, 3]       -- [2, 3]

last [1, 2, 3]       -- 3
init [1, 2, 3]       -- [1, 2]

length [1, 2, 3]     -- 3
sum [1, 2, 3]        -- 6
product [1, 2, 3]    -- 6

reverse [1, 2, 3]    -- [3, 2, 1]

take 2 [1, 2, 3]     -- [1, 2]
drop 2 [1, 2, 3]     -- [3]
```

Be careful:

```haskell
head []
tail []
```

cause runtime errors because an empty list has no first element or remainder.

---

# List Pattern Matching

Every list is structurally either:

```haskell
[]
```

or:

```haskell
x : xs
```

where:

```text
x  = first element
xs = remaining list
```

For example:

```haskell
[1, 2, 3]

-- can be viewed as:

1 : [2, 3]
```

So:

```haskell
first :: [Int] -> Int
first [] = 0
first (x:_) = x
```

`(x:_)` means:

```text
x : _
↑   ↑
│   └─ ignore the remaining list
└───── first element
```

---

## Important List Patterns

```haskell
[]        -- empty list

[x]       -- exactly one element
[_]       -- exactly one element; ignore its value

[x, y]    -- exactly two elements
[_, _]    -- exactly two elements; ignore their values

(x:xs)    -- non-empty list:
          -- x = first element
          -- xs = remaining list

(x:_)     -- non-empty list:
          -- x = first element
          -- ignore remainder

(_:xs)    -- non-empty list:
          -- ignore first element
          -- xs = remainder

(_:_)     -- any non-empty list

(_:y:_)   -- list with AT LEAST two elements:
          -- ignore first element
          -- y = second element
          -- ignore everything after it
```

### Example: checking whether a list is empty

```haskell
isEmpty :: [Int] -> Bool
isEmpty [] = True
isEmpty (_:_) = False
```

### Example: getting the second element

```haskell
second :: [Int] -> Int
second [] = 0
second [_] = 0
second (_:y:_) = y
```

Examples:

```haskell
second []          -- 0
second [5]         -- 0
second [5, 10]     -- 10
second [5, 10, 15] -- 10
```

---

## `[...]` vs `(:)`

This distinction is important:

```haskell
[_]       -- list containing EXACTLY one element

[_, _]    -- list containing EXACTLY two elements

(_:_)     -- list containing AT LEAST one element

(_:_:_)   -- list containing AT LEAST two elements
```

Do not confuse:

```haskell
[x:_]
```

with:

```haskell
(x:_)
```

They mean different things.

```haskell
(x:_)     -- matches a normal non-empty list
          -- e.g. [1, 2, 3]

[x:_]     -- nested-list pattern
          -- e.g. [[1, 2, 3]]
```

A useful rule:

```text
[...]   describes elements contained in a list

(:)     breaks a list into an element and the remaining list

(,)     creates/matches a tuple
```

For example:

```haskell
(_, _)    -- tuple with two values

[_, _]    -- list with exactly two elements

(_:_:_)   -- list with at least two elements
```