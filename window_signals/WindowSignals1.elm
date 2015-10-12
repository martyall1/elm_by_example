module WindowSignals1 where

import Graphics.Element exposing (Element, down, flow, leftAligned)
import List exposing (map)
import Signal exposing ((~), (<~))
import Text exposing (fromString)
import Window


showsignals : a -> b -> c -> Element
showsignals a b c =
  flow down <|
       map (fromString >> leftAligned) [
              "Window.dimensions : " ++ toString a,
              "Window.width: " ++ toString b,
              "Window.height: " ++ toString c
             ]


main =
  showsignals
    <~ Window.dimensions
     ~ Window.width
     ~ Window.height

-- (<~) == map : (a -> b) -> Signal a -> Signal b
-- showSignals <~ Window.Dimensions :
-- map showSignals : Signal a -> Signal ( b -> c -> Element)
-- showsignals <~ Window.dimensions : Signal (b -> c -> Element)
-- showsignals <~ Window.dimensions ~ Window.width : Signal (c -> Element)
-- whole thing : Signal Element

-- showsignalss Window.dimensions 
