--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings, NoPatternSynonyms #-}

import           Data.Monoid                    ( mappend )
import           Hakyll
import           Text.Pandoc.Options
import           Text.Pandoc.SideNote           ( usingSideNotes )
-- import           Control.Monad                  ( liftM )
import           Hakyll.Web.Sass                ( sassCompiler )

--------------------------------------------------------------------------------
main :: IO ()
main =
  hakyllWith config $ do

  -- static files
    match ("images/*" .||. "keybase.txt") $ do
      route idRoute
      compile copyFileCompiler

    match "node_modules/@ibm/plex/IBM-Plex-Sans/fonts/complete/woff2/*" $ do
      route $ gsubRoute
        "node_modules/@ibm/plex/IBM-Plex-Sans/fonts/complete/woff2"
        (const "fonts")
      compile copyFileCompiler

    match "node_modules/@ibm/plex/IBM-Plex-Serif/fonts/complete/woff2/*" $ do
      route $ gsubRoute
        "node_modules/@ibm/plex/IBM-Plex-Serif/fonts/complete/woff2"
        (const "fonts")
      compile copyFileCompiler

    match "node_modules/@ibm/plex/IBM-Plex-Mono/fonts/complete/woff2/*" $ do
      route $ gsubRoute
        "node_modules/@ibm/plex/IBM-Plex-Mono/fonts/complete/woff2"
        (const "fonts")
      compile copyFileCompiler

    match "css/*.css" $ do
      route idRoute
      compile compressCssCompiler

    match "css/patrickdelliott.scss" $ do
      route $ setExtension "css"
      let compressCssItem = fmap compressCss
      compile (compressCssItem <$> sassCompiler)

    match "org-test.org" $ do
      route $ setExtension "html"
      compile
        $   myPandocBiblioCompiler "csl/unified-style-linguistics.csl"
                                   "bib/refs.bib"
        >>= loadAndApplyTemplate "templates/post.html"    postCtx
        >>= loadAndApplyTemplate "templates/default.html" defaultContext
        >>= relativizeUrls

    match "teaching/*" $ do
      route $ setExtension "html"
      compile
        $   myPandocCompiler
        >>= loadAndApplyTemplate "templates/post.html" postCtx
        >>= loadAndApplyTemplate "templates/default.html" defaultContext
        >>= relativizeUrls

    match "index.org" $ do
      route $ setExtension "html"
      compile
        $   myPandocCompiler
        >>= loadAndApplyTemplate "templates/default.html" defaultContext
        >>= relativizeUrls

    match "about-site.org" $ do
      route $ setExtension "html"
      compile
        $   myPandocCompiler
        >>= loadAndApplyTemplate "templates/default.html" defaultContext
        >>= relativizeUrls

    match "research.markdown" $ do
      route $ setExtension "html"
      compile
        $   myPandocBiblioCompiler "csl/myBib.csl" "bib/myWork.bib"
        >>= loadAndApplyTemplate "templates/default.html" defaultContext
        >>= relativizeUrls

    tags <- buildTags "posts/*" (fromCapture "tags/*.html")

    tagsRules tags $ \tag pattern -> do
        let title = "Posts tagged \"" ++ tag ++ "\""
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll pattern
            let ctx = constField "title" title
                      `mappend` listField "posts" postCtx (return posts)
                      `mappend` constField "date"   ""
                      `mappend` defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/tag.html" ctx
                >>= loadAndApplyTemplate "templates/default.html" ctx
                >>= relativizeUrls

    match "posts/*" $ do
      route $ setExtension "html"
      compile
        $   myPandocBiblioCompiler "csl/unified-style-linguistics.csl"
                                   "bib/refs.bib"
        >>= saveSnapshot "content"
        >>= loadAndApplyTemplate "templates/post.html"    (postCtxWithTags tags)
        >>= loadAndApplyTemplate "templates/default.html" defaultContext
        >>= relativizeUrls

    match "drafts/*" $ do
      route $ setExtension "html"
      compile
        $   myPandocBiblioCompiler "csl/unified-style-linguistics.csl"
                                   "bib/refs.bib"
        >>= loadAndApplyTemplate "templates/post.html"    postCtx
        >>= loadAndApplyTemplate "templates/default.html" defaultContext
        >>= relativizeUrls

    create ["atom.xml"] $ do
      route idRoute
      compile $ do
        let feedCtx = postCtxWithTags tags `mappend` bodyField "description"
        posts <- fmap (take 10) . recentFirst =<< loadAllSnapshots "posts/*"
                                                                   "content"
        renderAtom myFeedConfiguration feedCtx posts


    match "bib/*" $ compile biblioCompiler

    match "csl/*" $ compile cslCompiler

    create ["blog.html"] $ do
      route idRoute
      compile $ do
        posts <- recentFirst =<< loadAll "posts/*"
        let archiveCtx =
              listField "posts" (postCtxWithTags tags) (return posts)
                `mappend` constField "author" "Patrick D. Elliott"
                `mappend` constField "title"  "Pluralia Tantrum"
                `mappend` constField "date"   ""
                `mappend` postCtxWithTags tags

        makeItem ""
          >>= loadAndApplyTemplate "node_modules/octicons/build/svg/rss.svg" archiveCtx
          >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
          >>= loadAndApplyTemplate "templates/default.html" archiveCtx
          >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler

    match "node_modules/octicons/build/svg/*" $ compile templateBodyCompiler


--------------------------------------------------------------------------------
--
postCtxWithTags :: Tags -> Context String
postCtxWithTags tags = tagsField "tags" tags `mappend` postCtx

postCtx :: Context String
postCtx = dateField "date" "%B %e, %Y" `mappend` defaultContext

config :: Configuration
config = defaultConfiguration { deployCommand = "./deploy.sh" }

customHakyllWriterOptions :: WriterOptions
customHakyllWriterOptions
  = let defaultExtensions = writerExtensions defaultHakyllWriterOptions
    in
      defaultHakyllWriterOptions
        { writerExtensions     =
          (enableExtension Ext_raw_html . enableExtension Ext_example_lists)
            defaultExtensions
        , writerSectionDivs    = True
        , writerHTMLMathMethod = KaTeX ""
        }

readerOpts :: ReaderOptions
readerOpts = def { readerExtensions = pandocExtensions }

myPandocBiblioCompiler :: String -> String -> Compiler (Item String)
myPandocBiblioCompiler cslFileName bibFileName = do
  csl <- load $ fromFilePath cslFileName
  bib <- load $ fromFilePath bibFileName
  fmap
    (writePandocWith customHakyllWriterOptions)
    (   traverse (return . usingSideNotes)
    =<< readPandocBiblio defaultHakyllReaderOptions csl bib
    =<< getResourceBody
    )

myPandocCompiler :: Compiler (Item String)
myPandocCompiler = pandocCompilerWithTransformM defaultHakyllReaderOptions
                                                customHakyllWriterOptions
                                                (return . usingSideNotes)

myFeedConfiguration :: FeedConfiguration
myFeedConfiguration = FeedConfiguration
  { feedTitle       = "Pluralia Tantrum"
  , feedDescription = "Personal blog of Patrick Elliott"
  , feedAuthorName  = "Patrick Elliott"
  , feedAuthorEmail = "patrick.d.elliott@gmail.com"
  , feedRoot        = "http://patrickdelliott.com"
  }