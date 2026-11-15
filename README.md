# Dotfiles

Konfigurasi personal untuk Arch Linux, dikelola dengan [GNU Stow](https://www.gnu.org/software/stow/).
Repo ini dibuat supaya waktu fresh install Arch, tinggal clone dan apply — semua config langsung jalan.

## Tools

| Aplikasi | Deskripsi | Dokumentasi |
|----------|-----------|-------------|
| Neovim (AstroVim) | Text editor berbasis terminal dengan AstroNvim framework | [astronvim.com](https://astronvim.com/) |
| Cava | Audio visualizer untuk terminal | [github.com/karlstav/cava](https://github.com/karlstav/cava) |
| LazyGit | Git UI di terminal | [github.com/jesseduffield/lazygit](https://github.com/jesseduffield/lazygit) |
| LazyDocker | Docker UI di terminal | [github.com/jesseduffield/lazydocker](https://github.com/jesseduffield/lazydocker) |
| Superfile | File manager modern di terminal | [superfile.dev](https://superfile.dev/) |
| bat | Pengganti `cat` dengan syntax highlighting | [github.com/sharkdp/bat](https://github.com/sharkdp/bat) |
| Brave Browser | Chromium-based browser (config flag X11) | [brave.com](https://brave.com/) |
| GNU Stow | Symlink manager untuk dotfiles | [gnu.org/software/stow](https://www.gnu.org/software/stow/) |

## Prerequisites

Pastikan sudah ter-install:

- [ ] `git`
- [ ] `stow`

```bash
sudo pacman -S git stow
```

## Install Dependencies

Install semua tools sekaligus:

```bash
sudo pacman -S neovim lazygit lazydocker superfile bat cava
```

> **Note:** `brave-bin` mungkin perlu di-install via AUR (yay/paru):

```bash
yay -S brave-bin
```

## Clone & Apply Config

```bash
# 1. Clone repo
git clone https://github.com/<username>/dotfiles.git ~/dotfiles

# 2. Masuk ke direktori
cd ~/dotfiles

# 3. Apply semua config via stow
stow .
```

> Ini akan membuat symlink dari `~/dotfiles/.config/*` ke `~/.config/*`.

## Post-Install

Setelah `stow .`, jalankan langkah berikut:

- [ ] **Neovim** — Buka `nvim`, AstroNvim akan otomatis install plugins. Tunggu proses selesai, lalu restart Neovim.
- [ ] **bat** — Build cache theme:
  ```bash
  bat cache --build
  ```

## Struktur Folder

```
dotfiles/
├── .config/
│   ├── nvim/              # Neovim (AstroVim)
│   │   ├── init.lua
│   │   ├── lua/
│   │   │   ├── lazy_setup.lua
│   │   │   ├── polish.lua
│   │   │   └── plugins/   # Plugin configurations
│   │   │       ├── astrocore.lua    # Core keymaps & options
│   │   │       ├── astrolsp.lua     # LSP configurations
│   │   │       ├── astroui.lua      # UI customizations
│   │   │       ├── mason.lua        # LSP/formatter installer
│   │   │       ├── treesitter.lua   # Syntax highlighting
│   │   │       ├── none-ls.lua      # Linting & formatting
│   │   │       └── user.lua         # Custom user plugins
│   │   └── lazy-lock.json
│   │
│   ├── cava/              # Audio visualizer
│   │   ├── config
│   │   ├── themes/
│   │   └── shaders/
│   │
│   ├── lazygit/           # LazyGit config
│   ├── lazydocker/        # LazyDocker config
│   ├── superfile/         # Superfile config & hotkeys
│   │   ├── config.toml
│   │   ├── hotkeys.toml
│   │   └── theme/         # 15+ color themes
│   │
│   ├── bat/               # bat themes
│   │   └── themes/        # Catppuccin & custom themes
│   │
│   └── brave-flags.conf   # Flag X11 untuk Brave
│
└── README.md
```

## Neovim (AstroVim) Features

- **Framework:** AstroNvim - Distribution Neovim yang pre-configured
- **Plugin Manager:** Lazy.nvim
- **LSP:** Mason untuk auto-install language servers
- **Linting/Formatting:** none-ls dengan support multiple languages
- **Syntax:** Treesitter untuk highlighting
- **Plugins:** 7 custom configurations (astrocore, astrolsp, astroui, mason, treesitter, none-ls, user)

### Neovim Keybinds (Default AstroVim)

| Shortcut | Action |
|----------|--------|
| `<leader>ff` | Find files (Telescope) |
| `<leader>fw` | Find word (Telescope) |
| `<leader>e` | Toggle file explorer (Neo-tree) |
| `<leader>c` | Close buffer |
| `<leader>gg` | LazyGit |

> Lihat `lua/plugins/astrocore.lua` untuk custom keybinds.

## Catatan

- **Backup dulu** — Kalau sudah ada config lama di `~/.config/`, backup sebelum `stow .` supaya tidak tertimpa.
- **Konflik stow** — Kalau ada error conflict, hapus/pindah file yang bentrok di `~/.config/` lalu ulangi `stow .`.
- **Uninstall** — Untuk cabut semua symlink: `cd ~/dotfiles && stow -D .`
- **AstroNvim Updates** — Jalankan `:AstroUpdate` di dalam Neovim untuk update framework dan plugins.
