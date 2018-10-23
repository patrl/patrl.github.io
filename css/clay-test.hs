{-# LANGUAGE OverloadedStrings #-}

import           Clay                    hiding ( map )
import qualified Clay.Media                    as Mq
import           Prelude                 hiding ( rem )
import           Control.Monad                  ( liftM )

main = putCss $ do

  body ? do
    fontFace $ do
      fontStyle normal
      fontWeight $ weight 400
      fontFamily ["IBM Plex Mono"] []
      fontFaceSrc [ FontFaceSrcLocal "/fonts/IBMPlexMono-Regular.woff2" ]
  ol ? ul ? do
    paddingLeft (0 :: Size LengthUnit)
    listStylePosition inside
  table ? overflow auto
  p |+ p ? textIndent (indent $ em 1)
  blockquote ? p ? textIndent (indent . em $ negate 0.5)
  ".post-title" ? do
    _ns _f1
    _f2

-- tachyons type scale module in clay
_fH, _fSubH, _f1, _f2, _f3, _f4, _f5, _f6, _f7 :: Css
[_fH, _fSubH, _f1, _f2, _f3, _f4, _f5, _f6, _f7] =
  map (fontSize . rem) [6.0, 5.0, 3.0, 2.25, 1.5, 1.25, 1.0, 0.875, 0.75]

-- tachyons breakpoints
_ns, _m, _l :: Css -> Css
[_ns, _m, _l] = map
  (query Mq.screen)
  [ [Mq.minWidth $ em 30]
  , [Mq.minWidth $ em 30, Mq.maxWidth $ em 60]
  , [Mq.minWidth $ em 60]
  ]

_measure, _measureWide, _measureNarrow :: Css
[_measure, _measureWide, _measureNarrow] = map (maxWidth . em) [30, 34, 20]

_lhCopy, _lhTitle, _lhSolid :: Css
[_lhCopy, _lhTitle, _lhSolid] =
  map lineHeight ([1.5, 1.25, 1.0] :: [Size LengthUnit])

_plexMono :: Css
_plexMono = fontFamily
  ["IBM Plex Mono", "Menlo", "DejaVu Sans Mono", "Bitstream Vera Sans Mono"]
  [monospace]

 --   @font-face {
 --     font-family: 'IBM Plex Mono';
 --     font-style: normal;
 --     font-weight: 400;
 --     src: url("/fonts/IBMPlexMono-Regular.woff2") format("woff2"); }

 -- @font-face {
 --     font-family: 'IBM Plex Mono';
 --     font-style: normal;
 --     font-weight: 700;
 --     src: url("/fonts/IBMPlexMono-Bold.woff2") format("woff2"); }

 -- @font-face {
 --     font-family: 'IBM Plex Mono';
 --     font-style: italic;
 --     font-weight: 400;
 --     src: url("/fonts/IBMPlexMono-Italic.woff2") format("woff2"); }

 -- @font-face {
 --     font-family: 'IBM Plex Mono';
 --     font-style: italic;
 --     font-weight: 700;
 --     src: url("/fonts/IBMPlexMono-BoldItalic.woff2") format("woff2"); }

_plexMonoFont :: Css
_plexMonoFont = fontFace $ do
  fontStyle normal
  fontWeight $ weight 400
  fontFamily ["IBM Plex Mono"] []
  fontFaceSrc [ FontFaceSrcLocal "/fonts/IBMPlexMono-Regular.woff2" ]