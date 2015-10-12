module CirclesView where

import CirclesModel exposing (Circle, CircleSpec, Position)
import Color exposing (black, red, green)
import Graphics.Collage exposing (circle, collage, filled,
    move, outlined, rect, solid, Form)
import Graphics.Element exposing (layers, Element)
import List exposing (map)

boundingBox : Int -> Int -> Element
boundingBox w h =
  collage w h [
                outlined (solid black) <| rect (toFloat w) (toFloat h),
                outlined (solid red) <| rect (toFloat (w-2)) (toFloat (h - 2))
            ]

drawCircle : Int -> Int -> Circle -> Form
drawCircle w h c =
  let { position , circleSpec } = c
  in filled circleSpec.col (circle (toFloat circleSpec.radius))
                 |> move (toFloat position.x - (toFloat w)/2,
                          (toFloat h)/2 - toFloat position.y)

drawCircles : Int -> Int -> List Circle -> Element
drawCircles w h circs = collage w h <| map (drawCircle w h) circs

view : Int -> Int -> List Circle -> Element
view w h circs = layers [ boundingBox w h, drawCircles w h circs ]
