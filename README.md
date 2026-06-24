# [![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Fira+Code&weight=600&size=32&pause=1000&color=5277C3&width=435&lines=dotfiles+with+nix)](https://git.io/typing-svg)

<img src="https://img.shields.io/badge/NixOS-5277C3?style=for-the-badge&logo=NixOS&logoColor=white"/>


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

