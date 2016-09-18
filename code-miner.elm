import Html exposing (Html, input, button, div, text, br, ul, li)
import Html.Attributes exposing (..)
import Html.App as App
import Regex exposing (contains, regex)
import Html.Events exposing (onInput)

main =
    App.beginnerProgram { model = { filesList = ["FOO", "BAR", "fooo", "foobar"], pattern = "" }
                                  , view = view, update = update }

type Msg = Change String

type alias Files = { filesList : List (String), pattern: String }

update msg model =
    case msg of
        Change newPattern ->
            { model | pattern = newPattern }

view model =
    div []
      [ input [ placeholder "File path/name", onInput Change ] []
      , br [] []
      , ul [] (List.map (\m -> (li [] [ text m ])) (List.filter (\m -> (contains (regex model.pattern) m)) model.filesList))
      ]


