{ pkgs, sources }:
epkgs:
let
  tree-sitter = import ./packages/tree-sitter { inherit epkgs; };
in
++ tree-sitter

