module Msg exposing (Msg(..))

import Model exposing (Pet)
import Components.Dropdown as Dropdown


{-

   `Msg` is a union type representing ALL messages
   that flow through our application. All discrete events
   in Elm are reffered to as messages. Child components
   will need a space on here, so that we can route messages.

   Union types are types that may have more than one constructor.

   type MyType = MyValue Int | MyOtherValue
                             ^ this is a type level OR

   So that when a function takes `MyType`, it may
   recieve a value of either `MyValue Int` or `MyOtherValue`
   Learn more about union types here
     http://guide.elm-lang.org/types/union_types.html

-}


type Msg
    = Add Pet
    | Inc Pet
    | Dec Pet
    | Del Pet
    | Dropdown (Dropdown.Msg Pet)
    | NoOp



-- TODO: Add the rest of the user actions
