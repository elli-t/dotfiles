# dotfiles

Personal dotfiles, powered by [chezmoi](https://github.com/twpayne/chezmoi).

## Components

- Installer scripts for certain tools (`gitstatus`, `grc`, `fzf`, `rg`)
- Bash configuration
  - [gitstatus](https://github.com/romkatv/gitstatus) support in bash prompt
  - Python venv indicator in bash prompt
  - [grc](https://github.com/garabik/grc)-coloured aliases for common commands
- Git configuration and aliases
- SSH configuration
- `tmux` configuration
- Minimal `.vimrc` for convenience
  - Auto-installs plugins on first load
  - Bidirectional pane navigation with `tmux` using backtick + `hjkl`

## Installation

For a machine that is intended for long term use and expects to modify these
dotfiles, add the machine's SSH key to the deploy keys for this repo or to
GitHub, then run:

```bash
sh -c "$(curl -fsLS git.io/chezmoi)" -- init --ssh --apply elli-t
```

That should prompt for the GitHub name and email, and then run the default
installation. To customize the `chezmoi` config before applying, run without
`--apply` and then apply after.

```bash
sh -c "$(curl -fsLS git.io/chezmoi)" -- init --ssh elli-t
vim ~/.config/chezmoi/chezmoi.toml
chezmoi apply
```

For fully-automated installation on a remote machine, provision a deploy key
onto the remote machine, then run the following deploy script on the remote
machine which cleans up after itself.

```bash
#!/bin/bash

readonly DOTFILES_PRIVATE_KEY_PATH="$HOME/dotfiles_deploy_key"
readonly CHEZMOI_CONFIG_PATH="$HOME/.config/chezmoi/chezmoi.toml"

mkdir -p $(dirname $CHEZMOI_CONFIG_PATH)
cat > $CHEZMOI_CONFIG_PATH <<EOF
[data]
  name = "Elliot Tan"
  email = "elliot.kt.tan@gmail.com"
  base_profile = "minimal"
EOF

eval $(ssh-agent -s)
chmod 600 $DOTFILES_PRIVATE_KEY_PATH
ssh-add $DOTFILES_PRIVATE_KEY_PATH
ssh-keyscan github.com >> ~/.ssh/known_hosts
sh -c "$(curl -fsLS git.io/chezmoi)" -- init --ssh --one-shot elli-t
ssh-add -D
rm $DOTFILES_PRIVATE_KEY_PATH
```
