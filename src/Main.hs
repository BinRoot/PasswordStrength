module Main where

import Data.Char
import Data.List

-- |The core IO part of the code
main = getLine >>= print.strong

-- |Reads in a string and determines whether
-- the password is strong enough
strong :: String -> Bool
strong x = length x > 14
    && any isLower x
    && any isUpper x
    && any isDigit x
