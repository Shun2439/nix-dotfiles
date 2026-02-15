;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load in.
;; Setting `doom-theme' or `doom-font' here will override their values in
;; ~/.doom.d/config.el

(doom! :completion
       (company +tng +childframe)
       (vertico +icons)

       :ui
       doom-dashboard
       modeline
       ophints
       (popup +defaults)
       (vc-gutter +pretty)
       workspaces
       (treemacs +lsp)
       tabs

       :editor
       (evil +everywhere)
       (format +onsave)
       snippets

       :checkers
       syntax
       spell

       :tools
       (eval +overlay)
       (lookup +docsets)
       lsp
       magit
       ;; vterm module moved to :term in Doom 3
       tree-sitter

       :term
       (vterm +toggle)

       :lang
       (javascript +typescript +tree-sitter)
       (python +lsp +pyright)
       (rust +lsp +rust-analyzer)
       (cc +lsp +tree-sitter)
       (nix +tree-sitter)
       (markdown +grip)
       (org +pretty +roam +brain +gnuplot +journal +pandoc +pomodoro +present +pretty)
       (java +lsp)
       (haskell +lsp)

       :input
       japanese

       :config
       (default +bindings +smartparens))
