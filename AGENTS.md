# Repository Guidelines

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). All configuration lives under `.config/` and is symlinked into `$HOME` via `stow .`.

## Project Structure

```
dotfiles/
├── .config/
│   ├── nvim/          # LazyVim (Neovim) – Lua plugins & config
│   ├── superfile/     # Superfile file-manager settings
│   ├── lazygit/       # LazyGit UI/behavior config
│   ├── lazydocker/    # LazyDocker config
│   ├── bat/           # bat (batcat) themes & config
│   └── brave-flags.conf  # Brave browser Wayland flags
├── README.md
└── AGENTS.md
```

Each top-level directory inside `.config/` corresponds to one tool. Stow mirrors this tree into `~/.config/`.

## Setup & Usage

```bash
# 1. Clone the repo
git clone <repo-url> ~/dotfiles

# 2. Install GNU Stow
sudo pacman -S stow        # Arch
# sudo apt install stow    # Debian/Ubuntu

# 3. Symlink everything
cd ~/dotfiles && stow .
```

To add a new tool, create `.config/<tool>/` with its config files, then re-run `stow .`.

## Coding Style & Conventions

- **Lua (Neovim):** 2-space indentation, 120-column width. Format with [StyLua](https://github.com/JohnnyMorganz/StyLua) (see `.config/nvim/stylua.toml`).
- **TOML / YAML configs:** Use the defaults of the respective tool; keep comments minimal and meaningful.
- **File naming:** Match upstream defaults (e.g., `init.lua`, `config.toml`). Neovim plugin files use lowercase kebab-case (`lazy-git.lua`, `emmet-ls.lua`).

## Neovim Plugin Layout

Neovim config follows the [LazyVim](https://www.lazyvim.org/) starter structure:

- `lua/config/` — core settings: `lazy.lua`, `options.lua`, `keymaps.lua`, `autocmds.lua`.
- `lua/plugins/` — one file per plugin or feature (e.g., `telescope.lua`, `lspconfig.lua`).

## Commit & Pull Request Guidelines

Commits follow **Conventional Commits**:

```
feat: add configuration batcat
chore: update configuration Superfile and LazyGit
docs: added Readme file on this dotfiles
```

- **Type prefixes:** `feat`, `chore`, `docs`, `fix`.
- **Scope (optional):** tool name, e.g., `feat(nvim): add treesitter config`.
- Keep messages short and descriptive; one logical change per commit.

## Tips

- After editing Neovim plugins, open `nvim` and run `:Lazy sync` to install/update dependencies.
- Validate TOML/YAML with a linter before committing to avoid broken configs.
- Back up existing `~/.config/<tool>` before running `stow .` for the first time.
