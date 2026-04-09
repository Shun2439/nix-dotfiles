;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq fancy-splash-image (concat doom-private-dir "splash.png"))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Shun2439"
      user-mail-address "Shun2439@duck.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font where appropriate
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face to look nicer
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Moralerspace Radon HWNF" :size 16 :weight 'regular)
      doom-unicode-font (font-spec :family "Moralerspace Radon HWNF")
      doom-big-font (font-spec :family "Moralerspace Radon HWNF" :size 20 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Moralerspace Radon HWNF" :size 16))
;;
;; If you or Emacs can't find your font, use 'Mx describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font'
;; to refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; Catppuccin theme configuration
(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'mocha)

;; Use bash internally for better compatibility with Fish shell
(setq shell-file-name (executable-find "bash"))

;; Keep interactive shells in Fish (when available)
(setq-default explicit-shell-file-name (or (getenv "SHELL") explicit-shell-file-name))
(setq-default vterm-shell (or (getenv "SHELL") vterm-shell))

(after! company
  (define-key company-active-map (kbd "C-y") #'company-complete-selection))

;; SKK
(after! skk
  (require 'skk-study))

;; imeの選択をしなくて済む
(setq default-input-method "japanese-skk")

;; Typst export for Org
(after! org
  (require 'ox-typst))

;; Org -> LaTeX: register jlreq class (#+LATEX_CLASS: jlreq-article)
(after! ox-latex
  (setq org-latex-listings t)
  ;; (setq org-latex-listings 'minted)

  (setq org-latex-default-class "jlreq-article")
  ;; (setq org-latex-pdf-process '("latexmk -lualatex -pdflatex='pdflatex -shell-escape' %f"))
  (setq org-latex-pdf-process '("latexmk -pdflua %f"))
  ;; jlreq's actual LaTeX class name is "jlreq"; the Org class name can be
  ;; anything. Add both for convenience.
  (add-to-list 'org-latex-classes
               '("jlreq-article"
                 "\\documentclass[11pt,paper=a4]{jlreq}
[NO-DEFAULT-PACKAGES]
\\usepackage{luatexja}
\\usepackage{luatexja-fontspec}
% \\usepackage{amsmath}
% \\usepackage{newtxtext,newtxmath}
\\usepackage{graphicx}
\\usepackage{hyperref}
% \\usepackage{bm}
\\hypersetup{pdfencoding=auto,colorlinks=true}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (setq org-latex-src-block-backend 'listings)
  ;; jlreq is not compatible with pdfTeX/pdflatex (you'll get epTeX/JY1 font
  ;; errors). Default to LuaLaTeX + latexmk so jlreq exports work out of the box.
  ;; (setq org-latex-compiler "lualatex"
  ;; org-latex-pdf-process
  ;; NOTE: Do NOT pass latexmk's -pdf flag here; -pdf forces pdflatex.
  ;; '("latexmk -lualatex -interaction=nonstopmode -f -output-directory=%o %f"))

  ;; Remove XeLaTeX-only packages when using LuaLaTeX.
  ;; (setq org-latex-default-packages-alist
  ;; (seq-remove
  ;; (lambda (pkg) (and (listp pkg) (string= (nth 1 pkg) "zxjatype")))
  ;; org-latex-default-packages-alist))
  )

;; Minimal, borderless GUI frames (esp. for emacsclient -c)
(defun shun/apply-borderless-frame (&optional frame)
  (let ((f (or frame (selected-frame))))
    (modify-frame-parameters
     f
     '((undecorated . t)
       (internal-border-width . 0)
       (vertical-scroll-bars . nil)
       (menu-bar-lines . 0)
       (tool-bar-lines . 0)))))

(add-to-list 'default-frame-alist '(undecorated . t))
(add-to-list 'default-frame-alist '(internal-border-width . 0))
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))
(add-to-list 'default-frame-alist '(menu-bar-lines . 0))
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))

(add-hook 'after-make-frame-functions #'shun/apply-borderless-frame)
(shun/apply-borderless-frame)

;; Note: querying font size can fail on non-graphic frames; check from GUI frames.

;; Remove dividers between windows (if enabled elsewhere)
(setq window-divider-default-bottom-width 0
      window-divider-default-right-width 0)
(when (fboundp 'window-divider-mode)
  (window-divider-mode -1))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For each line number token, if its width is 2, then
;; the sequence 7,8,9 will be padded with spaces to 7, 8, 9. See the
;; documentation for more details.
;;
;; This also determines which characters are used to draw the line number
;; characters. If you're using a negative integer (absolute value greater than
;; 1), then negative line numbers are enabled. See the documentation for more
;; details.
(setq display-line-numbers-type t)

(setq-default line-spacing 0.2)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Org folding: make TAB cycle subtrees fully (vanilla org-cycle behavior)
(after! org
  (setq org-cycle-max-level nil))

(after! (:and org evil-org)
  (when (fboundp '+org-cycle-only-current-subtree-h)
    (remove-hook 'org-tab-first-hook #'+org-cycle-only-current-subtree-h)))

(use-package! pinentry
  :config
  (pinentry-start))

;; Org journal with GPG encryption
(after! org-journal
  (setq org-journal-dir "~/org/journals/" ;; logseq
        org-journal-file-format "%Y%m%d.org"
        org-journal-file-type 'monthly
        org-journal-enable-agenda-integration t
        org-journal-encrypt-journal t
        ;; epa-file-select-keys 'silent
        ))

(setq epa-file-cache-passphrase-for-symmetric-encryption t)
(setq epa-file-encrypt-to '("shunta.kobayashi24@gmail.com"))
(setq epa-pinentry-mode 'loopback)
(setq epg-pinentry-mode 'loopback)

;; Org roam configuration
(after! org-roam
  (setq org-roam-directory "~/org/roam/"
        ;; org-roam-db-location "~/.local/share/roam.db"
        ))

;; Custom settings
(setq global-auto-revert-mode t
      auto-revert-avoid-polling t
      auto-revert-interval 5
      auto-revert-check-vc-info t)

(after! org
  (setq org-todo-keywords
        '((sequence "TODO(t)" "SOMEDAY(s)" "WAITING(w)" "|" "DONE(d)")))

  ;; (setq org-log-done 'time)
  (setq org-log-done 'note)
  (setq org-log-into-drawer t)

  (setq org-agenda-files
        (seq-filter
         (lambda (file)
           (not (or (string-match-p "/org-roam\\.bak/" file)
                    (string-match-p "/_archive/" file)
                    (string-match-p "/bak/" file))))
         (directory-files-recursively "~/org/" "\\.org$"))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   ;; (prolog . t)
   (C . t)
   (ruby . t)
   (octave . t)
   (python . t)
   (js . t)
   (java . t)
   ;; (dart . t)
   (haskell . t)
   (shell . t)
   (go . t)
   ))

;; Whitespace cleanup
(after! whitespace
  (setq whitespace-style '(face tabs spaces-tail trailing space-before-tab newline indentation empty space-after-tab tab-mark newline-mark)
        whitespace-display-mappings '((newline-mark 10 [182 10])
                                      (tab-mark 9 [187 9] [92 9]))))

;; Enable whitespace mode globally
(global-whitespace-mode 1)

;; Projectile settings
(setq projectile-project-search-path '("~/projects/" "~/work/"))

;; LSP settings
(setq lsp-headerline-breadcrumb-enable t
      lsp-lens-enable t
      lsp-signature-auto-activate nil
      lsp-signature-render-documentation t
      lsp-ui-doc-enable t
      lsp-ui-doc-position 'bottom
      lsp-ui-doc-include-signature t
      lsp-ui-sideline-enable nil
      lsp-ui-sideline-show-diagnostics nil
      lsp-ui-sideline-show-hover nil
      lsp-ui-sideline-show-code-actions nil)

(use-package! org-drill
  :config
  (setq org-drill-scope 'directory) ; 現在のディレクトリ内の全ファイルから出題
  ;; 必要に応じて追加設定
  )

(use-package! auto-sudoedit
  :config
  (auto-sudoedit-mode 1))

(use-package! beacon
  :config
  (beacon-mode 1))

(use-package! nyan-mode
  :config
  (nyan-mode 1)
  (setq nyan-animate-nyancat t))

(use-package! org-modern
  :hook (org-mode . org-modern-mode))
