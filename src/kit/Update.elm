module Update exposing (update)

import Model exposing (Model, LineItem, Pet)
import Msg exposing (Msg(..))
import Components.Dropdown as Dropdown


{-
   Helper to update a `LineItem` when it contains
   a given `Pet`.
-}


mapWhen : (Int -> Int) -> Pet -> LineItem -> LineItem
mapWhen f pet ( pet', volume ) =
    if pet' == pet then
        ( pet', clamp 1 25 (f volume) )
    else
        ( pet', volume )



{-
   This is the main update function for our application.
   You can think of it like the transform in a fold.
   We take in new messages in our system, and transform
   the model accordingly.

   Our model is a record (which is kinda like an object)
   here is the syntax for records in Elm http://elm-lang.org/docs/records
-}


update : Msg -> Model -> Model
update msg model =
    case msg of
        Add pet ->
            if List.member pet (List.map fst model.cart) then
                model
            else
                { model | cart = model.cart ++ [ ( pet, 1 ) ] }

        Inc pet ->
            { model | cart = List.map (mapWhen ((+) 1) pet) model.cart }

        Dec pet ->
            { model | cart = List.map (mapWhen ((+) -1) pet) model.cart }

        Del pet ->
            { model | cart = List.filter (\( p, q ) -> p /= pet) model.cart }

        Dropdown msg ->
            { model | dropdown = Dropdown.update msg model.dropdown }

        NoOp ->
            model
