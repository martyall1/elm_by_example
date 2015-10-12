module HelloWorld4 where

import Markdown
import Graphics.Element exposing (..)

main : Element
main = Markdown.toElement """

# Hello World

This is the output of the *HelloWorld4.elm* program.


---
"""



