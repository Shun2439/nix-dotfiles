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
