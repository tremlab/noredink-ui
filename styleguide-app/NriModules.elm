module NriModules exposing (ModuleStates, Msg, init, nriThemedModules, subscriptions, update)

import Assets exposing (assets)
import Examples.Alert
import Examples.BannerAlert
import Examples.Button
import Examples.Checkbox
import Examples.ClickableText
import Examples.Colors
import Examples.DisclosureIndicator
import Examples.Dropdown
import Examples.Fonts
import Examples.Icon
import Examples.Modal
import Examples.Page
import Examples.SegmentedControl
import Examples.Select
import Examples.SlideModal
import Examples.Table
import Examples.Tabs
import Examples.Text
import Examples.Text.Writing
import Examples.TextArea as TextAreaExample
import Examples.TextInput as TextInputExample
import Html exposing (Html, img)
import Html.Attributes exposing (..)
import ModuleExample exposing (Category(..), ModuleExample)
import Url exposing (Url)


type alias ModuleStates =
    { buttonExampleState : Examples.Button.State
    , clickableTextExampleState : Examples.ClickableText.State
    , checkboxExampleState : Examples.Checkbox.State
    , dropdownState : Examples.Dropdown.State Examples.Dropdown.Value
    , segmentedControlState : Examples.SegmentedControl.State
    , selectState : Examples.Select.State Examples.Select.Value
    , tableExampleState : Examples.Table.State
    , textAreaExampleState : TextAreaExample.State
    , textInputExampleState : TextInputExample.State
    , disclosureIndicatorExampleState : Examples.DisclosureIndicator.State
    , modalExampleState : Examples.Modal.State
    , slideModalExampleState : Examples.SlideModal.State
    , tabsExampleState : Examples.Tabs.Tab
    }


init : ModuleStates
init =
    { buttonExampleState = Examples.Button.init assets
    , clickableTextExampleState = Examples.ClickableText.init assets
    , checkboxExampleState = Examples.Checkbox.init
    , dropdownState = Examples.Dropdown.init
    , segmentedControlState = Examples.SegmentedControl.init
    , selectState = Examples.Select.init
    , tableExampleState = Examples.Table.init
    , textAreaExampleState = TextAreaExample.init
    , textInputExampleState = TextInputExample.init
    , disclosureIndicatorExampleState = Examples.DisclosureIndicator.init
    , modalExampleState = Examples.Modal.init
    , slideModalExampleState = Examples.SlideModal.init
    , tabsExampleState = Examples.Tabs.First
    }


type Msg
    = ButtonExampleMsg Examples.Button.Msg
    | ClickableTextExampleMsg Examples.ClickableText.Msg
    | CheckboxExampleMsg Examples.Checkbox.Msg
    | DropdownMsg Examples.Dropdown.Msg
    | SegmentedControlMsg Examples.SegmentedControl.Msg
    | SelectMsg Examples.Select.Msg
    | ShowItWorked String String
    | TableExampleMsg Examples.Table.Msg
    | TextAreaExampleMsg TextAreaExample.Msg
    | TextInputExampleMsg TextInputExample.Msg
    | DisclosureIndicatorExampleMsg Examples.DisclosureIndicator.Msg
    | ModalExampleMsg Examples.Modal.Msg
    | SlideModalExampleMsg Examples.SlideModal.Msg
    | TabsExampleMsg Examples.Tabs.Tab
    | NoOp


