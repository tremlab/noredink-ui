module Nri.Ui.TextArea.V1
    exposing
        ( Model
        , generateId
        , view
        , writing
        )

{-|


## The Nri styleguide-specified textarea with overlapping label

@docs view, writing, Model, generateId

-}

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Nri.Ui.InputStyles exposing (CssClasses(..), styles)
import Nri.Ui.Util exposing (dashify, removePunctuation)


{-| -}
type alias Model msg =
    { value : String
    , autofocus : Bool
    , onInput : String -> msg
    , isInError : Bool
    , autoResize : Bool
    , placeholder : String
    , label : String
    , showLabel : Bool
    }


{-| -}
view : Model msg -> Html msg
view model =
    view_ DefaultStyle model


{-| Used for Writing Cycles
-}
writing : Model msg -> Html msg
writing model =
    view_ WritingStyle model


type TextAreaStyle
    = DefaultStyle
    | WritingStyle


{-| -}
view_ : TextAreaStyle -> Model msg -> Html msg
view_ textAreaStyle model =
    let
        showWritingClass =
            textAreaStyle == WritingStyle

        sharedAttributes =
            [ onInput model.onInput
            , Html.Attributes.id (generateId model.label)
            , styles.class [ Input ]
            , autofocus model.autofocus
            , placeholder model.placeholder
            , attribute "data-gramm" "false" -- disables grammarly to prevent https://github.com/NoRedInk/NoRedInk/issues/14859
            ]
    in
    div
        [ styles.classList
            [ ( Container, True )
            , ( IsInError, model.isInError )
            , ( Writing, showWritingClass )
            ]
        ]
        [ if model.autoResize then
            {- NOTES:
               The autoresize-textarea element is implemented to pass information applied to itself to an internal
               textarea element that it inserts into the DOM automatically. Maintaing this behavior may require some
               changes on your part, as listed below.

               - When adding an Html.Attribute that is a _property_, you must edit Nri/TextArea.js to ensure that a getter and setter
                 are set up to properly reflect the property to the actual textarea element that autoresize-textarea creates
               - When adding a new listener from Html.Events, you must edit Nri/TextArea.js to ensure that a listener is set up on
                 the textarea that will trigger this event on the autoresize-textarea element itself. See AutoresizeTextArea.prototype._onInput
                 and AutoresizeTextArea.prototype.connectedCallback for an example pertaining to the `input` event
               - When adding a new Html.Attribute that is an _attribute_, you don't have to do anything. All attributes are
                 automatically reflected onto the textarea element via AutoresizeTextArea.prototype.attributeChangedCallback
            -}
            Html.node "autoresize-textarea"
                (sharedAttributes
                    ++ [ -- setting the default value via a text node doesn't play well with the custom element,
                         -- but we'll be able to switch to the regular value property in 0.19 anyway
                         defaultValue model.value
                       ]
                )
                []
          else
            Html.textarea sharedAttributes
                [ Html.text model.value ]
        , Html.label
            [ for (generateId model.label)
            , styles.classList
                [ ( InvisibleLabel, not model.showLabel )
                , ( Label, True )
                ]
            ]
            [ Html.text model.label ]
        ]


{-| -}
generateId : String -> String
generateId labelText =
    "nri-text-area-" ++ (dashify <| removePunctuation labelText)
