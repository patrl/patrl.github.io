{-# LANGUAGE OverloadedStrings     #-}

module Main where

siteMeta :: SiteMeta
siteMeta = SiteMeta { siteAuthor = "Patrick D, Elliott"
                    , baseUrl = "https://patrickdelliott.com"
                    , siteTitle = "Patrick D. Elliott"
                    , twitterHandle = Just "patrickdelliott"
                    , githubUser = Just "patrl" }

data SiteMeta = SiteMeta { siteAuthor :: String
                         , baseUrl :: String
                         , siteTitle :: String
                         , twitterHandle :: Maybe String
                         , githubUser :: Maybe String }

outputFolder :: FilePath
outputFolder = "./docs"

main :: IO ()
main = do
  print ("hello haskell!" :: String)