update : Msg -> ModuleStates -> ( ModuleStates, Cmd Msg )
update outsideMsg moduleStates =
    case outsideMsg of
        ButtonExampleMsg msg ->
            let
                ( buttonExampleState, cmd ) =
                    Examples.Button.update msg moduleStates.buttonExampleState
            in
            ( { moduleStates | buttonExampleState = buttonExampleState }
            , Cmd.map ButtonExampleMsg cmd
            )

        ClickableTextExampleMsg msg ->
            let
                ( clickableTextExampleState, cmd ) =
                    Examples.ClickableText.update msg moduleStates.clickableTextExampleState
            in
            ( { moduleStates | clickableTextExampleState = clickableTextExampleState }
            , Cmd.map ClickableTextExampleMsg cmd
            )

        CheckboxExampleMsg msg ->
            let
                ( checkboxExampleState, cmd ) =
                    Examples.Checkbox.update msg moduleStates.checkboxExampleState
            in
            ( { moduleStates | checkboxExampleState = checkboxExampleState }, Cmd.map CheckboxExampleMsg cmd )

        DropdownMsg msg ->
            let
                ( dropdownState, cmd ) =
                    Examples.Dropdown.update msg moduleStates.dropdownState
            in
            ( { moduleStates | dropdownState = dropdownState }
            , Cmd.map DropdownMsg cmd
            )

        SegmentedControlMsg msg ->
            let
                ( segmentedControlState, cmd ) =
                    Examples.SegmentedControl.update msg moduleStates.segmentedControlState
            in
            ( { moduleStates | segmentedControlState = segmentedControlState }
            , Cmd.map SegmentedControlMsg cmd
            )

        SelectMsg msg ->
            let
                ( selectState, cmd ) =
                    Examples.Select.update msg moduleStates.selectState
            in
            ( { moduleStates | selectState = selectState }
            , Cmd.map SelectMsg cmd
            )

        ShowItWorked group message ->
            let
                _ =
                    Debug.log group message
            in
            ( moduleStates, Cmd.none )

        TableExampleMsg msg ->
            let
                ( tableExampleState, cmd ) =
                    Examples.Table.update msg moduleStates.tableExampleState
            in
            ( { moduleStates | tableExampleState = tableExampleState }
            , Cmd.map TableExampleMsg cmd
            )

        TextAreaExampleMsg msg ->
            let
                ( textAreaExampleState, cmd ) =
                    TextAreaExample.update msg moduleStates.textAreaExampleState
            in
            ( { moduleStates | textAreaExampleState = textAreaExampleState }
            , Cmd.map TextAreaExampleMsg cmd
            )

        TextInputExampleMsg msg ->
            let
                ( textInputExampleState, cmd ) =
                    TextInputExample.update msg moduleStates.textInputExampleState
            in
            ( { moduleStates | textInputExampleState = textInputExampleState }
            , Cmd.map TextInputExampleMsg cmd
            )

        DisclosureIndicatorExampleMsg msg ->
            let
                ( disclosureIndicatorExampleState, cmd ) =
                    Examples.DisclosureIndicator.update msg moduleStates.disclosureIndicatorExampleState
            in
            ( { moduleStates | disclosureIndicatorExampleState = disclosureIndicatorExampleState }
            , Cmd.map DisclosureIndicatorExampleMsg cmd
            )

        ModalExampleMsg msg ->
            let
                ( modalExampleState, cmd ) =
                    Examples.Modal.update msg moduleStates.modalExampleState
            in
            ( { moduleStates | modalExampleState = modalExampleState }
            , Cmd.map ModalExampleMsg cmd
            )

        SlideModalExampleMsg msg ->
            let
                ( slideModalExampleState, cmd ) =
                    Examples.SlideModal.update msg moduleStates.slideModalExampleState
            in
            ( { moduleStates | slideModalExampleState = slideModalExampleState }
            , Cmd.map SlideModalExampleMsg cmd
            )

        TabsExampleMsg tab ->
            ( { moduleStates | tabsExampleState = tab }
            , Cmd.none
            )

        NoOp ->
            ( moduleStates, Cmd.none )


subscriptions : ModuleStates -> Sub Msg
subscriptions moduleStates =
    Sub.batch
        []


{-| A container with a visually-apparent size for demonstrating how style guide components
fill their parents.
-}
container : Int -> List (Html msg) -> Html msg
container width children =
    Html.div
        [ Html.Attributes.class "demo-container"
        , style "width" (Debug.toString width ++ "px")
        ]
        children


nriThemedModules : ModuleStates -> List (ModuleExample Msg)
nriThemedModules model =
    [ Examples.Alert.example
    , Examples.BannerAlert.example
    , Examples.Button.example (exampleMessages ButtonExampleMsg) model.buttonExampleState
    , Examples.ClickableText.example (exampleMessages ClickableTextExampleMsg) model.clickableTextExampleState
    , Examples.Checkbox.example CheckboxExampleMsg model.checkboxExampleState
    , Examples.Dropdown.example DropdownMsg model.dropdownState
    , Examples.Icon.example
    , Examples.Page.example NoOp
    , Examples.SegmentedControl.example SegmentedControlMsg model.segmentedControlState
    , Examples.Select.example SelectMsg model.selectState
    , Examples.Text.example
    , Examples.Text.Writing.example
    , Examples.Fonts.example
    , Examples.Table.example TableExampleMsg model.tableExampleState
    , TextAreaExample.example TextAreaExampleMsg model.textAreaExampleState
    , TextInputExample.example TextInputExampleMsg model.textInputExampleState
    , Examples.DisclosureIndicator.example DisclosureIndicatorExampleMsg model.disclosureIndicatorExampleState
    , Examples.Colors.example
    , Examples.Modal.example ModalExampleMsg model.modalExampleState
    , Examples.SlideModal.example SlideModalExampleMsg model.slideModalExampleState
    , Examples.Tabs.example TabsExampleMsg model.tabsExampleState
    ]


exampleMessages : (msg -> Msg) -> String -> ModuleExample.ModuleMessages msg Msg
exampleMessages exampleMessageWrapper exampleName =
    { noOp = NoOp
    , showItWorked = ShowItWorked exampleName
    , wrapper = exampleMessageWrapper
    }


route : Url -> Maybe String
route location =
    location.fragment
        |> Maybe.map (String.dropLeft 1)
