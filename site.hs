--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}

import Data.Maybe (fromMaybe)
import Data.Monoid (mappend)
import Hakyll

--------------------------------------------------------------------------------
config :: Configuration
config =
  defaultConfiguration
    { destinationDirectory = "docs"
    }

main :: IO ()
main = hakyllWith config $ do
  match "css/*" $ do
    route idRoute
    compile compressCssCompiler

  match "logs/*" $ do
    route $ setExtension "html"
    compile $
      pandocCompiler
        >>= loadAndApplyTemplate "templates/log.html" logCtx
        >>= loadAndApplyTemplate "templates/default.html" logCtx
        >>= relativizeUrls

  match "index.html" $ do
    route idRoute
    compile $ do
      posts <- recentFirst =<< loadAll "logs/*"
      let indexCtx =
            listField "logs" logCtx (return posts)
              `mappend` defaultContext

      getResourceBody
        >>= applyAsTemplate indexCtx
        >>= loadAndApplyTemplate "templates/default.html" indexCtx
        >>= relativizeUrls

  match "templates/*" $ compile templateBodyCompiler

--------------------------------------------------------------------------------
locationContext :: Context a
locationContext = field "location" $ \item -> do
  metadata <- getMetadata (itemIdentifier item)
  return $ fromMaybe "N/A" $ lookupString "location" metadata

weatherContext :: Context a
weatherContext = field "weather" $ \item -> do
  metadata <- getMetadata (itemIdentifier item)
  return $ fromMaybe "Clear" $ lookupString "weather" metadata

logCtx :: Context String
logCtx =
  dateField "date" "%B %e, %Y"
    `mappend` locationContext
    `mappend` weatherContext
    `mappend` defaultContext
