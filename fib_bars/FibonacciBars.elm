module FibonacciBars where

import Color exposing (blue, brown, green, orange, purple, red, yellow)
import Fibonacci exposing (fibonacci, fibonacciWithIndices)
import Graphics.Collage exposing (collage, filled, rect)
import Graphics.Element exposing (down, flow, right, show)
import List exposing (head, drop, length, map)
import Maybe exposing (withDefault)


color n =
  let colors = [red, orange, green, blue, purple, brown]
  in
    drop ( n % (length colors)) colors |> head |> withDefault red



bar (index, n) =
  flow right [
    collage (n*5) 5 [filled (color index) (rect (toFloat n*5) 5) ],
    show n
         ]

main = flow down <| map bar (fibonacciWithIndices 10)
