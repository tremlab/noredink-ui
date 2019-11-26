module Nri.Ui.MasteryIcon.V1 exposing (levelZero, levelOne, levelTwo, levelThree)

{-|

@docs levelZero, levelOne, levelTwo, levelThree

-}

import Nri.Ui.Svg.V1
import Svg.Styled as Svg
import Svg.Styled.Attributes as Attributes


{-| -}
levelZero : Nri.Ui.Svg.V1.Svg
levelZero =
    Svg.svg
        [ Attributes.viewBox "0 0 400 400"
        , Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        ]
        [ Svg.path [ Attributes.d "M91.6,147.8l14,28.4l2.6,5.2l5.7,0.8l31.3,4.6l-22.7,22.1l-4.1,4l1,5.7l5.4,31.2l-28-14.7l-5.1-2.7l-5.1,2.7 l-28,14.7l5.4-31.2l1-5.7l-4.2-4l-22.8-22.1l31.4-4.6l5.7-0.8l2.6-5.2L91.6,147.8 M91.5,128.1c-2,0-3.5,1.9-4.3,3.6l-19.6,39.7 l-43.8,6.4c-2.2,0.4-4.9,1.4-4.9,4c0,1.6,1.1,3.1,2.2,4.2l31.8,30.9l-7.5,43.6c-0.1,0.6-0.2,1.2-0.2,1.8c0,2.3,1.1,4.4,3.7,4.4 c1.2,0,2.4-0.4,3.5-1l39.2-20.6l39.2,20.6c1.1,0.6,2.3,1,3.5,1c2.5,0,3.6-2.1,3.6-4.4c0-0.6,0-1.2-0.1-1.8l-7.5-43.6l31.7-30.9 c1.1-1.1,2.3-2.6,2.3-4.2c0-2.6-2.8-3.7-4.9-4l-43.8-6.4l-19.6-39.7C95.1,130,93.6,128,91.5,128.1L91.5,128.1z" ] []
        , Svg.path [ Attributes.d "M308.4,147.8l14,28.4l2.6,5.2l5.7,0.8l31.3,4.6l-22.7,22.1l-4.1,4l1,5.7l5.4,31.2l-28-14.7l-5.1-2.7l-5.1,2.7 l-28,14.7l5.4-31.2l1-5.7l-4.1-4l-22.7-22.1l31.4-4.6l5.7-0.8l2.6-5.2L308.4,147.8 M308.4,128.1c-2,0-3.5,1.9-4.3,3.6l-19.6,39.7 l-43.8,6.4c-2.2,0.4-4.9,1.4-4.9,4c0,1.6,1.1,3.1,2.2,4.2l31.8,30.9l-7.5,43.6c-0.1,0.6-0.2,1.2-0.2,1.8c0,2.3,1.1,4.4,3.7,4.4 c1.2,0,2.4-0.4,3.5-1l39.2-20.6l39.2,20.6c1.1,0.6,2.3,1,3.5,1c2.5,0,3.6-2.1,3.6-4.4c0-0.6,0-1.2-0.1-1.8l-7.5-43.6l31.7-30.9 c1.1-1.1,2.3-2.6,2.3-4.2c0-2.6-2.8-3.7-4.9-4l-43.8-6.4l-19.6-39.7C311.9,130,310.4,128,308.4,128.1L308.4,128.1z" ] []
        , Svg.path [ Attributes.d "M200.6,264.9l14,28.4l2.6,5.2l5.7,0.8l31.3,4.6L231.6,326l-4.1,4l1,5.7l5.3,31.3l-28.1-14.8l-5.1-2.7l-5.1,2.7 L167.4,367l5.4-31.2l1-5.7l-4.1-4L146.9,304l31.4-4.6l5.7-0.8l2.6-5.2L200.6,264.9 M200.6,245.2c-2,0-3.5,1.9-4.3,3.6l-19.6,39.7 l-43.8,6.3c-2.2,0.4-4.9,1.4-4.9,4c0,1.6,1.1,3,2.2,4.2l31.8,30.9l-7.5,43.6c-0.1,0.6-0.2,1.2-0.2,1.8c0,2.3,1.1,4.4,3.7,4.4 c1.2,0,2.4-0.4,3.5-1l39.2-20.6l39.2,20.6c1.1,0.6,2.3,1,3.5,1c2.5,0,3.6-2.1,3.6-4.4c0-0.6,0-1.2-0.1-1.8l-7.5-43.6l31.7-30.9 c1.1-1.1,2.3-2.6,2.3-4.2c0-2.6-2.8-3.7-4.9-4l-43.8-6.4l-19.6-39.7C204.1,247.1,202.6,245.2,200.6,245.2L200.6,245.2z" ] []
        , Svg.path [ Attributes.d "M200.1,27.1l14,28.4l2.6,5.2l5.7,0.8l31.3,4.6l-22.7,22.1l-4.1,4l1,5.7l5.4,31.2l-28-14.7l-5.1-2.7l-5.1,2.7 L167,129.1l5.4-31.2l1-5.7l-4.2-4l-22.8-22.1l31.4-4.6l5.7-0.8l2.6-5.2L200.1,27.1 M200.1,7.3c-2,0-3.5,1.9-4.3,3.6l-19.6,39.7 L132.5,57c-2.2,0.4-4.9,1.4-4.9,4c0,1.6,1.1,3.1,2.2,4.2L161.5,96l-7.5,43.6c-0.1,0.6-0.2,1.2-0.2,1.8c0,2.3,1.1,4.4,3.7,4.4 c1.2,0,2.4-0.4,3.5-1l39.2-20.6l39.2,20.6c1.1,0.6,2.3,1,3.5,1c2.5,0,3.6-2.1,3.6-4.4c0-0.6,0-1.2-0.1-1.8L238.8,96l31.7-30.9 c1.1-1.1,2.3-2.6,2.3-4.2c0-2.6-2.8-3.7-4.9-4L224,50.6l-19.6-39.7C203.6,9.3,202.2,7.3,200.1,7.3L200.1,7.3z" ] []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
levelOne : Nri.Ui.Svg.V1.Svg
levelOne =
    Svg.svg
        [ Attributes.viewBox "0 0 400 400"
        , Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        ]
        [ Svg.path [ Attributes.d "M91.57,147.79l14,28.39,2.56,5.18,5.72.83,31.33,4.56-22.69,22.13-4.14,4,1,5.7,5.37,31.23L96.69,235.1l-5.12-2.69-5.12,2.69L58.4,249.84l5.37-31.23,1-5.71-4.15-4L37.87,186.76l31.39-4.56,5.72-.83,2.56-5.18,14-28.39m0-19.75c-2,0-3.49,1.92-4.27,3.58L67.67,171.31l-43.79,6.37c-2.18.35-4.88,1.4-4.88,4,0,1.57,1.13,3.05,2.18,4.19l31.75,30.88-7.5,43.61a11.94,11.94,0,0,0-.17,1.75c0,2.27,1.13,4.36,3.66,4.36a7.35,7.35,0,0,0,3.49-1l39.16-20.58,39.16,20.58a7.07,7.07,0,0,0,3.49,1c2.53,0,3.58-2.09,3.58-4.36a11.83,11.83,0,0,0-.09-1.75l-7.5-43.61,31.66-30.88c1.13-1.13,2.27-2.62,2.27-4.19,0-2.62-2.79-3.66-4.88-4l-43.79-6.37L95.84,131.62C95.06,130,93.58,128,91.57,128Z" ] []
        , Svg.path [ Attributes.d "M308.43,147.79l14,28.39,2.56,5.18,5.72.83,31.33,4.56-22.69,22.13-4.14,4,1,5.7,5.37,31.23L313.55,235.1l-5.12-2.69-5.12,2.69-28.05,14.74,5.37-31.23,1-5.71-4.15-4-22.73-22.11,31.39-4.56,5.72-.83,2.56-5.18,14-28.39m0-19.75c-2,0-3.49,1.92-4.27,3.58l-19.62,39.69-43.79,6.37c-2.18.35-4.88,1.4-4.88,4,0,1.57,1.13,3.05,2.18,4.19l31.75,30.88-7.5,43.61a12,12,0,0,0-.17,1.75c0,2.27,1.13,4.36,3.66,4.36a7.35,7.35,0,0,0,3.49-1l39.16-20.58,39.16,20.58a7.07,7.07,0,0,0,3.49,1c2.53,0,3.58-2.09,3.58-4.36a11.81,11.81,0,0,0-.09-1.75l-7.5-43.61,31.66-30.88c1.13-1.13,2.27-2.62,2.27-4.19,0-2.62-2.79-3.66-4.88-4l-43.79-6.37L312.7,131.62c-.79-1.66-2.27-3.58-4.27-3.58Z" ] []
        , Svg.path [ Attributes.d "M270.89,65.23,239.23,96.11l7.5,43.61a11.82,11.82,0,0,1,.09,1.75c0,2.27-1,4.36-3.58,4.36a7.07,7.07,0,0,1-3.49-1L200.59,124.2l-39.16,20.58a7.35,7.35,0,0,1-3.49,1c-2.53,0-3.66-2.09-3.66-4.36a11.94,11.94,0,0,1,.17-1.75l7.5-43.61L130.2,65.23c-1-1.13-2.18-2.62-2.18-4.19,0-2.62,2.7-3.66,4.88-4l43.79-6.37L196.31,11c.79-1.66,2.27-3.58,4.27-3.58s3.49,1.92,4.27,3.58l19.62,39.69L268.27,57c2.09.35,4.88,1.4,4.88,4C273.16,62.62,272,64.1,270.89,65.23Z" ] []
        , Svg.path [ Attributes.d "M200.59,264.92l14,28.39,2.56,5.18,5.72.83,31.33,4.56L231.55,326l-4.14,4,1,5.7L233.76,367,205.7,352.23l-5.12-2.69-5.12,2.69L167.41,367l5.37-31.23,1-5.71-4.15-4-22.73-22.11,31.39-4.56,5.72-.83,2.56-5.18,14-28.39m0-19.75c-2,0-3.49,1.92-4.27,3.58l-19.62,39.69L132.9,294.8c-2.18.35-4.88,1.4-4.88,4,0,1.57,1.13,3.05,2.18,4.19l31.75,30.88-7.5,43.61a12,12,0,0,0-.17,1.75c0,2.27,1.13,4.36,3.66,4.36a7.35,7.35,0,0,0,3.49-1L200.59,362l39.16,20.58a7.07,7.07,0,0,0,3.49,1c2.53,0,3.58-2.09,3.58-4.36a11.83,11.83,0,0,0-.09-1.75l-7.5-43.61L270.89,303c1.13-1.13,2.27-2.62,2.27-4.19,0-2.62-2.79-3.66-4.88-4l-43.79-6.37-19.62-39.69c-.79-1.66-2.27-3.58-4.27-3.58Z" ] []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
levelTwo : Nri.Ui.Svg.V1.Svg
levelTwo =
    Svg.svg
        [ Attributes.viewBox "0 0 400 400"
        , Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        ]
        [ Svg.path [ Attributes.d "M91.57,147.79l14,28.39,2.56,5.18,5.72.83,31.33,4.56-22.69,22.13-4.14,4,1,5.7,5.37,31.23L96.69,235.1l-5.12-2.69-5.12,2.69L58.4,249.84l5.37-31.23,1-5.71-4.15-4L37.87,186.76l31.39-4.56,5.72-.83,2.56-5.18,14-28.39m0-19.75c-2,0-3.49,1.92-4.27,3.58L67.67,171.31l-43.79,6.37c-2.18.35-4.88,1.4-4.88,4,0,1.57,1.13,3.05,2.18,4.19l31.75,30.88-7.5,43.61a11.94,11.94,0,0,0-.17,1.75c0,2.27,1.13,4.36,3.66,4.36a7.35,7.35,0,0,0,3.49-1l39.16-20.58,39.16,20.58a7.07,7.07,0,0,0,3.49,1c2.53,0,3.58-2.09,3.58-4.36a11.83,11.83,0,0,0-.09-1.75l-7.5-43.61,31.66-30.88c1.13-1.13,2.27-2.62,2.27-4.19,0-2.62-2.79-3.66-4.88-4l-43.79-6.37L95.84,131.62C95.06,130,93.58,128,91.57,128Z" ] []
        , Svg.path [ Attributes.d "M378.73,185.87l-31.66,30.88,7.5,43.61a11.82,11.82,0,0,1,.09,1.75c0,2.27-1,4.36-3.58,4.36a7.07,7.07,0,0,1-3.49-1l-39.16-20.58-39.16,20.58a7.35,7.35,0,0,1-3.49,1c-2.53,0-3.66-2.09-3.66-4.36a11.94,11.94,0,0,1,.17-1.75l7.5-43.61L238,185.87c-1-1.13-2.18-2.62-2.18-4.19,0-2.62,2.7-3.66,4.88-4l43.79-6.37,19.62-39.69c.79-1.66,2.27-3.58,4.27-3.58s3.49,1.92,4.27,3.58l19.62,39.69,43.79,6.37c2.09.35,4.88,1.4,4.88,4C381,183.26,379.87,184.74,378.73,185.87Z" ] []
        , Svg.path [ Attributes.d "M270.89,65.23,239.23,96.11l7.5,43.61a11.82,11.82,0,0,1,.09,1.75c0,2.27-1,4.36-3.58,4.36a7.07,7.07,0,0,1-3.49-1L200.59,124.2l-39.16,20.58a7.35,7.35,0,0,1-3.49,1c-2.53,0-3.66-2.09-3.66-4.36a11.94,11.94,0,0,1,.17-1.75l7.5-43.61L130.2,65.23c-1-1.13-2.18-2.62-2.18-4.19,0-2.62,2.7-3.66,4.88-4l43.79-6.37L196.31,11c.79-1.66,2.27-3.58,4.27-3.58s3.49,1.92,4.27,3.58l19.62,39.69L268.27,57c2.09.35,4.88,1.4,4.88,4C273.16,62.62,272,64.1,270.89,65.23Z" ] []
        , Svg.path [ Attributes.d "M200.59,264.92l14,28.39,2.56,5.18,5.72.83,31.33,4.56L231.55,326l-4.14,4,1,5.7L233.76,367,205.7,352.23l-5.12-2.69-5.12,2.69L167.41,367l5.37-31.23,1-5.71-4.15-4-22.73-22.11,31.39-4.56,5.72-.83,2.56-5.18,14-28.39m0-19.75c-2,0-3.49,1.92-4.27,3.58l-19.62,39.69L132.9,294.8c-2.18.35-4.88,1.4-4.88,4,0,1.57,1.13,3.05,2.18,4.19l31.75,30.88-7.5,43.61a12,12,0,0,0-.17,1.75c0,2.27,1.13,4.36,3.66,4.36a7.35,7.35,0,0,0,3.49-1L200.59,362l39.16,20.58a7.07,7.07,0,0,0,3.49,1c2.53,0,3.58-2.09,3.58-4.36a11.83,11.83,0,0,0-.09-1.75l-7.5-43.61L270.89,303c1.13-1.13,2.27-2.62,2.27-4.19,0-2.62-2.79-3.66-4.88-4l-43.79-6.37-19.62-39.69c-.79-1.66-2.27-3.58-4.27-3.58Z" ] []
        ]
        |> Nri.Ui.Svg.V1.fromHtml


{-| -}
levelThree : Nri.Ui.Svg.V1.Svg
levelThree =
    Svg.svg
        [ Attributes.viewBox "0 0 400 400"
        , Attributes.width "100%"
        , Attributes.height "100%"
        , Attributes.fill "currentcolor"
        ]
        [ Svg.path [ Attributes.d "M91.57,147.79l14,28.39,2.56,5.18,5.72.83,31.33,4.56-22.69,22.13-4.14,4,1,5.7,5.37,31.23L96.69,235.1l-5.12-2.69-5.12,2.69L58.4,249.84l5.37-31.23,1-5.71-4.15-4L37.87,186.76l31.39-4.56,5.72-.83,2.56-5.18,14-28.39m0-19.75c-2,0-3.49,1.92-4.27,3.58L67.67,171.31l-43.79,6.37c-2.18.35-4.88,1.4-4.88,4,0,1.57,1.13,3.05,2.18,4.19l31.75,30.88-7.5,43.61a11.94,11.94,0,0,0-.17,1.75c0,2.27,1.13,4.36,3.66,4.36a7.35,7.35,0,0,0,3.49-1l39.16-20.58,39.16,20.58a7.07,7.07,0,0,0,3.49,1c2.53,0,3.58-2.09,3.58-4.36a11.83,11.83,0,0,0-.09-1.75l-7.5-43.61,31.66-30.88c1.13-1.13,2.27-2.62,2.27-4.19,0-2.62-2.79-3.66-4.88-4l-43.79-6.37L95.84,131.62C95.06,130,93.58,128,91.57,128Z" ] []
        , Svg.path [ Attributes.d "M378.73,185.87l-31.66,30.88,7.5,43.61a11.82,11.82,0,0,1,.09,1.75c0,2.27-1,4.36-3.58,4.36a7.07,7.07,0,0,1-3.49-1l-39.16-20.58-39.16,20.58a7.35,7.35,0,0,1-3.49,1c-2.53,0-3.66-2.09-3.66-4.36a11.94,11.94,0,0,1,.17-1.75l7.5-43.61L238,185.87c-1-1.13-2.18-2.62-2.18-4.19,0-2.62,2.7-3.66,4.88-4l43.79-6.37,19.62-39.69c.79-1.66,2.27-3.58,4.27-3.58s3.49,1.92,4.27,3.58l19.62,39.69,43.79,6.37c2.09.35,4.88,1.4,4.88,4C381,183.26,379.87,184.74,378.73,185.87Z" ] []
        , Svg.path [ Attributes.d "M270.89,65.23,239.23,96.11l7.5,43.61a11.82,11.82,0,0,1,.09,1.75c0,2.27-1,4.36-3.58,4.36a7.07,7.07,0,0,1-3.49-1L200.59,124.2l-39.16,20.58a7.35,7.35,0,0,1-3.49,1c-2.53,0-3.66-2.09-3.66-4.36a11.94,11.94,0,0,1,.17-1.75l7.5-43.61L130.2,65.23c-1-1.13-2.18-2.62-2.18-4.19,0-2.62,2.7-3.66,4.88-4l43.79-6.37L196.31,11c.79-1.66,2.27-3.58,4.27-3.58s3.49,1.92,4.27,3.58l19.62,39.69L268.27,57c2.09.35,4.88,1.4,4.88,4C273.16,62.62,272,64.1,270.89,65.23Z" ] []
        , Svg.path [ Attributes.d "M270.89,303l-31.66,30.88,7.5,43.61a11.82,11.82,0,0,1,.09,1.75c0,2.27-1,4.36-3.58,4.36a7.07,7.07,0,0,1-3.49-1L200.59,362l-39.16,20.58a7.35,7.35,0,0,1-3.49,1c-2.53,0-3.66-2.09-3.66-4.36a11.94,11.94,0,0,1,.17-1.75l7.5-43.61L130.2,303c-1-1.13-2.18-2.62-2.18-4.19,0-2.62,2.7-3.66,4.88-4l43.79-6.37,19.62-39.69c.79-1.66,2.27-3.58,4.27-3.58s3.49,1.92,4.27,3.58l19.62,39.69,43.79,6.37c2.09.35,4.88,1.4,4.88,4C273.16,300.38,272,301.87,270.89,303Z" ] []
        ]
        |> Nri.Ui.Svg.V1.fromHtml