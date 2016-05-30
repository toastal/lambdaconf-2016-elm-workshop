module Components.Button exposing (view)

import Html
import Html.Attributes as Attr
import Html.Events as Events


view : msg -> List (Html.Attribute msg) -> String -> Html.Html msg
view msg attrs label =
    let
        attrs' =
            [ Attr.type' "button"
            , Attr.class "btn btn-primary"
            , Events.onClick msg
            ]
                ++ attrs
    in
        Html.button attrs' [ Html.text label ]
