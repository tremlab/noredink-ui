module Nri.Ui.Confetti.V1 exposing
    ( Model, init
    , view
    , Msg, burst, update, updatePageWidth, subscriptions
    )

{-|

@docs Model, init
@docs view
@docs Msg, burst, update, updatePageWidth, subscriptions

-}

import Css exposing (Color)
import Html.Styled as Html
import Html.Styled.Attributes as Attributes exposing (css)
import Nri.Ui.Colors.V1 as Colors
import Particle exposing (Particle)
import Particle.System as ParticleSystem
import Random exposing (Generator)
import Random.Extra
import Random.Float exposing (normal)



-- MODEL


{-| -}
type Model
    = System (ParticleSystem.System Confetti) Float


type Confetti
    = Word
        { color : Color
        , text : String
        , rotations : Float
        }
    | Square
        { color : Color
        , rotations : Float
        , rotationOffset : Float
        }


{-| -}
init : Float -> Model
init center =
    System
        (ParticleSystem.init (Random.initialSeed 0))
        center



-- VIEW


{-| -}
view : Model -> Html.Html msg
view (System system _) =
    system
        |> ParticleSystem.viewCustom viewConfetti
            (Html.div
                [ Attributes.style "position" "absolute"
                , Attributes.style "top" "0"
                , Attributes.style "left" "0"
                , Attributes.style "width" "100%"
                , Attributes.style "height" "100vh"
                , Attributes.style "pointer-events" "none"
                ]
            )


viewConfetti : Particle Confetti -> Html.Html msg
viewConfetti particle =
    let
        lifetime =
            Particle.lifetimePercent particle
    in
    case Particle.data particle of
        Word { color, text, rotations } ->
            Html.div
                [ css
                    [ Css.backgroundColor color
                    , Css.padding (Css.px 4)
                    , Css.borderRadius (Css.px 4)
                    ]
                , Attributes.style "position" "absolute"

                {-
                   There are important performance optimizations happening here:
                       - `transform: translate / scale / rotate` are the most performant for animations
                       - `will-change: transform` tells the browser our intent and it makes optimizations
                          for an upcoming `transform`
                       - Putting `rotate` after `translateX` and `translateY` is more performant
                -}
                , Attributes.style "left" "0px"
                , Attributes.style "top" "0px"
                , Attributes.style "transform-origin" "center"
                , Attributes.style "will-change" "transform"
                , Attributes.style "transform" <|
                    "translateX("
                        ++ String.fromFloat (Particle.leftPixels particle)
                        ++ "px) translateY("
                        ++ String.fromFloat (Particle.topPixels particle)
                        ++ "px) rotate("
                        ++ String.fromFloat ((rotations * lifetime) * 360)
                        ++ "deg)"
                ]
                [ Html.text text ]

        Square { color, rotationOffset, rotations } ->
            Html.div
                [ css
                    [ Css.backgroundColor color
                    , Css.width (Css.px 14)
                    , Css.height (Css.px 14)
                    ]
                , Attributes.style "position" "absolute"
                , Attributes.style "left" "0px"
                , Attributes.style "top" "0px"
                , Attributes.style "transform-origin" "center"
                , Attributes.style "will-change" "transform"
                , Attributes.style "transform" <|
                    "translateX("
                        ++ String.fromFloat (Particle.leftPixels particle)
                        ++ "px) translateY("
                        ++ String.fromFloat (Particle.topPixels particle)
                        ++ "px) rotate("
                        ++ String.fromFloat ((rotations * lifetime + rotationOffset) * 360)
                        ++ "deg)"
                ]
                []



-- UPDATE


{-| `burst` BURSTS CONFETTI!!! Pass in a list of words that you'd like to have
in the confetti:

    Confetti.burst
        [ { color = Colors.highlightMagenta, text = "tree" }
        , { color = Colors.highlightGreen, text = "bush" }
        , { color = Colors.highlightCyan, text = "succulent" }
        ]
        state.confetti

-}
burst : List { color : Color, text : String } -> Model -> Model
burst highlightedWords (System system center) =
    System
        (ParticleSystem.burst (particlesGenerator center highlightedWords) system)
        center


particlesGenerator : Float -> List { color : Color, text : String } -> Generator (List (Particle Confetti))
particlesGenerator center highlightedWords =
    Random.list 200 <|
        particleGenerator
            center
            (Random.Extra.frequency
                ( 2 / 5, squareGenerator )
                [ ( 3 / 5, confettiGenerator highlightedWords ) ]
            )


confettiGenerator : List { color : Color, text : String } -> Generator Confetti
confettiGenerator highlightedWords =
    Random.Extra.sample highlightedWords
        |> Random.andThen
            (\word ->
                case word of
                    Just { color, text } ->
                        wordGenerator text color

                    Nothing ->
                        squareGenerator
            )


squareGenerator : Generator Confetti
squareGenerator =
    Random.map3
        (\color rotations rotationOffset ->
            Square
                { color = color
                , rotations = rotations
                , rotationOffset = rotationOffset
                }
        )
        randomHighlightColor
        (normal 1 1)
        (Random.float 0 1)


randomHighlightColor : Generator Color
randomHighlightColor =
    Random.weighted
        ( 1 / 20, Colors.highlightYellowDark )
        [ ( 1 / 20, Colors.highlightCyanDark )
        , ( 1 / 20, Colors.highlightMagentaDark )
        , ( 1 / 20, Colors.highlightGreenDark )
        , ( 1 / 20, Colors.highlightBlueDark )
        , ( 1.5 / 10, Colors.highlightYellow )
        , ( 1.5 / 10, Colors.highlightCyan )
        , ( 1.5 / 10, Colors.highlightMagenta )
        , ( 1.5 / 10, Colors.highlightGreen )
        , ( 1.5 / 10, Colors.highlightBlue )
        ]


wordGenerator : String -> Color -> Generator Confetti
wordGenerator word color =
    Random.map
        (\rotations ->
            Word
                { text = word
                , color = color
                , rotations = rotations
                }
        )
        (normal 0.75 0.5)


particleGenerator : Float -> Generator Confetti -> Generator (Particle Confetti)
particleGenerator center generator =
    Particle.init generator
        |> Particle.withLifetime (normal 2.5 1)
        |> Particle.withLocation (normal center (center / 2) |> Random.map (\x -> { x = x, y = -50 }))
        |> Particle.withDirection (Random.constant (degrees 0))
        |> Particle.withSpeed (Random.float 0 1000)
        |> Particle.withGravity 600
        |> Particle.withDrag
            (\confetti ->
                { density = 0.001226
                , coefficient = 1
                , area =
                    case confetti of
                        Square _ ->
                            1

                        Word { text } ->
                            toFloat (String.length text)
                }
            )


{-| -}
type alias Msg =
    ParticleSystem.Msg Confetti


{-| -}
update : ParticleSystem.Msg Confetti -> Model -> Model
update msg (System system center) =
    System (ParticleSystem.update msg system) center


{-| You will need to watch for page resize events and update the confetti model
with the new width. If you don't, your confetti will be off-center.

Why is this not part of subscriptions? Your application may already be listening
for browser resize events -- we don't want to double-up listeners unnecessarily.

-}
updatePageWidth : Int -> Model -> Model
updatePageWidth width (System system _) =
    System system (toFloat (width // 2))


{-| -}
subscriptions : (Msg -> msg) -> Model -> Sub msg
subscriptions confettiMsg (System system _) =
    ParticleSystem.sub [] confettiMsg system