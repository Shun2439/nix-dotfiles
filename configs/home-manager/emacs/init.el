(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
;;   (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

(use-package skk
  :ensure t
  :bind (("C-x C-j" . skk-mode)
         ("C-x j" . skk-auto-fill-mode)
         ("C-\\" . skk-mode)
         ("C-x t" . skk-tutorial))
  :config
  (let* ((skk-jisyo-path (file-name-concat (getenv "HOME") "SKK-JISYO.L")))
    (setq skk-large-jisyo skk-jisyo-path)
    )
  )

(use-package auto-complete
  :ensure t
  :config
  (ac-set-trigger-key "TAB")
  (setq ac-quick-help-delay 0.5)
  )

(global-display-line-numbers-mode 1)
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
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
  )

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

;; https://tamura70.hatenadiary.org/entry/20100207/org
(setq org-todo-keywords
	'((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))
;; DONEの時刻を記録
(setq org-log-done 'time)
