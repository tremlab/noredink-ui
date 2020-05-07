module Examples.Menu exposing (Msg, State, example)

{-|

@docs Msg, State, example

-}

import Accessibility.Styled as Html exposing (..)
import Category exposing (Category(..))
import Css
import Debug.Control as Control exposing (Control)
import Example exposing (Example)
import Html.Styled.Attributes exposing (css)
import Nri.Ui.Checkbox.V5 as Checkbox
import Nri.Ui.ClickableText.V3 as ClickableText
import Nri.Ui.Heading.V2 as Heading
import Nri.Ui.Menu.V1 as Menu
import Nri.Ui.Svg.V1 as Svg exposing (Svg)
import Nri.Ui.UiIcon.V1 as UiIcon
import Set exposing (Set)


{-| -}
example : Example State Msg
example =
    { name = "Nri.Ui.Menu.V1"
    , state = init
    , update = update
    , subscriptions = \_ -> Sub.none
    , categories = [ Widgets ]
    , view = view
    }


view : State -> List (Html Msg)
view state =
    let
        viewConfiguration =
            Control.currentValue state.viewConfiguration

        iconButtonWithMenuConfiguration =
            Control.currentValue state.iconButtonWithMenuConfiguration

        isOpen name =
            case state.openMenu of
                Just open ->
                    open == name

                Nothing ->
                    False
    in
    [ div [ css [ Css.displayFlex, Css.flexWrap Css.wrap ] ]
        [ Html.h3 [ css [ Css.width (Css.pct 100) ] ] [ Html.text "Nri.Menu.view" ]
        , viewControl SetViewConfiguration state.viewConfiguration
        , Menu.view
            { isOpen = isOpen "1stPeriodEnglish"
            , onToggle = menuToggler "1stPeriodEnglish"
            , id = "1stPeriodEnglish"
            , title = "1st Period English with Mx. Trainer"
            , icon = viewConfiguration.icon
            , hasBorder = viewConfiguration.hasBorder
            , alignment = viewConfiguration.alignment
            , wrapping = viewConfiguration.wrapping
            , isDisabled = viewConfiguration.isDisabled
            , buttonWidth = viewConfiguration.buttonWidth
            , menuWidth = viewConfiguration.menuWidth
            , entries = [ viewButtonGroup, viewCheckboxGroup state ]
            }
        ]
    , div
        [ css [ Css.displayFlex, Css.flexWrap Css.wrap ] ]
        [ Html.h3 [ css [ Css.width (Css.pct 100) ] ] [ Html.text "Nri.Menu.iconButtonWithMenu" ]
        , viewControl SetIconButtonWithMenuConfiguration state.iconButtonWithMenuConfiguration
        , Menu.iconButtonWithMenu
            { isTooltipOpen = Set.member "iconButtonWithMenu" state.openTooltips
            , onShowTooltip = ShowTooltip "iconButtonWithMenu"
            , id = "icon-button-with-menu"
            , label = "Menu.iconButtonWithMenu: Click me!"
            , isOpen = isOpen "icon-button-with-menu"
            , onToggle = menuToggler "icon-button-with-menu"
            , icon = iconButtonWithMenuConfiguration.icon
            , alignment = iconButtonWithMenuConfiguration.alignment
            , isDisabled = iconButtonWithMenuConfiguration.isDisabled
            , menuWidth = iconButtonWithMenuConfiguration.menuWidth
            , entries = [ viewButtonGroup, viewCheckboxGroup state ]
            }
        ]
    , Html.h3 [] [ Html.text "Row with buttons and menus" ]
    , Html.div []
        [ Menu.iconButton
            { icon = UiIcon.performance
            , label = "Menu.iconButton: I'm a button!"
            , isTooltipOpen = Set.member "Performance" state.openTooltips
            , onShowTooltip = ShowTooltip "Performance"
            , onClick = ConsoleLog "Clicked the Performance button!"
            , isDisabled = False
            , id = "performance"
            }
        , Menu.iconLink
            { icon = UiIcon.document
            , label = "Menu.iconLink: I link elsewhere!"
            , isTooltipOpen = Set.member "Document" state.openTooltips
            , onShowTooltip = ShowTooltip "Document"
            , linkUrl = "https://www.noredink.com/"
            , isDisabled = False
            }
        ]
    ]


viewControl : (Control a -> Msg) -> Control a -> Html Msg
viewControl setControl control =
    code
        [ css [ Css.minWidth (Css.px 300), Css.marginRight (Css.px 20) ] ]
        [ Control.view setControl control
            |> fromUnstyled
        ]


{-| -}
init : State
init =
    { openMenu = Nothing
    , checkboxChecked = False
    , openTooltips = Set.empty
    , viewConfiguration = initViewConfiguration
    , iconButtonWithMenuConfiguration = initIconButtonWithMenuConfiguration
    }


{-| -}
type alias State =
    { openMenu : Maybe Id
    , checkboxChecked : Bool
    , openTooltips : Set String
    , viewConfiguration : Control ViewConfiguration
    , iconButtonWithMenuConfiguration : Control IconButtonWithMenuConfiguration
    }


