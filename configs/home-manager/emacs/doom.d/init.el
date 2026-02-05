;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load in.
;; Setting `doom-theme' or `doom-font' here will override their values in
;; ~/.doom.d/config.el

(doom! :completion
        (company +tng)
        (vertico +icons)

        :ui
        doom-dashboard
        modeline
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
        ;; vterm module moved to :term in Doom 3
        tree-sitter

        :term
        (vterm +toggle)

        :lang
        (javascript +typescript)
        (python +lsp +pyright)
        (rust +lsp +rust-analyzer)
        (cc +lsp +tree-sitter)
        (nix +tree-sitter)
        (markdown +grip)
        (org +pretty +roam)

        :input
        japanese

        :config
        (default +bindings +smartparens))
