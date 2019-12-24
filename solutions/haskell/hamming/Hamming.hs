module HammingCode (distance) where

distance :: String->String->Int
distance xs ys = length (filter id (zipWith (/=) xs ys))

main = do 
  print(distance "RARDDTADTAADRRRAT" "DATDRTAATRADRRDDT")