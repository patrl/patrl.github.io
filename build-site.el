;; load emacs package manager
(require 'package)

;; install packages in a local directory
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(setq make-backup-files nil) ;; stop emacs from creating backup files

;; Install dependencies (for formatting code blocks)
(package-install 'htmlize)
(package-install 'ox-gemini)

;; Load the publishing system
(require 'ox-publish)
(require 'ox-gemini)

;; Gemini export tweaks
(defconst my/gemini-nav
  (concat "=> / Home\n"
          "=> /research/papers.gmi Papers\n"
          "=> /research/slides-handouts.gmi Talks\n"
          "=> /teaching.gmi Teaching\n"
          "=> /resources.gmi Resources\n")
  "Gemtext counterpart of content/html/preamble.html.")

(defun my/gemini-strip-emphasis (text _backend _info)
  "Gemtext has no inline markup, so drop the /.../ and *...* markers."
  (replace-regexp-in-string "\\`[/*]\\(\\(?:.\\|\n\\)*?\\)[/*]\\([ \t]*\\)\\'" "\\1\\2" text))

(defun my/gemini-final-output (text _backend _info)
  "Fix local links, insert the nav after the title, and tidy whitespace."
  (let* ((text (replace-regexp-in-string "^=> file:" "=> " text))
         (text (replace-regexp-in-string "[ \t]+$" "" text))
         (text (replace-regexp-in-string "\n\\{3,\\}" "\n\n" text)))
    (if (string-match "\\`# .*\n\n" text)
        (concat (match-string 0 text) my/gemini-nav "\n" (substring text (match-end 0)))
      (concat my/gemini-nav "\n" text))))

(setq org-html-head (org-file-contents "./content/html/head.html"))
(setq org-html-preamble (org-file-contents "./content/html/preamble.html"))

;; Define the publishing project
(setq org-publish-project-alist
      '(("patrickdelliott.com"
	     :recursive t
	     :base-directory "./content/"
	     :exclude "test/"
	     :publishing-directory "./public/"
	     :publishing-function org-html-publish-to-html
	     :with-author t
	     :with-creator nil
	     :with-toc nil
	     :section-numbers nil
	     :time-stamp-file t
	     :html-container "section"
	     :html-divs ((preamble "nav" "preamble")
			 (content "main" "content") ;; necessary to get the right styling
			 (postamble "footer" "postamble"))
	     :html-doctype "html5"
	     :headline-levels 2
	     :html-html5-fancy t
	     :html-head-include-default-style nil
	     :html-head-include-scripts nil
	     :html-validation-link nil
	     :html-mathjax-template ""
	     ;; :html-preamble nil
	     :html-postamble nil
	     :auto-sitemap t
	     :sitemap-filename "sitemap.org"
	     )

	("images"
	 :base-directory "./content/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|webp\\|pdf\\|eot\\|svg\\|ttf\\|woff\\|txt"
	 :include ("CNAME")
	 :publishing-directory "./public/"
	 :recursive t
	 :publishing-function org-publish-attachment)

	;; Gemini capsule, built from the same sources
	("gemini"
	 :recursive t
	 :base-directory "./content/"
	 :exclude "test/\\|sitemap\\.org"
	 :publishing-directory "./public-gemini/"
	 :publishing-function org-gemini-publish-to-gemini
	 :with-author nil
	 :with-toc nil
	 :section-numbers nil
	 :filter-italic (my/gemini-strip-emphasis)
	 :filter-bold (my/gemini-strip-emphasis)
	 :filter-final-output (my/gemini-final-output))

	("gemini-assets"
	 :base-directory "./content/"
	 :base-extension "png\\|jpg\\|gif\\|webp\\|pdf\\|txt"
	 :publishing-directory "./public-gemini/"
	 :recursive t
	 :publishing-function org-publish-attachment)))


;; Generate the site output
(org-publish-all t)

(message "Build complete!")
