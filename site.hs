--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
-- import           Control.Monad (liftM)
import           Data.Monoid (mappend)
import           Hakyll
import           Text.Pandoc.Options
import           Text.Pandoc.SideNote
import           Text.Pandoc.Definition
import qualified Data.Set as S

--------------------------------------------------------------------------------
main :: IO ()
main = do
  hakyllWith config $ do

    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "keybase.txt" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "et-book/*/*" $ do
      route idRoute
      compile copyFileCompiler

    match "node_modules/tachyons/css/tachyons.min.css" $ do
        route $ customRoute (const "css/tachyons.min.css")
        compile copyFileCompiler

    match "node_modules/gradients/gradients.min.css" $ do
        route $ customRoute (const "css/gradients.min.css")
        compile copyFileCompiler

    match "actl2018.markdown" $ do
      route $ setExtension "html"
      compile $ tufteCompiler "csl/unified-style-linguistics.csl" "bib/actl2018.bib"
        >>= loadAndApplyTemplate "templates/tufte.html" defaultContext
        >>= relativizeUrls

    match "index.markdown" $ do
        route   $ setExtension "html"
        compile $ pandocBiblioCompiler "csl/unified-style-linguistics.csl" "bib/refs.bib"
          >>= loadAndApplyTemplate "templates/default.html" defaultContext
          >>= relativizeUrls

    match "research.markdown" $ do
        route   $ setExtension "html"
        compile $ pandocBiblioCompiler "csl/myBib.csl" "bib/myWork.bib"
          >>= loadAndApplyTemplate "templates/default.html" defaultContext
          >>= relativizeUrls

    match "posts/*" $ do
        route $ setExtension "html"
        compile $ tufteCompiler "csl/unified-style-linguistics.csl" "bib/refs.bib"
            >>= loadAndApplyTemplate "templates/tufte.html" postCtx
            >>= relativizeUrls

    match "drafts/*" $ do
        route $ setExtension "html"
        compile $ pandocBiblioCompiler "csl/unified-style-linguistics.csl" "bib/refs.bib"
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
                >>= loadAndApplyTemplate "templates/tufte.html" archiveCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

config :: Configuration
config = defaultConfiguration
    { deployCommand = "./deploy.sh" }

customHakyllWriterOptions :: WriterOptions
customHakyllWriterOptions = defaultHakyllWriterOptions
    {
      -- writerExtensions = foldr S.insert (writerExtensions defaultHakyllWriterOptions) [ Ext_raw_html, Ext_footnotes ],
      writerSectionDivs = True,
      -- this isn't working
      writerHTMLMathMethod = KaTeX ""
    }
tufteCompiler :: String -> String -> Compiler (Item String)
tufteCompiler cslFileName bibFileName = do
    csl <- load $ fromFilePath cslFileName
    bib <- load $ fromFilePath bibFileName
    getResourceBody
      >>= readPandocBiblio def csl bib
      >>= traverse (return . usingSideNotes)
      >>= return . writePandocWith customHakyllWriterOptions
