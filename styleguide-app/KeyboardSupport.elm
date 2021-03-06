module KeyboardSupport exposing
    ( view
    , KeyboardSupport
    , Key(..), Direction(..)
    )

{-|

@docs view
@docs KeyboardSupport
@docs Key, Direction

-}

import Css exposing (..)
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes exposing (css)


{-| -}
type alias KeyboardSupport =
    { keys : List Key
    , result : String
    }


{-| -}
view : List KeyboardSupport -> Html msg
view keyboardSupport =
    case keyboardSupport of
        [] ->
            text ""

        _ ->
            details []
                [ summary [] [ text "Keyboard Support" ]
                , ul
                    [ css [ listStyle none, margin2 (px 10) zero, padding zero ]
                    ]
                    (List.map viewKeyboardActions keyboardSupport)
                ]


viewKeyboardActions : KeyboardSupport -> Html msg
viewKeyboardActions { keys, result } =
    li []
        [ strong [] [ text (String.join "+" (List.map keyToString keys) ++ ": ") ]
        , text result
        ]


{-| -}
type Key
    = Shift
    | Enter
    | Arrow Direction
    | Tab


keyToString : Key -> String
keyToString key =
    case key of
        Shift ->
            "Shift"

        Enter ->
            "Enter"

        Arrow direction ->
            directionToString direction ++ " arrow"

        Tab ->
            "Tab"


{-| -}
type Direction
    = Up
    | Right
    | Down
    | Left


directionToString : Direction -> String
directionToString direction =
    case direction of
        Up ->
            "Up"

        Right ->
            "Right"

        Down ->
            "Down"

        Left ->
            "Left"
