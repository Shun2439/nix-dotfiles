;;; $DOOMDIR/packages.el -*- lexical-binding: t; -*-

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or apm, do:
                                        ;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation about what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
                                        ;(package! another-package
                                        ;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory, you can tell straight.el where to
;; find it with:
                                        ;(package! this-package
                                        ;  :recipe (:host github :repo "username/repo" :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here:
                                        ;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for overriding by specifying a package override.
                                        ;(package! builtin-package :recipe (:nonrecursive t))

;; For specifying package versions:
                                        ;(package! builtin-package "2021.1.1"
                                        ;  :recipe (:host github :repo "username/repo" :branch "master"))

;; If you use a lot of packages, this can take a *very* long time to evaluate.
;; To speed this up considerably, you can use M-x straight-pull-recipe-and-build
;; to update just this package and see if it helps.

;; Most common packages are included in Doom modules. The modules enabled
;; in config.el provide: magit, projectile, company, flycheck, yasnippet,
;; which-key, evil-mode, LSP support for multiple languages, and org-roam.

;; Additional packages can be added here as needed:
                                        ;(package! some-extra-package)

;; Org mode enhancements
(package! org-journal)

;; Catppuccin theme
(package! catppuccin-theme)

;; Org -> Typst exporter
(package! ox-typst)

(package! org-drill)

(package! pinentry)

(package! auto-sudoedit)

(package! beacon)

(package! nyan-mode)

(package! rainbow-mode)

(package! vue-mode)

(package! org-cliplink)

(package! dimmer)

(package! blamer)

(package! lsp-pyright)

(package! org-re-reveal)

(package! org-books)

;; Org link beautify (thumbnails/previews for links)
(package! org-link-beautify :recipe (:host github :repo "emacsmirror/org-link-beautify"))

;; Dired preview
(package! dired-preview)

;; Org sidebar (tree + item sidebars)
(package! org-sidebar :recipe (:host github :repo "alphapapa/org-sidebar"))
;; Org writing / prettification
(package! org-fragtog :pin "c675563af3f9ab5558cfd5ea460e2a07477b0cfd")
(package! org-modern-indent
  :recipe (:host github :repo "jdtsmith/org-modern-indent")
  :pin "86bd83ee1ad95f123810eb3b116beb543db1960a")
(package! mixed-pitch :pin "519e05f74825abf04b7d2e0e38ec040d013a125a")

;; Icons in dired
(package! nerd-icons-dired :pin "104acd8879528b8115589f35f1bbcbe231ad732f")
