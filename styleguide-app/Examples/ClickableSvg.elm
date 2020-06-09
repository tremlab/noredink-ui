module Examples.ClickableSvg exposing (Msg, State, example)

{-|

@docs Msg, State, example

-}

import Category exposing (Category(..))
import Color exposing (Color)
import Css
import Example exposing (Example)
import Examples.IconExamples as IconExamples
import Html.Styled as Html
import Html.Styled.Attributes as Attributes
import Html.Styled.Events as Events
import Nri.Ui.ClickableSvg.V1 as ClickableSvg
import Nri.Ui.Colors.Extra exposing (fromCssColor, toCssColor)
import Nri.Ui.Colors.V1 as Colors
import Nri.Ui.Heading.V2 as Heading
import Nri.Ui.Select.V7 as Select
import Nri.Ui.Svg.V1 as Svg
import Nri.Ui.UiIcon.V1 as UiIcon


{-| -}
example : Example State Msg
example =
    { name = "Nri.Ui.ClickableSvg.V1"
    , categories = [ Buttons, Icons ]
    , state = init
    , update = update
    , subscriptions = \_ -> Sub.none
    , view =
        \state ->
            [ viewExample "ClickableSvg.button \"Back\" UiIcon.arrowLeft [ ClickableSvg.onClick OnClickMsg ]" <|
                ClickableSvg.button "Back"
                    UiIcon.arrowLeft
                    [ ClickableSvg.onClick (ShowItWorked "You clicked the back button!") ]
            , viewExample "ClickableSvg.link \"Back\" UiIcon.arrowLeft [ ClickableSvg.linkSpa \"some_link\" ]" <|
                ClickableSvg.link "Back" UiIcon.arrowLeft [ ClickableSvg.linkSpa "some_link" ]
            , viewExample "ClickableSvg.button \"Disabled\" UiIcon.arrowLeft [ ClickableSvg.disabled True ]" <|
                ClickableSvg.button "Disabled" UiIcon.arrowLeft [ ClickableSvg.disabled True ]
            , viewExample "ClickableSvg.link \"Disabled\" UiIcon.arrowLeft [ ClickableSvg.disabled True ]" <|
                ClickableSvg.link "Disabled" UiIcon.arrowLeft [ ClickableSvg.disabled True ]
            , viewExample
                """
    ClickableSvg.button "Go to tutorial"
        UiIcon.footsteps
        [ ClickableSvg.width (Css.px 80)
        , ClickableSvg.height (Css.px 80)
        , ClickableSvg.onClick (ShowItWorked "You clicked the tutorials button!")
        , ClickableSvg.custom [ Attributes.id "clickable-svg-customized-example-id" ]
        , ClickableSvg.css [ Css.border3 (Css.px 3) Css.dashed Colors.purple ]
        ]
                """
              <|
                ClickableSvg.button "Go to tutorial"
                    UiIcon.footsteps
                    [ ClickableSvg.width (Css.px 80)
                    , ClickableSvg.height (Css.px 80)
                    , ClickableSvg.onClick (ShowItWorked "You clicked the tutorials button!")
                    , ClickableSvg.custom [ Attributes.id "clickable-svg-customized-example-id" ]
                    , ClickableSvg.css [ Css.border3 (Css.px 3) Css.dashed Colors.purple ]
                    ]
            ]
    }


viewExample : String -> Html.Html msg -> Html.Html msg
viewExample code html =
    Html.div [ Attributes.css [ Css.displayFlex, Css.alignItems Css.center ] ]
        [ html
        , viewCode code
        ]


viewCode : String -> Html.Html msg
viewCode renderStrategy =
    Html.code
        [ Attributes.css
            [ Css.width (Css.px 400)
            , Css.marginRight (Css.px 20)
            ]
        ]
        [ Html.pre [] [ Html.text renderStrategy ] ]


{-| -}
type alias State =
    {}


{-| -}
init : State
init =
    {}


{-| -}
type Msg
    = ShowItWorked String


{-| -}
update : Msg -> State -> ( State, Cmd Msg )
update msg state =
    case msg of
        ShowItWorked message ->
            let
                _ =
                    Debug.log "ClickableSvg" message
            in
            ( state, Cmd.none )
