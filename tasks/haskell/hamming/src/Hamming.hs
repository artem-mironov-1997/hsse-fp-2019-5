module Hamming (distance) where

distance :: String -> String -> Maybe Int
-- | filter - функция фильтрации
-- | id - вывод
-- | zipWith - упаковка агрументов по правилу
distance xs ys = length (filter id (zipWith (/=) xs ys))
