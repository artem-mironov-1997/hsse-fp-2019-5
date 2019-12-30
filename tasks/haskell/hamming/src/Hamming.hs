module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys
	if null xs || null ys then Just 0
	else if length xs /= length ys then Nothing
	else otherwise = Just (length (filter id (zipWith (/=) xs ys)))
