{-# LANGUAGE OverloadedStrings #-}

import           Clay                    hiding ( map )
import Clay.Selector ( selectorFromText )
import qualified Clay.Media                    as Mq
import           Prelude                 hiding ( rem
                                                , div
                                                , span
                                                )
import qualified Data.Text as T
import Control.Applicative

main :: IO ()
main =
  putCss $ do
    ".f-headine" ? ".f-6" ? fH
    ".f-headline-ns" ? ".f-6-ns" ? ns fH
    ".f-subheadline" ? ".f-5" ? fSubH
    ".f-subheadline-ns" ? ".f-5-ns" ? ns f1
    ".f1" ? f1
    ".f1-ns" ? ns f1
    ".f2" ? f2
    ".f2-ns" ? ns f2
    ".f3" ? f3
    ".f3-ns" ? ns f3
    ".f4" ? f4
    ".f4-ns" ? ns f4
    ".f5" ? f5
    ".f5-ns" ? ns f5
    ".f6" ? f6
    ".f6-ns" ? ns f6
    ".f7" ? f7

-- >>> :t ("f" ? fH)
-- <interactive>:1:6: warning: [-Wdeferred-out-of-scope-variables]
--     Variable not in scope: (?) :: [Char] -> t0 -> t
-- <interactive>:1:8: warning: [-Wdeferred-out-of-scope-variables]
--     Variable not in scope: fH
-- ("f" ? fH) :: t

-- >>> mapM_ putCss $ (?) <$> (ZipList fClasses) <*> (ZipList fCss)
-- .f1
-- {
--   font-size : 3rem;
-- }
-- /* Generated with Clay, http://fvisser.nl/clay */
-- .f2
-- {
--   font-size : 2.25rem;
-- }
-- /* Generated with Clay, http://fvisser.nl/clay */
-- .f3
-- {
--   font-size : 1.5rem;
-- }
-- /* Generated with Clay, http://fvisser.nl/clay */
-- .f4
-- {
--   font-size : 1.25rem;
-- }
-- /* Generated with Clay, http://fvisser.nl/clay */
-- .f5
-- {
--   font-size : 1rem;
-- }
-- /* Generated with Clay, http://fvisser.nl/clay */
-- .f6
-- {
--   font-size : 0.875rem;
-- }
-- /* Generated with Clay, http://fvisser.nl/clay */
-- 
-- >>> mapM_ putCss $ (?) <$> (ZipList $ map ((append "-ns")) (fClasses)) <*> (ZipList $ map ns fCss)
-- <interactive>:533:42: warning: [-Wdeferred-out-of-scope-variables]
--     • Variable not in scope: append :: [Char] -> Selector -> Selector
--     • Perhaps you meant ‘mappend’ (imported from Prelude)
-- *** Exception: <interactive>:533:42: error:
--     • Variable not in scope: append :: [Char] -> Selector -> Selector
--     • Perhaps you meant ‘mappend’ (imported from Prelude)
-- (deferred type error)


fClasses :: [Selector]
fClasses = [".f1",".f2",".f3",".f4",".f5",".f6"]

fCss :: [Css]
fCss = [f1,f2,f3,f4,f5,f6]

-- -- tachyons type scale module in clay
fH, fSubH, f1, f2, f3, f4, f5, f6, f7 :: Css
[fH, fSubH, f1, f2, f3, f4, f5, f6, f7] =
  map (fontSize . rem) [6.0, 5.0, 3.0, 2.25, 1.5, 1.25, 1.0, 0.875, 0.75]

-- tachyons breakpoints
ns, m, l :: Css -> Css
[ns, m, l] = map
  (query Mq.screen)
  [ [Mq.minWidth $ em 30]
  , [Mq.minWidth $ em 30, Mq.maxWidth $ em 60]
  , [Mq.minWidth $ em 60]
  ]

measure, measureWide, measureNarrow :: Css
[measure, measureWide, measureNarrow] = map (maxWidth . em) [30, 34, 20]

lhCopy, lhTitle, lhSolid :: Css
[lhCopy, lhTitle, lhSolid] = map (lineHeight . unitless) [1.5, 1.25, 1.0]

plexMono :: Css
plexMono = fontFamily
  ["IBM Plex Mono", "Menlo", "DejaVu Sans Mono", "Bitstream Vera Sans Mono"]
  [monospace]

ttu :: Css
ttu = textTransform uppercase

link :: Css
link = textDecoration none
