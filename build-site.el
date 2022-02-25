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

;; Load the publishing system
(require 'ox-publish)

(setq org-html-head (org-file-contents "./content/html/head.html"))
(setq org-html-preamble (org-file-contents "./content/html/preamble.html"))

;; Define the publishing project
(setq org-publish-project-alist
      '(("patrickdelliott.com"
	     :recursive t
	     :base-directory "./content/"
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
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|eot\\|svg\\|ttf\\|woff"
	 :publishing-directory "./public/"
	 :recursive t
	 :publishing-function org-publish-attachment)
	("files"
	 :base-directory "./content/files/"
	 :base-extension "txt"
	 :publishing-directory "./public/"
	 :recursive nil
	 :publishing-function org-publish-attachment)
	)
      )


;; Generate the site output
(org-publish-all t)

(message "Build complete!")
