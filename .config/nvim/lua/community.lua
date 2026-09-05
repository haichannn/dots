-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Languages
  { import = "astrocommunity.pack.lua" },

  -- Themes
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },

  -- { import = "astrocommunity.colorscheme.tokyonight-nvim" },

  -- Tools
  { import = "astrocommunity.docker.lazydocker" },
  { import = "astrocommunity.test.neotest" },

  -- Other
  { import = "astrocommunity.color.transparent-nvim" },
  -- { import = "astrocommunity.indent.indent-rainbowline" },

  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity.recipes.vscode-icons" },
}
