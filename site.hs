--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Control.Monad (liftM)
import           Data.Monoid (mappend)
import           Hakyll
import           Text.Pandoc.Options
import           Text.Pandoc.SideNote
import           Hakyll.Contrib.LaTeX
import           Image.LaTeX.Render
import           Image.LaTeX.Render.Pandoc (defaultPandocFormulaOptions, formulaOptions)
import           Text.Pandoc.Definition

--------------------------------------------------------------------------------
main :: IO ()
main = do
  renderFormulae <- initFormulaCompilerDataURI 1000 myEnv

  hakyllWith config $ do 

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

    match "et-book/*/*" $ do
      route idRoute
      compile copyFileCompiler

    match "node_modules/tachyons/css/tachyons.min.css" $ do
        route $ customRoute (const "css/tachyons.min.css")
        compile copyFileCompiler

    -- match "node_modules/jquery/dist/jquery.slim.min.js" $ do
    --     route $ customRoute (const "js/jquery.slim.min.js")
    --     compile copyFileCompiler

    match "node_modules/gradients/gradients.min.css" $ do
        route $ customRoute (const "css/gradients.min.css")
        compile copyFileCompiler

    match "formulaTest.md" $ do
       route $ setExtension "html"
       compile $ pandocCompilerWithTransformM defaultHakyllReaderOptions defaultHakyllWriterOptions
               $ renderFormulae customPandocFormulaOptions

    match "tufteTest.md" $ do
      route $ setExtension "html"
      compile $ pandocTufteCompiler
        >>= loadAndApplyTemplate "templates/tufte.html" defaultContext
        >>= relativizeUrls

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
      writerSectionDivs = True,
      writerHtml5 = True
    }

myPreamble = "\\usepackage{stmaryrd}\\usepackage{amsmath}\\usepackage{amssymb}"

customPandocFormulaOptions = defaultPandocFormulaOptions
    { formulaOptions = \x -> case x of
        InlineMath -> math { preamble = myPreamble }
        DisplayMath -> displaymath { preamble = myPreamble }
    }

myEnv :: EnvironmentOptions
myEnv = EnvironmentOptions "latex" "dvips" "convert" [] [] [] (UseSystemTempDir "latex-eqn-temp") "working"
