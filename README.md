# Dotfiles

Konfigurasi personal untuk Arch Linux, dikelola dengan [GNU Stow](https://www.gnu.org/software/stow/).
Repo ini dibuat supaya waktu fresh install Arch, tinggal clone dan apply — semua config langsung jalan.

## Tools

| Aplikasi | Deskripsi | Dokumentasi |
|----------|-----------|-------------|
| Neovim (LazyVim) | Text editor berbasis terminal dengan plugin manager Lazy.nvim | [lazyvim.org](https://www.lazyvim.org/) |
| LazyGit | Git UI di terminal | [github.com/jesseduffield/lazygit](https://github.com/jesseduffield/lazygit) |
| LazyDocker | Docker UI di terminal | [github.com/jesseduffield/lazydocker](https://github.com/jesseduffield/lazydocker) |
| Superfile | File manager modern di terminal | [superfile.dev](https://superfile.dev/) |
| bat | Pengganti `cat` dengan syntax highlighting | [github.com/sharkdp/bat](https://github.com/sharkdp/bat) |
| Brave Browser | Chromium-based browser (config flag Wayland) | [brave.com](https://brave.com/) |
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
sudo pacman -S neovim lazygit lazydocker superfile bat
```

> **Note:** `brave-bin`  mungkin perlu di-install via AUR (yay/paru):

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

- [ ] **Neovim** — Buka `nvim`, plugin akan otomatis ter-install. Jalankan `:Lazy sync` untuk memastikan semua plugin up-to-date.
- [ ] **bat** — Build cache theme Catppuccin:
  ```bash
  bat cache --build
  ```

## Struktur Folder

```
dotfiles/
├── .config/
│   ├── nvim/              # Neovim (LazyVim)
│   │   ├── init.lua
│   │   ├── lua/config/    # Keymaps, options, autocmds
│   │   └── lua/plugins/   # Satu file per plugin
│   ├── lazygit/           # LazyGit config
│   ├── lazydocker/        # LazyDocker config
│   ├── superfile/         # Superfile config & hotkeys
│   ├── bat/               # bat theme (Catppuccin Mocha)
│   └── brave-flags.conf   # Flag Wayland untuk Brave
└── README.md
```

## Catatan

- **Backup dulu** — Kalau sudah ada config lama di `~/.config/`, backup sebelum `stow .` supaya tidak tertimpa.
- **Konflik stow** — Kalau ada error conflict, hapus/pindah file yang bentrok di `~/.config/` lalu ulangi `stow .`.
- **Uninstall** — Untuk cabut semua symlink: `cd ~/dotfiles && stow -D .`
