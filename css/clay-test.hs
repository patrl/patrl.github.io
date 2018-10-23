{-# LANGUAGE OverloadedStrings #-}

import           Clay                    hiding ( map )
import qualified Clay.Media                    as Mq
import           Prelude                 hiding ( rem, div, span )

main :: IO ()
main = putCss $ do
  importUrl "tachyons.css"
  fontFace $ do
    fontStyle normal
    fontWeight $ weight 400
    fontFamily ["IBM Plex Mono"] []
    fontFaceSrc [ FontFaceSrcLocal "/fonts/IBMPlexMono-Regular.woff2" ]
  fontFace $ do
    fontStyle italic 
    fontWeight $ weight 400
    fontFamily ["IBM Plex Mono"] []
    fontFaceSrc [ FontFaceSrcLocal "/fonts/IBMPlexMono-Italic.woff2" ]
  fontFace $ do
    fontStyle normal
    fontWeight $ weight 700
    fontFamily ["IBM Plex Mono"] []
    fontFaceSrc [ FontFaceSrcLocal "/fonts/IBMPlexMono-Bold.woff2" ]
  fontFace $ do
    fontStyle italic
    fontWeight $ weight 700
    fontFamily ["IBM Plex Mono"] []
    fontFaceSrc [ FontFaceSrcLocal "/fonts/IBMPlexMono-BoldItalic" ]
  ol ? ul ? do
    _lhCopy
    paddingLeft $ unitless 0
    listStylePosition inside
  dl ? _lhCopy
  div ? do
    ".sourceCode" ? _measureWide
  table ? overflow auto
  p |+ p ? textIndent (indent $ em 1)
  p ? do
    a <? _link
  blockquote ? p ? textIndent (indent . em $ negate 0.5)
  ".post-title" ? do
    _ns _f1
    _f2
  code ? _plexMono
  a ? do
    ".sourceLine" ? do
      _lhTitle
      span <? display inlineBlock
  ".summary" ? h1 ? h2 ? h3 ? do
    _lhTitle
    _measureWide
    _ttu

-- -- tachyons type scale module in clay
-- _fH, _fSubH, _f1, _f2, _f3, _f4, _f5, _f6, _f7 :: Css
-- [_fH, _fSubH, _f1, _f2, _f3, _f4, _f5, _f6, _f7] =
--   map (fontSize . rem) [6.0, 5.0, 3.0, 2.25, 1.5, 1.25, 1.0, 0.875, 0.75]

-- -- tachyons breakpoints
-- _ns, _m, _l :: Css -> Css
-- [_ns, _m, _l] = map
--   (query Mq.screen)
--   [ [Mq.minWidth $ em 30]
--   , [Mq.minWidth $ em 30, Mq.maxWidth $ em 60]
--   , [Mq.minWidth $ em 60]
--   ]

-- _measure, _measureWide, _measureNarrow :: Css
-- [_measure, _measureWide, _measureNarrow] = map (maxWidth . em) [30, 34, 20]

-- _lhCopy, _lhTitle, _lhSolid :: Css
-- [_lhCopy, _lhTitle, _lhSolid] =
--   map (lineHeight . unitless) [1.5, 1.25, 1.0]

-- _plexMono :: Css
-- _plexMono = fontFamily
--   ["IBM Plex Mono", "Menlo", "DejaVu Sans Mono", "Bitstream Vera Sans Mono"]
--   [monospace]

-- _ttu :: Css
-- _ttu = textTransform uppercase

-- _link :: Css
-- _link = textDecoration none