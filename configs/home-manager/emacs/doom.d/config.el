;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; (setq fancy-splash-image (concat doom-private-dir "splash.svg"))

(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-banner)

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
(setq doom-font (font-spec :family "Moralerspace Radon HW" :size 15)
      )
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

;; Spell checking (hunspell; dictionaries are installed by
;; configs/home-manager/emacs/default.nix).
(declare-function ispell-set-spellchecker-params "ispell")
(declare-function ispell-hunspell-add-multi-dic "ispell")
(after! ispell
  ;; Hunspell takes a comma-separated dictionary list for `-d', so English and
  ;; Swedish are checked at the same time.  The combination must be registered
  ;; in `ispell-dictionary-alist' before ispell passes it to hunspell.
  ;; Switch per buffer with `M-x ispell-change-dictionary' (e.g. ko_KR).
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_US,sv_SE")
  (setq ispell-dictionary "en_US,sv_SE"))

(after! company
  (define-key company-active-map (kbd "C-y") #'company-complete-selection))

;; SKK
(map! :i "C-j" nil)
(map! :after evil-org
      :map evil-org-mode-map
      ;; lang/org/configでorg-down-elementに上書きされているのでnilにしておく
      :i "C-j" (cmds! (org-at-table-p) #'org-table-next-row nil)
      )
(after! skk
  (require 'skk-study))

;; imeの選択をしなくて済む
(setq default-input-method "japanese-skk")

;; Typst export for Org
(after! org
  (require 'ox-typst)
  (setq org-adapt-indentation t)
  )

(setq-default org-re-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")

(after! org-re-reveal
  ;; Use a CDN by default (or set to a local directory like "file:///path/to/reveal.js")
  (setq org-re-reveal-theme "black")
  (setq org-re-reveal-transition "slide"))

;; Org -> LaTeX: register jlreq class (#+LATEX_CLASS: jlreq-article)
(after! ox-latex
  (setq org-latex-listings t)
  ;; (setq org-latex-listings 'minted)
  (add-to-list 'org-latex-caption-above 'src-block)
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
% \\usepackage{luatexja-fontspec}
% \\usepackage{amsmath}
% \\usepackage{newtxtext,newtxmath}
\\usepackage{graphicx}
\\usepackage{hyperref}
% \\usepackage{bm} % make math charactors bold?
% \\hypersetup{pdfencoding=auto,colorlinks=true}"
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
       (internal-border-width . 10)
       (vertical-scroll-bars . nil)
       (menu-bar-lines . 0)
       (tool-bar-lines . 0)))))

(add-to-list 'default-frame-alist '(undecorated . t))
(add-to-list 'default-frame-alist '(internal-border-width . 10))
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

;; Org journal
(after! org-journal
  (setq org-journal-dir "~/org/journals/" ;; logseq
        org-journal-file-format "%Y%m%d.org"
        org-journal-file-type 'monthly
        org-journal-enable-agenda-integration t
        org-journal-date-format "%d"
        ;; org-journal-encrypt-journal t
        ;; epa-file-select-keys 'silent
        ))

(setq epa-file-cache-passphrase-for-symmetric-encryption t)
(setq epa-file-encrypt-to '("shunta.kobayashi24@gmail.com"))
(setq epa-pinentry-mode 'loopback)
(setq epg-pinentry-mode 'loopback)

;; Org roam configuration
;; Doom sets `find-file-visit-truename' to t, so the org-roam db stores resolved
;; (symlink-free) paths.  `org-roam-directory' must be resolved as well,
;; otherwise `org-roam-list-files' returns "~/org/roam/..." while the db holds
;; "~/ghq/gitlab.com/.../roam/...", making every file look modified on sync.
(after! org-roam
  (setq org-roam-directory (file-truename "~/org/roam/")
        org-roam-db-location (expand-file-name "~/.config/emacs/org-roam.db")
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

  (setq org-startup-folded 'content)

  (setq org-agenda-files
        (seq-filter
         (lambda (file)
           (not (or (string-match-p "/org-roam\\.bak/" file)
                    (string-match-p "/_archive/" file)
                    (string-match-p "/bak/" file))))
         (directory-files-recursively "~/org/" "\\.org$"))))

(after! org-books
  (setq org-books-file "~/org/books.org"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (C . t)
   (shell . t)
   (haskell . t)
   (java . t)
   (lisp . t)
   (maxima . t)
   (js . t)
   (octave . t)
   (plantuml . t)
   (python . t)
   (ruby . t)

   (go . t)
   (lua . t)
   ;; (dart . t)
   ;; (prolog . t)
   ))

;; Common Lisp (SLY)
;; SLY's connection-local accessors signal "Can't access prop
;; sly-continuation-counter for no connection" when nothing is connected, and
;; Doom only auto-starts SLY from `sly-mode-hook' in `.lisp' buffers.  Evaluating
;; a Common Lisp org-babel block (or any SLY command run first) therefore fails,
;; so start SLY on demand before the first synchronous eval.
(defvar +sly--starting-connection nil)

(defun +sly-ensure-connection (&optional timeout)
  "Ensure a live SLY connection, starting SLY if necessary.
Wait up to TIMEOUT seconds (default 60) for it to come up."
  (require 'sly)
  (when (and (not (sly-connected-p)) (null sly-net-processes))
    (sly))
  (let ((waited 0))
    (while (and (not (sly-connected-p)) (< waited (or timeout 60)))
      (sleep-for 0.2)
      (setq waited (+ waited 0.2))))
  (unless (sly-connected-p)
    (user-error "Couldn't establish a SLY connection (see *sly-events*)")))

(defun +sly-eval--ensure-connection-a (fn &rest args)
  "Start SLY before a synchronous eval when no connection exists."
  (when (and (not +sly--starting-connection)
             (not (sly-connected-p))
             (null sly-net-processes))
    (let ((+sly--starting-connection t))
      (+sly-ensure-connection)))
  (apply fn args))

(after! sly
  (advice-add 'sly-eval :around #'+sly-eval--ensure-connection-a)
  ;; `sly-stepper' (pinned by Doom's :lang common-lisp) still uses positional
  ;; arguments to `define-minor-mode', which Emacs 30 warns about on load.
  ;; `sly-quicklisp' needs Quicklisp, and without it `slynk-quicklisp' fails to
  ;; load during connection setup, dropping SLY into its debugger.
  (setq sly-contribs
        (delq 'sly-stepper
              (if (cl-some #'file-directory-p +lisp-quicklisp-paths)
                  sly-contribs
                (delq 'sly-quicklisp sly-contribs)))))

;; Whitespace cleanup
(after! whitespace
  (setq whitespace-style '(face tabs spaces-tail trailing space-before-tab newline indentation empty space-after-tab tab-mark newline-mark)
        whitespace-display-mappings '((newline-mark 10 [182 10])
                                      (tab-mark 9 [187 9] [92 9]))))

;; Enable whitespace mode globally
(global-whitespace-mode 1)

;; Projectile settings
(setq projectile-project-search-path '("~/projects/" "~/work/"))

;; `locate` is not installed, so `SPC f l` / `SPC s f` (consult-locate) failed
;; with "Error running timer: (file-missing ... \"locate\")". Search with fd.
(after! consult
  (setq consult-locate-args "fd --full-path --color never"))

;; LSP settings
(setq lsp-headerline-breadcrumb-enable t
      lsp-lens-enable t
      lsp-signature-auto-activate nil
      lsp-signature-render-documentation t
      lsp-ui-doc-enable t
      lsp-ui-doc-show-with-cursor t
      lsp-ui-doc-position 'at-point
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

;; (use-package! nyan-mode
;;   :config
;;   (nyan-mode 1)
;;   (setq nyan-animate-nyancat t))

(use-package! org-modern
  :hook (org-mode . org-modern-mode))

(use-package! org-link-beautify
  :after org
  :hook (org-mode . org-link-beautify-mode))

;; transparent
(set-frame-parameter nil 'alpha-background 88)
(add-to-list 'default-frame-alist '(alpha-background . 88))

(custom-set-faces!
  ;; 額装風の余白（niri の角丸と合わせる）
  `(internal-border :background "#181825") ;; Mocha Mantle

  ;; コメントの色を明るめに変更
  `(font-lock-comment-face :foreground "#a6adc8" :slant italic) ;; Mocha Subtext 0
  `(font-lock-comment-delimiter-face :foreground "#a6adc8" :slant italic)

  ;; 行番号（現在行以外）を明るく
  `(line-number :foreground "#6c7086") ;; Mocha Overlay 0

  ;; 現在行の行番号をさらに強調
  `(line-number-current-line :foreground "#fab387" :weight bold) ;; Peach

  ;; org table row text - catppuccin-mocha text color
  `(org-table :foreground "#cdd6f4") ;; Mocha Text
  `(org-document-info-keyword :foreground "#bac2de")  ;; Mocha Subtext 1
  ) ;; end custom-set-faces!

;; rainbow
(add-hook 'prog-mode-hook #'rainbow-mode)
(add-hook 'text-mode-hook #'rainbow-mode)

;; breadcrumb
(after! lsp-mode
  (setq lsp-headerline-breadcrumb-enable t
        lsp-headerline-breadcrumb-icons-enable t
        lsp-headerline-breadcrumb-segments '(file symbols))
  (add-hook 'org-src-mode-hook #'lsp-deferred))

;; Lua: LSP auto-start (also set up by Doom's `:lang lua +lsp') and
;; settings for wezterm configs (~/ghq/.../configs/home-manager/wezterm).
(after! lsp-mode
  (require 'lsp-lua nil t)
  (add-hook 'lua-mode-hook #'lsp!)
  (add-hook 'lua-ts-mode-hook #'lsp!)
  (setq lsp-lua-runtime-version "Lua 5.4"
        lsp-lua-diagnostics-globals ["wezterm"]))

(setq scroll-margin 3)
(setq evil-cross-lines t)

(after! doom-dashboard
  (set-face-background 'doom-dashboard-banner nil))

(after! direnv
  (direnv-mode))

(add-hook 'vue-mode-hook #'lsp!)

(setq custom-file "~/.config/emacs/custom.el")

(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load custom-file)

;; (setq org-edit-src-content-indentation 0)
;; (setq org-src-preserve-indentation nil)

(use-package! org-cliplink
  :after org
  :config
  ;; DoomのLocalleader (SPC m や 、) の下にバインドを定義
  (map! :map org-mode-map
        :localleader
        :desc "Insert link from clipboard" "l l" #'org-cliplink))

;; (use-package! dimmer
;;   :config
;;   (setq
;;    ;; dimmer-fraction 0.7
;;    ;; dimmer-adjustment-mode :background
;;    dimmer-use-colorspace :rgb
;;    dimmer-watch-frame-focus-events nil)
;;   (dimmer-configure-which-key)
;;   (dimmer-configure-helm)
;;   (dimmer-configure-magit)
;;   (dimmer-configure-org)
;;   (dimmer-configure-company-box)
;;   (dimmer-mode t))

;; (use-package! blamer
;;   :bind (:map evil-normal-state-map
;;               ("SPC g i" . blamer-show-posframe-commit-info))
;;   :defer 20
;;   :custom
;;   (blamer-idle-time 0.3)
;;   (blamer-min-offset 70)
;;   :config
;;   (global-blamer-mode 1))

;; Show src block edit buffers in a reusable side window on the right. Doom's
;; popup system owns "*Org Src" buffers and takes precedence over
;; `org-src-window-setup', so that variable must use `display-buffer' (i.e.
;; `plain') for the popup rule below to apply.
(after! org
  (setq org-src-window-setup 'plain)
  (set-popup-rule! "^\\*Org Src"
    :side 'right :size 0.5 :select t :autosave t :modeline t :ttl nil :quit nil))

(use-package! lsp-pyright
  :defer t
  :hook (python-mode . lsp-deferred))

(after! gptel
  (defvar my/gptel-gemini-backend (gptel-make-gemini "Gemini" :stream t))

  ;; Local llama.cpp server (configs/home-manager/llm).
  (defvar my/gptel-llama-backend
    (gptel-make-openai "llama.cpp"
      :host "127.0.0.1:8080"
      :protocol "http"
      :endpoint "/v1/chat/completions"
      :stream t
      :key "sk-local"
      :models '("qwen3-4b")))

  (setq
   ;; gptel-api-key 'auth-source
   gptel-backend my/gptel-gemini-backend
   gptel-model 'gemini-2.5-flash
   gptel-default-mode 'org-mode
   gptel-use-tools t)

  (defun my/gptel-toggle-local ()
    "Switch gptel between Gemini and the local llama.cpp server."
    (interactive)
    (if (eq gptel-backend my/gptel-llama-backend)
        (setq gptel-backend my/gptel-gemini-backend
              gptel-model 'gemini-2.5-flash)
      (setq gptel-backend my/gptel-llama-backend
            gptel-model 'qwen3-4b))
    (message "gptel: %s (%s)" (gptel-backend-name gptel-backend) gptel-model))

  (map! "C-c L" #'my/gptel-toggle-local))

(after! lookup
  (require 'lookup-wiktionary)
  (add-to-list 'lookup-search-engines
               '(wiktionary-sv
                 "Swedish Wiktionary"
                 "https://sv.wiktionary.org/wiki/%s"
                 :charset utf-8)))

(use-package! dired-preview
  :hook (dired-mode . dired-preview-mode))

;; OpenCode (ACP) integration
(add-to-list 'exec-path (expand-file-name "~/.opencode/bin/"))
(setq agent-shell-opencode-authentication '((:none . t))
      agent-shell-opencode-default-model-id
      "opencode/deepseek-v4.1-flash-free")

(use-package! agent-shell
  :commands (agent-shell agent-shell-opencode-start-agent))

;;; Appearance ---------------------------------------------------------------

;; Smooth scrolling
(setq pixel-scroll-precision-use-momentum t)
(pixel-scroll-precision-mode 1)

;; Modeline (upper-cased, compact project-relative paths)
(setq doom-modeline-height 28
      doom-modeline-buffer-file-name-style 'truncate-upto-project)

;; Icons in dired
(use-package! nerd-icons-dired
  :hook (dired-mode . nerd-icons-dired-mode))

(use-package! org-fragtog
  :hook (org-mode . org-fragtog-mode))

(use-package! org-modern-indent
  :hook (org-mode . org-modern-indent-mode))

;; Subtle 80-column guide in code buffers (no fill-column module in this Doom)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; Proportional (serif) text for prose, monospace for code
(setq doom-variable-pitch-font (font-spec :family "Noto Serif CJK JP" :size 17))
(use-package! mixed-pitch
  :hook ((org-mode markdown-mode) . mixed-pitch-mode))
