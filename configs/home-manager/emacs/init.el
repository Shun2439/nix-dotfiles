(global-display-line-numbers-mode 1)

(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; MELPA-stableを追加
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; Orgを追加
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;; 初期化
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(nord-theme lsp-latex company format-all gruvbox-theme atom-one-dark-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;
;;; color theme
;;

(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
(load-theme 'nord t)

;;
;;; tree-sitter
;;
; (require 'tree-sitter)
; (require 'tree-sitter-langs)
; (global-tree-sitter-mode)

;;
;;; loat-path
;;

;; P.61
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	     (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))
; (add-to-load-path "conf")

;;
;;; SKK
;;

;; <https://gihyo.jp/admin/serial/01/ubuntu-recipe/0175>
; (require 'skk-autoloads)
; (global-set-key "\C-x\C-j" 'skk-mode)
; (global-set-key "\C-xj" 'skk-auto-fill-mode)
; (global-set-key "\C-xt" 'skk-tutorial)

; (setq skk-large-jisyo "C:\Users\%USERPROFILE%\AppData\Local\nvim-data\SKK-JISYO.L)
; (setq skk-large-jisyo "/home/shun2439/SKK-JISYO.L")

(setq user-mail-address "shunta.kobayashi24@gmail.com")
(setq user-full-name "Kobayashi Shunta")
(setq smtpmail-smtp-server "smtp.gmail.com")
(setq mail-user-agent 'message-user-agent)
(setq message-send-mail-function 'message-smtpmail-send-it)

;;
;;; scheme
;;

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

;;
;;; org-mode
;;

;; latex
(require 'ox-latex)
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
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

; (setq org-babel-inline-result-wrap "")
(setq org-confirm-babel-evaluate nil)

(require 'org)
(require 'ob-ruby)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (ruby . t) ; これを追加または確認
   ;; 他の言語も必要に応じて追加
   ))

(add-hook 'ruby-mode-hook
          (lambda ()
            ;; スペースインデントと幅の設定 (Rubyの一般的な慣習)
            (setq indent-tabs-mode nil) ; タブではなくスペースを使用
            (setq tab-width 2)          ; インデント幅を2スペースに設定

            ;; これが重要: 'end' のインデントを修正
            (setq ruby-deep-indent-paren nil)))

;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-cc" 'org-capture)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cb" 'org-iswitchb)

;;
;;; lsp
;;

(require 'eglot)
(add-hook 'emacs-lisp-mode-hook 'eglot-ensure)
(add-hook 'lisp-interaction-mode-hook 'eglot-ensure)
