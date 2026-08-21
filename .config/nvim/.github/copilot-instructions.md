# Copilot Instructions for LazyVim Configuration

This is a [LazyVim](https://www.lazyvim.org) Neovim configuration repository. LazyVim is an opinionated, extensible Neovim configuration using the lazy.nvim plugin manager.

## Project Structure

```
lua/
├── config/          # Core Neovim configuration
│   ├── lazy.lua     # Plugin manager setup and plugin specs
│   ├── options.lua  # Vim options and global settings
│   ├── keymaps.lua  # Keybindings (loaded by LazyVim core)
│   └── autocmds.lua # Autocommands (loaded by LazyVim core)
└── plugins/         # Custom plugin specs and overrides
    ├── colorscheme.lua    # Theme configuration
    ├── example.lua        # Example plugin configuration (disabled by return {})
    ├── emmet-ls.lua       # Emmet language server
    ├── tailwind.lua       # Tailwind CSS integration
    └── ...
```

## High-Level Architecture

**LazyVim Stack:**
- **Plugin Manager**: lazy.nvim handles lazy-loading and plugin management
- **Base Configuration**: LazyVim provides sensible defaults (see https://github.com/LazyVim/LazyVim/tree/main/lua/lazyvim/config)
- **Customization Approach**: This repo overrides and extends LazyVim through plugin specs and config files
- **Extras System**: LazyVim "extras" enable feature sets (specified in `lazyvim.json`):
  - Language support: TypeScript, PHP, JSON, Markdown
  - AI: GitHub Copilot
  - Testing, UI enhancements, editor tools (fzf, inc-rename, snacks picker)

**Plugin Specifications Format:**
Plugin specs follow lazy.nvim's format: a table with plugin URL, options, keymaps, events, etc. Each file in `lua/plugins/` returns a spec table that gets merged with LazyVim's base plugins.

## Key Configuration Patterns

### 1. **Plugin Spec Structure** (in `lua/plugins/`)
Specs use lazy.nvim's declarative format to add, disable, or override plugins:

```lua
return {
  {
    "plugin-author/plugin-name",
    opts = { ... },              -- Options merged into plugin config
    keys = { ... },              -- Keybindings
    event = "...",               -- Lazy-load on event
    enabled = true/false,        -- Toggle plugin on/off
  },
}
```

### 2. **Overriding LazyVim Plugins**
To modify a LazyVim plugin, reference it by its GitHub URL or name and provide new options. Options are deep-merged (or overwritten if using `opts = function(_, opts)`).

### 3. **Configuration Files** (`lua/config/`)
- **options.lua**: Set `vim.opt.*` and `vim.g.*` (e.g., relative line numbers)
- **keymaps.lua**: Custom keybindings
- **autocmds.lua**: Autocommands and event handlers
- All are automatically loaded before LazyVim plugins initialize

### 4. **Current Customizations**
- **Disabled**: AI autocompletion (`vim.g.ai_cmp = false`), autoformatting (`vim.g.autoformat = false`)
- **Formatting**: PHP uses Pint, Lua uses StyLua, Blade uses blade-formatter
- **Language Support**: PHP, TypeScript, Blade templating with respective LSPs
- **Tools**: Mason ensures StyLua, Phpactor, blade-formatter are installed
- **Colorscheme**: Managed via `plugins/colorscheme.lua`

## Tools & Commands

### Formatting
- **Format current buffer**: `:Format` (from conform.nvim, if autoformat disabled)
- **Lua**: StyLua (configured in `lua/plugins/`)
- **PHP**: Pint formatter via conform.nvim
- **Blade Templates** (.blade.php): blade-formatter (configured in `lua/plugins/blade.lua`)
  - Automatically installed via Mason
  - Supports HTML, PHP, and Blade-specific syntax

### Linting
- LSP diagnostics available per language; enable Trouble with `:Trouble`
- **Disable Trouble plugin**: Set `enabled = false` in plugin spec

### Plugin & Configuration Management
- **Update plugins**: `:Lazy update` (in Neovim)
- **Install plugins**: `:Lazy install`
- **Check plugin health**: `:Lazy health`
- **Reload config**: `:so %` (reload Lua file) or restart Neovim

### Testing
- LazyVim includes `lazyvim.plugins.extras.test.core` for test running
- Language-specific test runners configured per LSP/language

## Adding New Plugins or Overrides

1. **Create a new spec file** in `lua/plugins/` (e.g., `my-plugin.lua`)
2. **Return a spec table** following lazy.nvim structure
3. **Automatic loading**: lazy.nvim loads all specs from `lua/plugins/` directory
4. **Examples**:
   - Add a new plugin: `{ "author/plugin-name", opts = {...} }`
   - Override LazyVim plugin: Reference by URL, provide new `opts`
   - Disable a plugin: `{ "author/plugin-name", enabled = false }`

## Enabled LazyVim Extras

See `lazyvim.json` for active feature sets:
- **AI**: GitHub Copilot integration
- **Languages**: TypeScript (vtsls), PHP, JSON, Markdown
- **Editors**: FZF picker, inc-rename, snacks picker
- **Coding**: nvim-cmp (completion), yanky (yank history)
- **Test**: Core test utilities

To enable/disable extras, modify `lazyvim.json` and run `:Lazy sync`.

## Blade Template Configuration

Blade templates (.blade.php) have dedicated support configured in `lua/plugins/blade.lua`:

### Features
- **Formatting**: blade-formatter (automatic on `:Format` or with autoformat enabled)
- **Language Server**: phpactor supports Blade files for completions and diagnostics
- **Emmet Support**: Emmet LS configured for HTML/CSS snippets in Blade templates
- **Syntax Highlighting**: Treesitter parser for proper Blade syntax highlighting

### Installation
- **blade-formatter**: Automatically installed via Mason
- **Command**: `:Format` formats .blade.php files using blade-formatter

### Configuration Details
See `lua/plugins/blade.lua` for:
- Mason ensure_installed list
- conform.nvim formatter setup
- LSP server configuration (phpactor, emmet_ls)
- Treesitter parser setup

## Style & Formatting

- **Lua files**: StyLua (configured in `stylua.toml`)
- **Configuration paradigm**: Declarative plugin specs > imperative Vim commands
- **Comments**: Use `stylua: ignore` pragmas to exempt code from StyLua formatting

## Troubleshooting

- **Plugins not loading**: Check `:Lazy` status and `:Lazy show <plugin-name>`
- **LSP not working**: Verify language extra is enabled in `lazyvim.json` and run `:Mason` to install language servers
- **Formatting issues**: Ensure conform.nvim formatters are installed via `:Mason`
- **Keybindings not working**: Check `lua/config/keymaps.lua` and LazyVim's default keymaps (`:nmap`, `:vmap`)

## Performance Optimization

This configuration has been optimized for fast startup:

### Disabled Extras (to reduce startup time)
- Snacks picker (replaced by fzf)
- Inc-rename (minimal use case)
- Yanky (yank history - not essential)
- Mini-hipatterns (visual enhancement, not essential)
- Markdown support (not used in this workflow)
- TypeScript vtsls (reduces LSP overhead)

**Reduced from 13 extras to 7 extras** ✅

### Startup Optimizations (`lua/config/options.lua`)
```lua
-- Disable unused language providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0

-- Use LSP instead of netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
```

### Plugin-Level Optimizations (`lua/plugins/performance.lua`)
- **Copilot**: Lazy-loaded on first insert mode (instead of at startup)
- **Treesitter**: Disables highlighting for files > 100KB
- **Which-key**: Loaded on `VeryLazy` event
- **Gitsigns**: Disabled word_diff (performance heavy)

### Active Extras (Essential Only)
- ✅ Copilot (AI assistance)
- ✅ nvim-cmp (basic completion)
- ✅ fzf (fast file/buffer search)
- ✅ JSON (language support)
- ✅ PHP (language support)
- ✅ TypeScript (language support)
- ✅ Test runner (core)

## Useful References

- [LazyVim Documentation](https://www.lazyvim.org)
- [lazy.nvim Plugin Spec Format](https://github.com/folke/lazy.nvim#-plugin-spec)
- [Neovim API](https://neovim.io/doc/user/api.html)
