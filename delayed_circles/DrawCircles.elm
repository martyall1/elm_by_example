module DrawCircles where

import Array as A
import Color exposing (Color, blue, brown, green, orange, purple, red, yellow)
import Graphics.Collage exposing (Form, circle, collage, filled, move, text, group)
import Graphics.Element exposing (Element)
import Maybe
import List exposing (map, map2)
import Text exposing (Text, fromString, bold, height)
import Basics exposing (uncurry)


zip = map2 (,)

color : Int -> Color
color n =
  let colors =
        A.fromList [ green, red, blue, yellow, brown, purple, orange ]
      maybeColor = A.get (n % (A.length colors)) colors
  in
    Maybe.withDefault green maybeColor


circleForm : (Int, (Int, Int)) -> Form
circleForm (r, (x,y)) =
  circle (toFloat r*5)
      |> filled (color r)
      |> move (toFloat x, toFloat y)

circleWithText : (Int, (Int, Int)) ->  String -> Form
circleWithText (r,(x,y)) s = group [
                      circleForm (r,(x,y)),
                      fromString s
                      |> bold
                      |> height 40
                      |> text
                      |> move (toFloat x, toFloat y)
                      ]


circlesWithText : List (Int, (Int,Int)) -> List String -> List Form
circlesWithText cs ts =
  map (uncurry circleWithText) <| zip cs ts

drawCircles : List (Int, (Int,Int)) -> List String -> (Int,Int) -> Element
drawCircles d t (w,h) = collage w h <| circlesWithText d t

cs = [ (8, (-300,0)),(9, (-210,0)), (10, (-110,0)), (11, (0,0)),
       (12, (150, 0))]

ts = ["P", "U", "S", "Z", "I"]

--drawCircle : (Int, (Int,Int)) -> String -> (Int,Int) -> Element
--drawCircle c s (w,h) = collage w h <| [circleWithText c s]

main = drawCircles cs ts (900, 1000)
