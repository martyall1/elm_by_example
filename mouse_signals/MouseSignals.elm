module MouseSignals where

-- import Mouse
-- import Signal exposing (map2, (~), (<~))
-- import Graphics.Element exposing (Element, show)
-- -- map : (a -> b) -> Signal a -> Signal b
-- -- map2 : (a -> b -> c) -> Signal a -> Signal b -> Signal c

-- combine : a -> b -> Element
-- combine a b = show (a,b)

-- -- (<~) == map
-- -- (~) : Signal (a -> b) -> Signal a -> Signal b

-- --main = map2 combine  Mouse.x Mouse.y
-- -- combine <~ Mouse.x == map combine Mouse.x
-- -- map combine : map  (a -> (b -> Element)) : Signal a -> Signal (b -> Element)
-- -- map combine Mouse.x : Signal (b -> Element)
-- -- map combine Mouse.x Mouse.y : Signal Element

-- main = combine <~ Mouse.x ~ Mouse.y

import Graphics.Element exposing (down, flow, leftAligned)
import List exposing (map)
import Mouse
import Signal exposing ((~), (<~), sampleOn)
import Text exposing (fromString)

showSignals a b c d e f g =
  flow down <|
       map (fromString >> leftAligned) [
              "Mouse.position: " ++ toString a,
              "Mouse.x: " ++ toString b,
              "Mouse.y: " ++ toString c,
              "Mouse.clicks: " ++ toString d,
              "Mouse.isDown: " ++ toString e,
              "sampleOn Mouse.clicks Mouse.position: " ++ toString f,
              "sampleOn Mouse.isDown Mouse.position: " ++ toString g
             ]

main =
  showSignals
    <~ Mouse.position
     ~ Mouse.x
     ~ Mouse.y
     ~ Mouse.clicks
     ~ Mouse.isDown
     ~ sampleOn Mouse.clicks Mouse.position
     ~ sampleOn Mouse.isDown Mouse.position
