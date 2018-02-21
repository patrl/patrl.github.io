--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Control.Monad (liftM)
import           Data.Monoid (mappend)
import           Hakyll
import           Text.Pandoc.Options

--------------------------------------------------------------------------------
main :: IO ()
main = hakyllWith config $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler
  --
  -- don't need this since switching to keybase
    -- match "documents/*" $ do
    --     route   idRoute
    --     compile copyFileCompiler

    match "keybase.txt" $ do
        route   idRoute
        compile copyFileCompiler

    -- match "js/*" $ do
    --   route idRoute
    --   compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "node_modules/tachyons/css/tachyons.min.css" $ do
        route $ customRoute (const "css/tachyons.min.css")
        compile copyFileCompiler

    -- match "node_modules/jquery/dist/jquery.slim.min.js" $ do
    --     route $ customRoute (const "js/jquery.slim.min.js")
    --     compile copyFileCompiler

    match "node_modules/gradients/gradients.min.css" $ do
        route $ customRoute (const "css/gradients.min.css")
        compile copyFileCompiler

    match "*.md" $ do
        route   $ setExtension "html"
        compile $ pandocBiblioCompiler "csl/unified-style-linguistics.csl" "bib/myWork.bib"
          >>= loadAndApplyTemplate "templates/default.html" defaultContext
          >>= relativizeUrls

    match "posts/*" $ do
        route $ setExtension "html"
        compile $ pandocBiblioCompiler "csl/unified-style-linguistics.csl" "bib/myWork.bib"
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls

    match "drafts/*" $ do
        route $ setExtension "html"
        compile $ pandocBiblioCompiler "csl/unified-style-linguistics.csl" "bib/myWork.bib"
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls

    match "bib/*" $ compile biblioCompiler

    match "csl/*" $ compile cslCompiler

    create ["blog.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Pluralia Tantrum"            `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

-- bibtexCompiler :: String -> String -> Compiler (Item String)
-- bibtexCompiler cslFileName bibFileName = do
--     csl <- load $ fromFilePath cslFileName
--     bib <- load $ fromFilePath bibFileName
--     liftM writePandoc
--         (getResourceBody >>= readPandocBiblio def csl bib)

config :: Configuration
config = defaultConfiguration
    { deployCommand = "./deploy.sh" }
