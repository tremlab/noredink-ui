module Nri.Tabs
    exposing
        ( Alignment(..)
        , Config
        , LinkConfig
        , Tab
        , TabLink
        , links
        , styles
        , view
        , viewCustom
        , viewTabDefault
        )

{-|

@docs Alignment
@docs Config
@docs LinkConfig
@docs Tab
@docs TabLink
@docs links
@docs styles
@docs view
@docs viewCustom


## Defaults

@docs viewTabDefault

-}

import Accessibility.Aria
import Accessibility.Key
import Accessibility.Role
import Accessibility.Widget
import Css exposing (Style)
import Html exposing (Attribute, Html)
import Html.Attributes
import Html.Events
import Json.Decode
import List.Zipper exposing (Zipper(..))
import Nri.Colors
import Nri.Colors.Extra
import Nri.Fonts
import Nri.Styles
import View.Extra


{-| This is a better choice for a no-op than "#" because "#" changes your
location bar. See <http://stackoverflow.com/a/20676911> for more details.
-}
noOpHref : Attribute a
noOpHref =
    Html.Attributes.href "javascript:void(0)"


{-| -}
type alias Config id msg =
    { title : Maybe String
    , onSelect : id -> msg
    , tabs : Zipper (Tab id)
    , content : id -> Html msg
    , alignment : Alignment
    }


{-| Determines whether tabs are centered or floating to the left or right.
-}
type Alignment
    = Left
    | Center
    | Right


{-| -}
type alias Tab id =
    { label : String
    , id : id
    }


{-| -}
view : Config id msg -> Html msg
view config =
    viewCustom config viewTabDefault


{-| -}
viewTabDefault : Tab id -> Html msg
viewTabDefault tab =
    Html.text tab.label


{-| -}
viewCustom : Config id msg -> (Tab id -> Html msg) -> Html msg
viewCustom config viewInnerTab =
    let
        selected =
            List.Zipper.current config.tabs

        viewTabs =
            List.Zipper.toList config.tabs
                |> List.map (viewTab config viewInnerTab selected)
    in
    Html.div []
        [ Html.div
            [ styles.class [ Container ] ]
            [ View.Extra.viewJust viewTitle config.title
            , Html.ul
                [ styles.class [ Tabs config.alignment ]
                , Accessibility.Role.tabList
                ]
                viewTabs
            ]
        , Html.div
            [ Accessibility.Role.tabPanel
            , Accessibility.Aria.labelledBy (tabToId selected)
            , Accessibility.Widget.hidden False
            , Html.Attributes.id (tabToBodyId selected)
            ]
            [ config.content selected.id ]
        ]


viewTitle : String -> Html msg
viewTitle title =
    Html.h1
        [ styles.class [ Title ] ]
        [ Html.text title ]


viewTab : Config id msg -> (Tab id -> Html msg) -> Tab id -> Tab id -> Html msg
viewTab { onSelect, tabs } viewInnerTab selected tab =
    Html.li
        [ styles.class [ TabContainer (selected.id == tab.id) ]
        , Html.Events.onClick (onSelect tab.id)
        , Accessibility.Key.onKeyDown [ Accessibility.Key.enter (onSelect tab.id) ]
        , Html.Events.onFocus (onSelect tab.id)
        , Html.Attributes.tabindex 0
        , Accessibility.Role.presentation
        , Html.Attributes.id (tabToId tab)
        , Accessibility.Aria.controls (tabToBodyId tab)
        , Accessibility.Widget.selected (selected.id == tab.id)
        , Html.Events.on "keyup" <|
            Json.Decode.andThen
                (\keyCode ->
                    if keyCode == 39 then
                        tabs
                            |> List.Zipper.next
                            |> Maybe.map (List.Zipper.current >> .id >> onSelect >> Json.Decode.succeed)
                            |> Maybe.withDefault (Json.Decode.fail "No next tab")
                    else if keyCode == 37 then
                        tabs
                            |> List.Zipper.previous
                            |> Maybe.map (List.Zipper.current >> .id >> onSelect >> Json.Decode.succeed)
                            |> Maybe.withDefault (Json.Decode.fail "No previous tab")
                    else
                        Json.Decode.fail "Wrong key code"
                )
                Html.Events.keyCode
        ]
        [ Html.a
            [ styles.class [ TabContainerLink ]
            , Accessibility.Role.tab
            , noOpHref
            , Html.Attributes.tabindex -1
            ]
            [ viewInnerTab tab ]
        ]


{-| Describe a tab that is meant to link to another page
-}
type alias TabLink =
    { label : String
    , href : Maybe String
    }


{-| Configure a set a tab links
-}
type alias LinkConfig msg =
    { title : Maybe String
    , tabs : Zipper TabLink
    , content : Html msg
    , alignment : Alignment
    }


