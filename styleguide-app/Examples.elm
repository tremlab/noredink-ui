module Examples exposing (ModuleStates, Msg, init, subscriptions, update, view)

import Dict exposing (Dict)
import Example exposing (Example)
import Examples.Accordion as Accordion
import Examples.Alert as Alert
import Examples.AssignmentIcon as AssignmentIcon
import Examples.BannerAlert as BannerAlert
import Examples.Button as Button
import Examples.Callout as Callout
import Examples.Checkbox as Checkbox
import Examples.ClickableSvg as ClickableSvg
import Examples.ClickableText as ClickableText
import Examples.Colors as Colors
import Examples.DisclosureIndicator as DisclosureIndicator
import Examples.Dropdown as Dropdown
import Examples.Fonts as Fonts
import Examples.Heading as Heading
import Examples.Icon as Icon
import Examples.Logo as Logo
import Examples.MasteryIcon as MasteryIcon
import Examples.Modal as Modal
import Examples.Page as Page
import Examples.Pennant as Pennant
import Examples.SegmentedControl as SegmentedControl
import Examples.Select as Select
import Examples.Slide as Slide
import Examples.SlideModal as SlideModal
import Examples.SortableTable as SortableTable
import Examples.Svg as Svg
import Examples.Table as Table
import Examples.Tabs as Tabs
import Examples.Text as Text
import Examples.Text.Writing as Writing
import Examples.TextArea as TextArea
import Examples.TextInput as TextInput
import Examples.Tooltip as Tooltip
import Examples.UiIcon as UiIcon
import Html.Styled as Html exposing (Html)


constructors : List ( String, Example State Msg )
constructors =
    [ ( "accordion", Example.wrap { wrapMsg = AccordionMsg, unwrapMsg = getAccordionMsg, wrapState = AccordionState, unwrapState = getAccordionState } Accordion.example )
    , ( "button", Example.wrap { wrapMsg = ButtonMsg, unwrapMsg = getButtonMsg, wrapState = ButtonState, unwrapState = getButtonState } Button.example )
    , ( "bannerAlert", Example.wrap { wrapMsg = BannerAlertMsg, unwrapMsg = getBannerAlertMsg, wrapState = BannerAlertState, unwrapState = getBannerAlertState } BannerAlert.example )
    , ( "modal", Example.wrap { wrapMsg = ModalMsg, unwrapMsg = getModalMsg, wrapState = ModalState, unwrapState = getModalState } Modal.example )
    ]


type State
    = AccordionState Accordion.State
    | ButtonState Button.State
    | BannerAlertState BannerAlert.State
    | ModalState Modal.State


getAccordionState : State -> Maybe Accordion.State
getAccordionState msg =
    case msg of
        AccordionState childState ->
            Just childState

        _ ->
            Nothing


getButtonState : State -> Maybe Button.State
getButtonState msg =
    case msg of
        ButtonState childState ->
            Just childState

        _ ->
            Nothing


getBannerAlertState : State -> Maybe BannerAlert.State
getBannerAlertState msg =
    case msg of
        BannerAlertState childState ->
            Just childState

        _ ->
            Nothing


getModalState : State -> Maybe Modal.State
getModalState msg =
    case msg of
        ModalState childState ->
            Just childState

        _ ->
            Nothing


type Msg
    = AccordionMsg Accordion.Msg
    | ButtonMsg Button.Msg
    | BannerAlertMsg BannerAlert.Msg
    | ModalMsg Modal.Msg


getAccordionMsg : Msg -> Maybe Accordion.Msg
getAccordionMsg msg =
    case msg of
        AccordionMsg childMsg ->
            Just childMsg

        _ ->
            Nothing


getButtonMsg : Msg -> Maybe Button.Msg
getButtonMsg msg =
    case msg of
        ButtonMsg childMsg ->
            Just childMsg

        _ ->
            Nothing


getBannerAlertMsg : Msg -> Maybe BannerAlert.Msg
getBannerAlertMsg msg =
    case msg of
        BannerAlertMsg childMsg ->
            Just childMsg

        _ ->
            Nothing


getModalMsg : Msg -> Maybe Modal.Msg
getModalMsg msg =
    case msg of
        ModalMsg childMsg ->
            Just childMsg

        _ ->
            Nothing


update : Msg -> ModuleStates -> ( ModuleStates, Cmd Msg )
update msg moduleStates =
    let
        update_ key =
            case Dict.get key moduleStates of
                Just example ->
                    example.update msg example.state
                        |> Tuple.mapFirst
                            (\newState ->
                                Dict.insert key { example | state = newState } moduleStates
                            )

                Nothing ->
                    ( moduleStates, Cmd.none )
    in
    case msg of
        AccordionMsg exampleMsg ->
            update_ "accordion"

        ButtonMsg exampleMsg ->
            update_ "button"

        BannerAlertMsg exampleMsg ->
            update_ "bannerAlert"

        ModalMsg exampleMsg ->
            update_ "modal"


type alias ModuleStates =
    Dict String (Example State Msg)


init : ModuleStates
init =
    Dict.fromList constructors


{-| -}
subscriptions : ModuleStates -> Sub Msg
subscriptions moduleStates =
    allExamples moduleStates
        |> List.map (\example -> example.subscriptions example.state)
        |> Sub.batch


{-| -}
view : Bool -> (Example State Msg -> Bool) -> ModuleStates -> List (Html Msg)
view showFocusLink filter moduleStates =
    allExamples moduleStates
        |> List.filter filter
        |> List.map (Example.view showFocusLink)


allExamples : ModuleStates -> List (Example State Msg)
allExamples moduleStates =
    List.filterMap (\accessor -> Dict.get accessor moduleStates)
        (List.map Tuple.first constructors)
