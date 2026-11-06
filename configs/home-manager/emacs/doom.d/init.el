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
       indent-guides
       (emoji +unicode)
       hl-todo
       nav-flash

       :editor
       (evil +everywhere)
       (format +onsave)
       snippets

       :checkers
       syntax
       (spell +flyspell +hunspell +everywhere)

       :tools
       (eval +overlay)
       (lookup +dictionary +docsets +offline)
       (lsp +peek)
       (magit +forge)
       ;; vterm module moved to :term in Doom 3
       tree-sitter
       direnv
       (docker +lsp)
       pdf
       llm

       :term
       vterm

       :lang
       (javascript +lsp +tree-sitter)
       (python +lsp +pyright)
       (rust +lsp)
       (cc +lsp +tree-sitter)
       (nix +lsp +tree-sitter)
       (lua +lsp +tree-sitter)
       (markdown)
       (org +pretty +roam +gnuplot +journal +noter +pandoc +present)
       (java +lsp)
       (haskell +lsp)
       (clojure +lsp)
       (fsharp +lsp)
       (go +lsp)
       (yaml +lsp)
       (elixir +lsp)
       common-lisp
       (julia +lsp)
       ess

       :input
       japanese

       :config
       (default +bindings +smartparens))
