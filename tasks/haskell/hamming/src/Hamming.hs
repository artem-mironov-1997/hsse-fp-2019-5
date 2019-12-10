module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys =
  if length xs /= length ys then Nothing
<<<<<<< HEAD
  else Just (length (filter id (zipWith (/=) xs ys)))
=======
  else Just (length (filter id (zipWith (/=) xs ys)))
>>>>>>> e5ff0c0b2c003f395e15ec81f1d13f2f9105c6f0
