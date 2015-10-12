module TimeSignal where

import Time exposing (delay, every, fps, fpsWhen, second, since, timestamp)

import Graphics.Element exposing (down, flow, leftAligned, Element)
import List exposing (map)
import Mouse
import Signal exposing ((~), (<~))
import Text exposing (fromString)


--showsignals : a -> b -> c -> d -> e -> f -> Element
showsignals a b c d e f =
  flow down <|
       map (fromString >> leftAligned) [
              "every (5*second): " ++ toString a,
              "every (2*second) Mouse.clicks: " ++ toString b,
              "timestamp Mouse.isDown: " ++ toString c,
              "delay second Mouse.position: " ++ toString d,
              "fps 200: " ++ toString e,
              "fpsWhen 200 Mouse.isDown: " ++ toString f
             ]

--main : Signal Element 
main = showsignals
       <~ every (5*second)
       ~ since (2*second) Mouse.clicks
       ~ timestamp Mouse.isDown
       ~ delay second Mouse.position
       ~ fps 200
       ~ fpsWhen 200 Mouse.isDown


