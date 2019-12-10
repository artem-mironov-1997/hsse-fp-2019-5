
Module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys =
	if length xs /= lengthys then Nothing
	else Just (length (filter id (zipWith (/) xs ys)))

