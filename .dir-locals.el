;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((haskell-mode
  (dante-repl-command-line
   "nix-shell" "--run" "cabal repl --builddir=dist/dante")))
