module DelayedCircles where

import DelayedMousePositions exposing (delayedMousePositions)
import DrawCircles exposing (drawCircles, ts, cs, zip)
import Signal exposing ((~), (<~), map, constant)
import Window
import List exposing (reverse)


main =
  drawCircles
  <~ delayedMousePositions [5,8,13,21,24]
  ~ constant ts
  ~ Window.dimensions
