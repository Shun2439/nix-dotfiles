;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Shun2439"
      user-mail-address "shun2439@duck.com")

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
(setq doom-font (font-spec :family "JetBrains Mono" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'Mx describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font'
;; to refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

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

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Org journal with GPG encryption
(after! org-journal
  (setq org-journal-dir "~/org/journal/"
        org-journal-file-format "%Y%m%d.org"
        org-journal-enable-agenda-integration t
        org-journal-encrypt-journal t
        epa-file-select-keys 'silent))

;; Org roam configuration
(after! org-roam
  (setq org-roam-directory "~/org/roam/"
        org-roam-db-location "~/.local/share/roam.db"))

;; Custom settings
(setq global-auto-revert-mode t
      auto-revert-avoid-polling t
      auto-revert-interval 5
      auto-revert-check-vc-info t)

;; Whitespace cleanup
(setq whitespace-style '(face tabs spaces-tail trailing space-before-tab newline indentation empty space-after-tab space-mark tab-mark newline-mark)
      whitespace-display-mappings '((space-mark 32 [183] [46])
                                    (newline-mark 10 [182 10])
                                    (tab-mark 9 [187 9] [92 9])))

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
