module Nri.Ui.UiIcon.V1 exposing (unarchive, share, seeMore, preview, performance, openClose, download)

{-|

@docs unarchive, share, seeMore, preview, performance, openClose, download

    import Css
    import Html.Styled exposing (..)
    import Html.Styled.Attrbutes exposing (css)
    import Nri.Ui.Colors.V1 as Colors
    import Nri.Ui.Svg.V1 as Svg
    import Nri.Ui.UiIcon.V1 as UiIcon

    view : Html msg
    view =
        div [ css [ Css.color Colors.lichen ] ]
            [ Svg.toHtml UiIcon.unarchive ]

-}

import Nri.Ui.Svg.V1
import Svg.Styled as Svg
import Svg.Styled.Attributes as Attributes


{-| -}
unarchive : Nri.Ui.Svg.V1.Svg
unarchive =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.viewBox "0 0 25 25"
        ]
        [ Svg.path
            [ Attributes.fill "currentcolor"
            , Attributes.fillRule "evenodd"
            , Attributes.d "M.858 22.7c.026.233.104.46.228.66.128.205.292.385.484.531.202.154.428.274.669.355.25.085.515.129.78.129h18.954a2.435 2.435 0 0 0 1.455-.484c.19-.145.356-.323.484-.526.124-.2.202-.425.228-.66l.85-7.696a1.716 1.716 0 0 0-.49-1.403 1.94 1.94 0 0 0-.653-.431 2.244 2.244 0 0 0-.841-.16H1.999a2.239 2.239 0 0 0-.84.16 1.93 1.93 0 0 0-.653.431 1.724 1.724 0 0 0-.4.634 1.72 1.72 0 0 0-.097.769l.849 7.69zm6.327-5.2a.906.906 0 0 1 .213-.3c.097-.09.209-.16.332-.206.132-.05.271-.076.413-.076a1.149 1.149 0 0 1 .764.282c.1.082.183.184.243.3.058.112.09.237.093.365l.042 1.376h6.427l.041-1.376h.001a.86.86 0 0 1 .09-.366.992.992 0 0 1 .24-.3c.102-.088.22-.158.346-.205a1.162 1.162 0 0 1 .832 0c.123.047.236.116.331.205a.834.834 0 0 1 .282.666l-.112 2.283a.837.837 0 0 1-.099.35.973.973 0 0 1-.234.284 1.176 1.176 0 0 1-.739.26H8.307c-.137 0-.275-.024-.404-.071a1.119 1.119 0 0 1-.348-.181.967.967 0 0 1-.234-.285.828.828 0 0 1-.1-.349l-.112-2.283a.83.83 0 0 1 .076-.374zM18.635 2.81h-2.183l.065-.962A2.715 2.715 0 0 0 16.35.717c0-.031-.026-.06-.038-.092l3.493.001c.588 0 1.089.427 1.187 1.012l1.616 9.548h-2.433l-1.358-8.204a.193.193 0 0 0-.19-.162l.007-.009zM8.932.707h.001a2.713 2.713 0 0 0-.167 1.139l.066.962H6.649a.194.194 0 0 0-.19.164l-1.358 8.214H2.668l1.616-9.545A1.209 1.209 0 0 1 5.474.628h3.492c-.014.037-.03.058-.04.09l.007-.01zM8.795 4.68a.812.812 0 0 0-.064.263.767.767 0 0 0 .182.542.844.844 0 0 0 .161.152 1.172 1.172 0 0 0 .432.179c.08.015.163.024.245.024h1.16l-.132 4.095a.91.91 0 0 0 .275.686 1.037 1.037 0 0 0 .719.29h1.73a1.044 1.044 0 0 0 .719-.29.91.91 0 0 0 .275-.686l-.133-4.097h1.213c.095 0 .19-.012.281-.034.09-.022.178-.056.26-.101a.839.839 0 0 0 .357-.36.782.782 0 0 0 .06-.547.845.845 0 0 0-.115-.255.916.916 0 0 0-.091-.116L13.413 1.2a.833.833 0 0 0-.154-.135 1.136 1.136 0 0 0-1.24 0 .851.851 0 0 0-.155.135L8.952 4.417a.939.939 0 0 0-.164.252l.007.01z"
            ]
            []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
share : Nri.Ui.Svg.V1.Svg
share =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        , Attributes.viewBox "0 0 30 30"
        ]
        [ Svg.path
            [ Attributes.d "M18.5,0.1H1.8C0.3,0.1,0,0.5,0,1.9v26.2C0,29.7,0.4,30,1.8,30h26.3c1.5,0,1.8-0.3,1.8-1.8V12.3l-3.1,2.6v12H3.1V3.2h12.4L18.5,0.1z M23,9.9v4.2l7-7l-7-7v3.5C6.8,4.2,6.8,19.7,6.8,19.7S11.6,10.6,23,9.9z"
            ]
            []
        , Svg.path
            [ Attributes.fill "none"
            , Attributes.d "M18.5,0.1H1.8C0.3,0.1,0,0.5,0,1.9v26.2C0,29.7,0.4,30,1.8,30h26.3c1.5,0,1.8-0.3,1.8-1.8V12.3l-3.1,2.6v12H3.1V3.2h12.4L18.5,0.1z M23,9.9v4.2l7-7l-7-7v3.5C6.8,4.2,6.8,19.7,6.8,19.7S11.6,10.6,23,9.9z"
            ]
            []
        , Svg.path
            [ Attributes.fill "none"
            , Attributes.d "M-793.3-401V715h1024V-401H-793.3z"
            ]
            []
        , Svg.path
            [ Attributes.fill "none"
            , Attributes.d "M-815.4-385.9v1116h1024v-1116L-815.4-385.9L-815.4-385.9z"
            ]
            []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
seeMore : Nri.Ui.Svg.V1.Svg
seeMore =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        ]
        []
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
preview : Nri.Ui.Svg.V1.Svg
preview =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        ]
        []
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
performance : Nri.Ui.Svg.V1.Svg
performance =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        ]
        []
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
openClose : Nri.Ui.Svg.V1.Svg
openClose =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        ]
        []
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
download : Nri.Ui.Svg.V1.Svg
download =
    Svg.svg
        [ Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        ]
        []
        |> Nri.Ui.Svg.V1.fromHtml
