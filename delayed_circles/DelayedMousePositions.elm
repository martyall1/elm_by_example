module DelayedMousePositions where

import Graphics.Element exposing (show)
import List exposing ((::), foldr, length, repeat, map)
import Mouse
import Signal exposing ((~), (<~), constant)
import Window
import Time exposing (delay)

combine : List (Signal a) -> Signal (List a)
combine = foldr (Signal.map2 (::)) (constant [])




delayedMousePositions : List Int -> Signal (List (Int, (Int,Int)))
delayedMousePositions  rs =
  let adjust (w,h) (x,y) = ((x-w)//2, h//2-y)
      n = length rs
      position = adjust <~ Window.dimensions ~ Mouse.position
      positions = repeat n position
      delayedPositions = List.map2
                         (\r pos ->
                           let delayedPosition = delay (toFloat r*100) pos
                           in (\pos -> (r,pos)) <~ delayedPosition)
                         rs
                         positions
  in
    combine delayedPositions


main = show <~ delayedMousePositions [0,10,25]

