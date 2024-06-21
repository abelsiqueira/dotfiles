# dotfiles and new install guide

Most of these were written after things were working, and haven't been tested in a brand new system.
Use at your own peril.

## OS-dependent

### Linux

```bash
yay -S zsh neovim ttf-juliamono wezterm lazygit ripgrep fd bat xclip tmux ttf-jetbrains-mono-nerd chezmoi find-the-command
```

Change the shell to `zsh`

```bash
chsh -s $(which zsh)
# log out and log back in
```

### Mac

```bash
# TODO
```

## Both

```bash
# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Powerlevel10k - Next time that you run it
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search $ZSH_CUSTOM/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
# juliaup - Manually install and disable PATH changes
curl -fsSL https://install.julialang.org | sh
# tpm - tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# nvm
# Get script from https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating
nvm install latest
```

Finally, copy these files using [chezmoi](https://www.chezmoi.io).

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply abelsiqueira
```

Finishing touches:

- Run `tmux` and press C-a I
- Run `chezmoi cd` and `bash setup-julia-for-neovim.sh`
