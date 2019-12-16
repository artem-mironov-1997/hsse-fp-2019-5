module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys
  | length xs /= length ys = Nothing
  | otherwise = Just (length (filter id (zipWith (/=) xs ys)))
--  We zip two strings with not equals, get a list of boolean values,
--  with filter id we get list with only true values, so its length is hamming distance

