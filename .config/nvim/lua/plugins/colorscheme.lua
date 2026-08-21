return {

  -- Catppuccin colorscheme
  -- {
  --   "catppuccin/nvim",
  --   lazy = true,
  -- },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark"
    },
  },
}
