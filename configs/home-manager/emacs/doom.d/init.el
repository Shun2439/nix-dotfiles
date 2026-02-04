;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load in.
;; Setting `doom-theme' or `doom-font' here will override their values in
;; ~/.doom.d/config.el

(doom! :completion
        (company +tng)
        (vertico +icons)

        :ui
        doom-dashboard
        doom-modeline
        (vc-gutter +pretty)
        workspaces

        :editor
        (evil +everywhere)
        (format +onsave)

        :checkers
        syntax
        spell

        :tools
        (eval +overlay)
        (lookup +docsets)
        lsp
        magit
        (vterm +toggle)
        tree-sitter

        :lang
        (javascript +typescript)
        (python +lsp +pyright)
        (rust +lsp +rust-analyzer)
        (cc +lsp +tree-sitter)
        (nix +tree-sitter)
        (markdown +grip)
        (org +pretty +roam2)

        :config
        (default +bindings +smartparens))