{-| View a set of tab links
-}
links : LinkConfig msg -> Html msg
links config =
    Html.div []
        [ Html.nav
            [ styles.class [ Container ] ]
            [ View.Extra.viewJust viewTitle config.title
            , Html.ul
                [ styles.class [ Tabs config.alignment ] ]
                (config.tabs
                    |> mapWithCurrent (viewTabLink config)
                    |> List.Zipper.toList
                )
            ]
        , Html.div [] [ config.content ]
        ]


viewTabLink : LinkConfig msg -> Bool -> TabLink -> Html msg
viewTabLink config isSelected tabLink =
    Html.li
        [ styles.class [ TabContainer isSelected ]
        , Accessibility.Role.presentation
        , Html.Attributes.id (tabToId tabLink)
        ]
        [ Html.a
            [ styles.class [ TabClickableLink ]
            , tabLink.href
                |> Maybe.map Html.Attributes.href
                |> Maybe.withDefault noOpHref
            ]
            [ Html.text tabLink.label ]
        ]



-- HELP


tabToId : { a | label : String } -> String
tabToId tab =
    tab.label


tabToBodyId : { a | label : String } -> String
tabToBodyId tab =
    "tab-body-" ++ tab.label


mapWithCurrent : (Bool -> a -> b) -> Zipper a -> Zipper b
mapWithCurrent fn (Zipper before current after) =
    Zipper
        (List.map (fn False) before)
        (fn True current)
        (List.map (fn False) after)



-- STYLES


{-| -}
type CssClasses
    = Container
    | Title
    | Tabs Alignment
    | TabContainer Bool
    | TabContainerLink
    | TabClickableLink


{-| -}
styles : Nri.Styles.Styles Never CssClasses msg
styles =
    Nri.Styles.styles "Nri-Tabs-"
        [ Css.class Container
            [ Css.displayFlex
            , Css.alignItems Css.flexEnd
            , Css.borderBottom (Css.px 1)
            , Css.borderBottomStyle Css.solid
            , Css.borderBottomColor Nri.Colors.navy
            , Nri.Fonts.baseFont
            ]
        , Css.class Title
            [ Css.flexGrow (Css.int 2)
            , Css.fontSize (Css.px 30)
            , Css.fontWeight Css.bold
            , Css.margin Css.zero
            , Css.marginTop (Css.px 5)
            , Css.marginBottom (Css.px 10)
            , Css.color Nri.Colors.navy
            , Css.width (Css.px 430)
            ]
        , Css.class (Tabs Left)
            [ stylesTabs
            , Css.justifyContent Css.flexStart
            ]
        , Css.class (Tabs Center)
            [ stylesTabs
            , Css.justifyContent Css.center
            ]
        , Css.class (Tabs Right)
            [ stylesTabs
            , Css.justifyContent Css.flexEnd
            ]
        , Css.class (TabContainer False) <|
            [ stylesTab
            , Css.backgroundColor Nri.Colors.frost
            , Css.backgroundImage <|
                Css.linearGradient2 Css.toTop
                    (Css.stop2 (Nri.Colors.Extra.withAlpha 0.25 Nri.Colors.azure) (Css.pct 0))
                    (Css.stop2 (Nri.Colors.Extra.withAlpha 0 Nri.Colors.azure) (Css.pct 25))
                    [ Css.stop2 (Nri.Colors.Extra.withAlpha 0 Nri.Colors.azure) (Css.pct 100) ]
            ]
        , Css.class (TabContainer True) <|
            [ stylesTab
            , Css.backgroundColor Nri.Colors.white
            , Css.borderBottom (Css.px 1)
            , Css.borderBottomStyle Css.solid
            , Css.borderBottomColor Nri.Colors.white
            ]
        , Css.class TabContainerLink
            [ Css.color Nri.Colors.navy
            , Css.hover [ Css.textDecoration Css.none ]
            , Css.focus [ Css.textDecoration Css.none ]
            , Css.display Css.inlineBlock
            , Css.padding4 (Css.px 14) (Css.px 20) (Css.px 12) (Css.px 20)
            , Css.position Css.relative
            , Css.textDecoration Css.none
            ]
        , Css.class TabClickableLink
            [ Css.color Nri.Colors.navy
            , Css.display Css.inlineBlock
            , Css.padding4 (Css.px 14) (Css.px 20) (Css.px 12) (Css.px 20)
            , Css.textDecoration Css.none
            ]
        ]


stylesTabs : Style
stylesTabs =
    Css.batch
        [ Css.listStyle Css.none
        , Css.margin Css.zero
        , Css.fontSize (Css.px 19)
        , Css.displayFlex
        , Css.flexGrow (Css.int 1)
        , Css.marginRight (Css.px 10)
        ]


stylesTab : Style
stylesTab =
    Css.batch
        [ Css.display Css.inlineBlock
        , Css.borderTopLeftRadius (Css.px 10)
        , Css.borderTopRightRadius (Css.px 10)
        , Css.border3 (Css.px 1) Css.solid Nri.Colors.navy
        , Css.marginBottom (Css.px -1)
        , Css.marginLeft (Css.px 10)
        , Css.cursor Css.pointer
        , Css.firstChild
            [ Css.marginLeft Css.zero
            ]
        ]