module Fibonacci where

import List exposing ((::), map2, reverse)

fibonacci : Int -> List Int
fibonacci n =
  let fibonnaci' n k1 k2 acc =
        if n <= 0
        then acc
        else fibonnaci' (n-1) k2 (k1+k2) (k2 :: acc)
  in
    fibonnaci' n 0 1 [] |> reverse

fibonacciWithIndices : Int -> List (Int,Int)
fibonacciWithIndices n = map2 (,) [0..n] (fibonacci n)
