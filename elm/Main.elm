module Main where

import Html exposing (div, text, Html)
import StartApp.Simple as StartApp
import Signal exposing (Address)

main = StartApp.start {model = 0, update = update, view = view}

type alias Model = Int

type Action = NoOp

update : Action -> Model -> Model
update action model =
  model

view : Address Action -> Model -> Html
view address model =
  div [] [text "Welcome to Glowd"]
            
