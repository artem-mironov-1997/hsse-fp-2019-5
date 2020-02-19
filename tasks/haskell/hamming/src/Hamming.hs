module Hamming (distance) where

distance :: String -> String -> Maybe Int
-- checking if two lengths match
distance xs ys = if (length xs /= length ys)
                  then Nothing
                  -- zipWith returns True/False sequence of comparison  results (comparison of not-equality)
                  -- filter extracts only True values
                  -- the length of filter result is the number of mismatches
                  else Just (length (filter (\x -> x) (zipWith (/=) xs ys)))