type alias ViewConfiguration =
    { isDisabled : Bool
    , hasBorder : Bool
    , alignment : Menu.Alignment
    , wrapping : Menu.TitleWrapping
    , buttonWidth : Maybe Int
    , menuWidth : Maybe Int
    , icon : Maybe Svg
    }


initViewConfiguration : Control ViewConfiguration
initViewConfiguration =
    Control.record ViewConfiguration
        |> Control.field "isDisabled" (Control.bool False)
        |> Control.field "hasBorder" (Control.bool True)
        |> Control.field "alignment"
            (Control.choice
                [ ( "Right", Control.value Menu.Right )
                , ( "Left", Control.value Menu.Left )
                ]
            )
        |> Control.field "wrapping"
            (Control.choice
                [ ( "WrapAndExpandTitle", Control.value Menu.WrapAndExpandTitle )
                , ( "TruncateTitle", Control.value Menu.TruncateTitle )
                ]
            )
        |> Control.field "buttonWidth"
            (Control.maybe False (Control.choice [ ( "220", Control.value 220 ) ]))
        |> Control.field "menuWidth"
            (Control.maybe False (Control.choice [ ( "180", Control.value 220 ) ]))
        |> Control.field "icon"
            (Control.maybe False
                (Control.choice
                    [ ( "gift", Control.value UiIcon.gift )
                    , ( "hat", Control.value UiIcon.hat )
                    , ( "star", Control.value UiIcon.star )
                    ]
                )
            )


type alias IconButtonWithMenuConfiguration =
    { isDisabled : Bool
    , alignment : Menu.Alignment
    , menuWidth : Maybe Int
    , icon : Svg
    }


initIconButtonWithMenuConfiguration : Control IconButtonWithMenuConfiguration
initIconButtonWithMenuConfiguration =
    Control.record IconButtonWithMenuConfiguration
        |> Control.field "isDisabled" (Control.bool False)
        |> Control.field "alignment"
            (Control.choice
                [ ( "Left", Control.value Menu.Left )
                , ( "Right", Control.value Menu.Right )
                ]
            )
        |> Control.field "menuWidth"
            (Control.maybe False (Control.choice [ ( "180", Control.value 220 ) ]))
        |> Control.field "icon"
            (Control.choice
                [ ( "edit", Control.value UiIcon.edit )
                , ( "share", Control.value UiIcon.share )
                , ( "gear", Control.value UiIcon.gear )
                ]
            )


{-| -}
type Msg
    = SetMenu (Maybe Id)
    | SetCheckbox Bool
    | ShowTooltip String Bool
    | ConsoleLog String
    | SetViewConfiguration (Control ViewConfiguration)
    | SetIconButtonWithMenuConfiguration (Control IconButtonWithMenuConfiguration)
    | NoOp


{-| -}
update : Msg -> State -> ( State, Cmd Msg )
update msg state =
    case msg of
        SetMenu maybeId ->
            ( { state | openMenu = maybeId }, Cmd.none )

        SetCheckbox bool ->
            ( { state | checkboxChecked = bool }, Cmd.none )

        ShowTooltip key isOpen ->
            ( { state
                | openTooltips =
                    if isOpen then
                        Set.insert key state.openTooltips

                    else
                        Set.remove key state.openTooltips
              }
            , Cmd.none
            )

        ConsoleLog message ->
            let
                _ =
                    Debug.log "Menu Example" message
            in
            ( state, Cmd.none )

        NoOp ->
            ( state, Cmd.none )

        SetViewConfiguration configuration ->
            ( { state | viewConfiguration = configuration }, Cmd.none )

        SetIconButtonWithMenuConfiguration configuration ->
            ( { state | iconButtonWithMenuConfiguration = configuration }, Cmd.none )



-- INTERNAL


type alias Id =
    String


type alias Value =
    String


viewButtonGroup : Menu.Entry Msg
viewButtonGroup =
    Menu.group "Buttons"
        [ Menu.entry <|
            ClickableText.button "Hello"
                [ ClickableText.onClick (ConsoleLog "Hello")
                , ClickableText.small
                ]
        , Menu.entry <|
            ClickableText.button "Performance"
                [ ClickableText.onClick (ConsoleLog "Hello")
                , ClickableText.small
                ]
        ]


viewCheckboxGroup : State -> Menu.Entry Msg
viewCheckboxGroup state =
    Menu.group "Checkboxes"
        [ Menu.entry <|
            Checkbox.viewWithLabel
                { identifier = "styleguide-menu-interactable-checkbox"
                , label = "This is an interactable checkbox!"
                , setterMsg = SetCheckbox
                , selected = Checkbox.selectedFromBool state.checkboxChecked
                , disabled = False
                , theme = Checkbox.Square
                }
        ]


menuToggler : Id -> Bool -> Msg
menuToggler id desiresToBeOpen =
    if desiresToBeOpen then
        SetMenu (Just id)

    else
        SetMenu Nothing
