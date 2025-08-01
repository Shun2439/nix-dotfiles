(use-package exec-path-from-shell
  :if (eq system-type 'gnu/linux)
  :ensure t
  :config
  (exec-path-from-shell-copy-env "PATH")
  (exec-path-from-shell-initialize)
)

(set-default-coding-systems 'utf-8)

(set-terminal-coding-system 'utf-8)

(set-selection-coding-system 'utf-8)

(prefer-coding-system 'utf-8)

; (set-language-environment "Japanese")

(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

(use-package package
  :ensure t
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  (package-initialize))

  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(custom-enabled-themes '(nord))
   '(custom-safe-themes
     '("24afbd552dad7df70345e4749f849d4b471717a77e5274da2bd78f7e48045823" "5a4cdc4365122d1a17a7ad93b6e3370ffe95db87ed17a38a94713f6ffe0d8ceb" default))
   '(package-selected-packages
     '(tree-sitter tree-sitter-langs highlight-parentheses nix-mode which-key nerd-icons doom-modeline ox-pandoc company emojify flycheck format-all gnuplot lsp-latex lsp-mode magit nord-theme projectile rust-mode)))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )

(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
	(let ((default-directory
	       (expand-file-name (concat user-emacs-directory path))))
	  (add-to-list 'load-path default-directory)
	  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	      (normal-top-level-add-subdirs-to-load-path))))))
(cond ((eq system-type 'gnu/linux)
(add-to-load-path "conf")))

; <https://gihyo.jp/admin/serial/01/ubuntu-recipe/0175>
(use-package skk
  ; :ensure t
  :bind (("C-x C-j" . skk-mode)
         ("C-x j" . skk-auto-fill-mode)
         ("C-\\" . skk-mode)
         ("C-x t" . skk-tutorial))
  :config
  (let* ((skk-jisyo-path (file-name-concat (getenv "HOMEPATH") "SKK-JISYO.L")))
    (setq skk-large-jisyo skk-jisyo-path)
    )
  )

(use-package ox-latex
  :config
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
  (setq org-latex-pdf-process '("latexmk -lualatex %f"))
  (add-to-list 'org-latex-classes
               '("jlreq-article"
                 "\\ifdefined\\kanjiskip
  \\documentclass[uplatex,dvipdfmx,11pt,paper=a4]{jlreq}
\\else
  \\documentclass[11pt,paper=a4]{jlreq}
\\fi
[NO-DEFAULT-PACKAGES]
\\usepackage{amsmath}
\\usepackage{newtxtext,newtxmath}
\\ifdefined\\kanjiskip
  \\usepackage{graphicx}
  \\usepackage{hyperref}
  \\usepackage{pxjahyper}
  \\hypersetup{colorlinks=true}
\\else
  \\usepackage{graphicx}
  \\usepackage{hyperref}
  \\usepackage{bm}
  \\hypersetup{pdfencoding=auto,colorlinks=true}
\\fi"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(setq org-confirm-babel-evaluate nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (C . t)
   (R . t)
   (gnuplot . t)
   ; (mermaid . t)
   (rust . t)
   (python . t)
   (ruby .t)
   (java . t)
   (shell . t)
   ; (scala . t)
   (nix . t)
   ))

  (use-package ob-nix
  :ensure t
  )

(use-package eglot
  :ensure t
  :hook
  (c-mode . eglot-ensure)
  (rust-mode . eglot-ensure)
  (ruby-mode . eglot-ensure)
  (nix-mode . eglot-ensure)
)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1
	company-idle-delay 0.0) ;; default is 0.2

; (setq gc-cons-threshold (* 100 1024 1024)
;       read-process-output-max (* 1024 1024)
;       treemacs-space-between-root-nodes nil
;       company-idle-delay 0.0
;       company-minimum-prefix-length 1
;       lsp-idle-delay 0.1)  ;; clangd is fast

(use-package yasnippet
  :ensure t
  :hook
  (el-get-bundle yasnippet)
  )

(setq ring-bell-function 'ignore)

(setq-default indent-tabs-mode nil)
(setq tab-width 4)

(use-package auto-complete
  :ensure t
  :config
  (ac-set-trigger-key "TAB")
  (setq ac-quick-help-delay 0.5)
  )

(use-package neotree
  :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-persist-show t)
  )

(global-display-line-numbers-mode 1)
; (setq initial-buffer-choice t)
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(set-scroll-bar-mode nil)
(push '(fullscreen . fullscreen) default-frame-alist)

(use-package tree-sitter
  :ensure t
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
(use-package catppuccin-theme
  :ensure t
  )
;; (load-theme 'nord t)
(load-theme 'catppuccin :no-confirm)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(set-face-attribute 'default nil :height 120)
  (setq default-frame-alist
	       (append (list
			'(font . "Moralerspace Radon HWNF"))
		       default-frame-alist)
)

(use-package emojify
  :hook (after-init . global-emojify-mode))
(add-hook 'after-init-hook #'global-emojify-mode)

(use-package highlight-parentheses
  :ensure t
  :hook (prog-mode . highlight-parentheses-mode))

; how to use?
  (defun kb/toggle-window-transparency ()
  "Toggle the value of `alpha-background'.

Toggles between 100 and 72 by default.  Can choose which value to change
to if called with ARG, or any prefix argument."
  (interactive "P")
  (let ((transparency (pcase arg
			  ((pred numberp) arg)
			  ((pred car) (read-number "Change the transparency to which value (0-100)? "))
			  (_
			   (pcase (frame-parameter nil 'alpha-background)
			     (72 100)
			     (100 72)
			     (t 100))))))
    (set-frame-parameter nil 'alpha-background transparency)))

(set-frame-parameter nil 'alpha-background 85)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(require 'rust-mode)

(defun my/find-rust-project-root (dir)                                                                           
 (when-let ((root (locate-dominating-file dir "Cargo.toml")))                                                         
   (list 'vc 'Git root)))

(defun my/rust-mode-hook ()
  (setq-local project-find-functions (list #'my/find-rust-project-root)))

(add-hook 'rust-mode-hook #'my/rust-mode-hook)

;; <https://haskell.hatenablog.com/entry/Settings-to-use-Gauche_Scheme-with-Emacs>

(modify-coding-system-alist 'process "gosh" '(utf-8 . utf-8))

(setq scheme-program-name "gosh -i")
(autoload 'scheme-mode "cmuscheme" "Major mode for scheme." t)
(autoload 'run-scheme "cmuscheme" "Run a n inferior Scheme process." t)

(defun scheme-other-window ()
  "Run scheme on other window"
  (interactive)
  (switch-to-buffer-other-window
    (get-buffer-create "*scheme*"))
  (run-scheme scheme-program-name))

(define-key global-map
  "\C-cs" 'scheme-other-window)

(use-package nix-mode
  :ensure t
  :config
  (setq nix-indent-offset 2)
  )

;; https://tamura70.hatenadiary.org/entry/20100207/org
(setq org-todo-keywords
	'((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))
;; DONEの時刻を記録
(setq org-log-done 'time)
