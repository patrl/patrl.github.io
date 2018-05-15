--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Control.Monad (liftM)
import           Data.Monoid (mappend)
import           Hakyll
-- import qualified Data.Set as S
import           Text.Pandoc.Options
import           Text.Pandoc.SideNote
-- import           Hakyll.Contrib.LaTeX
-- import           Image.LaTeX.Render
-- import           Image.LaTeX.Render.Pandoc (defaultPandocFormulaOptions, formulaOptions)
import           Text.Pandoc.Definition

--------------------------------------------------------------------------------
main :: IO ()
main = do
  -- renderFormulae <- initFormulaCompilerDataURI 1000 myEnv

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

    -- match "formulaTest.markdown" $ do
    --    route $ setExtension "html"
    --    compile $ unifiedCompiler "csl/unified-style-linguistics.csl" "bib/refs.bib" (renderFormulae customPandocFormulaOptionsBlack)
    --      >>= loadAndApplyTemplate "templates/tufte.html" defaultContext
    --      >>= relativizeUrls


    -- match "tufteTest.markdown" $ do
    --   route $ setExtension "html"
    --   compile $ unifiedCompiler "csl/unified-style-linguistics.csl" "bib/refs.bib" (renderFormulae customPandocFormulaOptionsBlack)
    --     >>= loadAndApplyTemplate "templates/tufte.html" defaultContext
    --     >>= relativizeUrls

    -- match "actl2018.markdown" $ do
    --   route $ setExtension "html"
    --   compile $ unifiedCompiler "csl/unified-style-linguistics.csl" "bib/actl2018.bib" (renderFormulae customPandocFormulaOptionsBlack)
    --     >>= loadAndApplyTemplate "templates/tufte.html" defaultContext
    --     >>= relativizeUrls

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
        compile $ pandocBiblioCompiler "csl/unified-style-linguistics.csl" "bib/refs.bib"
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

pandocTufteCompiler :: Compiler (Item String)
pandocTufteCompiler = pandocCompilerWithTransform
    defaultHakyllReaderOptions
    customHakyllWriterOptions
    usingSideNotes

customHakyllWriterOptions :: WriterOptions
customHakyllWriterOptions = defaultHakyllWriterOptions
    {
      writerExtensions = enableExtension Ext_raw_html pandocExtensions,
      writerSectionDivs = True
      -- writerHtml5 = True
      -- this isn't working
      -- writerHTMLMathMethod = KaTeX "" ""
    }

-- myPreambleWhite = "\\usepackage{stmaryrd}\\usepackage{amssymb}\\usepackage{color}\\color{white}"

-- myPreambleBlack = "\\usepackage{stmaryrd}\\usepackage{amssymb}\\usepackage{color}\\color{black}"

-- customPandocFormulaOptionsWhite = defaultPandocFormulaOptions
--   { formulaOptions = \x -> case x of
--       InlineMath -> math { preamble = myPreambleWhite }
--       DisplayMath -> displaymath { preamble = myPreambleWhite }
--   }

-- customPandocFormulaOptionsBlack = defaultPandocFormulaOptions
--   { formulaOptions = \x -> case x of
--       InlineMath -> math { preamble = myPreambleBlack }
--       DisplayMath -> displaymath { preamble = myPreambleBlack }
--   }

-- myEnv :: EnvironmentOptions
-- myEnv = EnvironmentOptions "latex" "dvips" "convert" [ ] [] [] (UseSystemTempDir "latex-eqn-temp") "working"

-- unifiedCompiler :: String -> String -> (Pandoc -> Compiler Pandoc ) -> Compiler (Item String)
-- unifiedCompiler cslFileName bibFileName renderFunction = do
--     csl <- load $ fromFilePath cslFileName
--     bib <- load $ fromFilePath bibFileName
--     getResourceBody
--       >>= readPandocBiblio def csl bib
--       >>= traverse ( renderFunction . usingSideNotes )
--       >>= return . writePandocWith customHakyllWriterOptions
