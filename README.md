# dotfiles with nix

[Zenn Scraps](https://zenn.dev/shun2439/scraps/cd35141f62e704)

## Tools

### Doom Emacs

- SKK

- LaTeX[^1]
- Typst

### Nixvim

- snacks.nvim
- SKK

### Vim

- SKK

## Development

Use `nix develop` to enter a development shell with all necessary tools (formatter, LSP, etc.).

```bash
nix develop
```

This project uses `pre-commit` hooks to ensure code quality. The hooks are automatically installed when you enter the dev shell.
You can run them manually with:

```bash
pre-commit run --all-files
```

### Apply Configuration

To apply the home-manager configuration:

```bash
home-manager switch --flake .#<username>@<hostname>
```

To apply the NixOS configuration:

```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

## References

[^1]: [Emacs/Org mode - TeX Wiki](https://texwiki.texjp.org/?Emacs%2FOrg%20mode#h20d131a)

