{-# LANGUAGE OverloadedStrings #-}

module Main (main) where
import GHC.Generics
import Data.Aeson
import Data.Text
import System.FilePath
import qualified Data.Text as T
import qualified Data.ByteString.Lazy as B

configFile :: FilePath
configFile = "appimages.json"

data App = App {
  name :: Text,
  url :: Text
} deriving (Generic, Show)

getJSON :: IO B.ByteString
getJSON = B.readFile configFile

instance FromJSON App
instance ToJSON App

toLatestURL :: Text -> Text
toLatestURL str = T.concat [start, middle, end]
  where start = "https://api.github.com/repos/"
        end = "/releases/latest"
        middle = T.dropWhileEnd (== '/') $ T.replace (T.pack "https://github.com/") (T.pack "") str

main :: IO ()
main = do
  jsonData <- (eitherDecode <$> getJSON) :: IO (Either String [App])
  case jsonData of
    Left err -> putStrLn err
    Right ps -> print $ toLatestURL (url (ps !! 0))

-- https://api.github.com/repos/imputnet/helium-linux/releases/latest
