module CalculatorView where

import CalculatorModel exposing (..)
import Color exposing (rgb)
import Graphics.Collage exposing (LineCap(Padded), collage, defaultLine,
  filled, outlined, rect, toForm)
import Graphics.Element exposing (Element, centered, container, down, flow,
  leftAligned, layers, midRight, middle, right, spacer)
import Graphics.Input exposing (clickable)
import Signal exposing (Signal, mailbox, message)
import Text

makeButton : String -> ButtonType -> Element
makeButton label size =
  let xSize = buttonSize size
      buttonColor = rgb 199 235 234
  in
    collage xSize 60 [
               filled buttonColor <| rect (toFloat (xSize-8)) 52,
               outlined { defaultLine | width <- 2, cap <- Padded }
                   <| rect (toFloat (xSize-8)) 52,
               Text.fromString label |> Text.height 30 |> Text.bold |> centered |> toForm
              ]

makeButtonAndSignal : String -> ButtonType -> (Element, Signal String)
makeButtonAndSignal label btnSize =
  let button = makeButton label btnSize
      buttonMailbox = mailbox ""
      buttonMessage = message buttonMailbox.address label
      clickableButton = clickable buttonMessage button
  in
    (clickableButton, buttonMailbox.signal)
