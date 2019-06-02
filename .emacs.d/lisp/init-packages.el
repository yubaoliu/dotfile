  
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

(require 'cl);common lisp lib

;add whatever package you want here
(defvar yubao/packages '(
                         markdown-mode
                         magit
                         sr-speedbar
                         ztree
                         zygospore
                         helm-gtags
                         helm
                         yasnippet
                         ws-butler
                         use-package
                         undo-tree
                         iedit
                         counsel-projectile
                         anzu
                         ggtags
                         evil
                         flycheck
                         helm-ag
                         iedit
                         expand-region
                         web-mode
                         reveal-in-osx-finder
                         nodejs-repl;need install nodejs in the system
                         js2-mode
                         js2-refactor
                         smartparens
                         counsel
                         swiper
                         hungry-delete
                         monokai-theme
                         company
                         common-lisp-snippets
                         company-dict
                         company-go
                         company-php
                         company-shell
                         company-web
                         ctags-update
                         web-mode
                         iedit
                         google-translate
                         google-maps
                         flymake-json
                         flymake-cursor
                         eide
                         ecb
			 evil-tabs
			 evil-search-highlight-persist
			 color-theme
			 window-number
			 org-ref
			 org-preview-html
			 org2blog
			 org2web
			 latex-math-preview
			 latex-preview-pane
			 auctex
			 org-review
			 auto-compile
			 auctex-lua
			 auctex-latexmk
			 org-plus-contrib
			 org-pdfview
                         )
  "Default packages")
(setq package-selected-packages  yubao/packages) ;let package-autoremove know my customized packages, ohterwise package-autoremove will delete my customized packages

(defun yubao/packages-installed-p ()
  (loop for pkg in yubao/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (yubao/packages-installed-p)
  (message "%s" "Refreshing package database .... ")
  (package-refresh-contents)
  (dolist (pkg yubao/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;;Another with to install packages seperately, however this cannot be detected by package-autoremove
;;therefore, this function only used for very important packages
(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))


(defun yubao/install-package(pkg)
  (interactive "pkg")
  (unless (package-installed-p pkg)
    (package-install pkg)
    )
  )

(provide 'init-packages)
