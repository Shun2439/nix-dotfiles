# [![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Fira+Code&weight=600&size=32&pause=1000&color=5277C3&width=435&lines=dotfiles+with+nix)](https://git.io/typing-svg)

![Nix](https://img.shields.io/badge/NIX-5277C3.svg?style=for-the-badge&logo=NixOS&logoColor=white)![Emacs](https://img.shields.io/badge/Emacs-%237F5AB6.svg?&style=for-the-badge&logo=gnu-emacs&logoColor=white)![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)![WezTerm](https://img.shields.io/badge/WezTerm-%234E49EE?style=for-the-badge&logo=wezterm&logoColor=white)

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

