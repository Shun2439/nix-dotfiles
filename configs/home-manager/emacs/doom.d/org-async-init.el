;;; org-async-init.el --- Load Doom's profile in Org's async export child -*- lexical-binding: t; -*-
;;; Commentary:
;;
;; Org's async export spawns `emacs --batch -Q -l <this file>' (see Doom's
;; `+org--fix-async-export-a'). In noninteractive sessions Doom skips the
;; profile init, so the user's config (LaTeX classes, ox-typst, ...) is
;; missing and exports fail. Load it manually here. `noninteractive' is bound
;; to nil while loading the profile so `doom!' (which mutates module state in
;; noninteractive sessions) is a no-op, matching normal startup behavior.
;;
;;; Code:

(let* ((doom-lib (locate-library "doom"))
       (emacs-dir (file-name-directory
                   (directory-file-name
                    (file-name-directory doom-lib)))))
  (load (expand-file-name "early-init" emacs-dir) nil t))

(require 'doom-start)

(let ((noninteractive nil))
  (load (doom-profile-init-file doom-profile) nil t))

(doom-startup)

;;; org-async-init.el ends here
