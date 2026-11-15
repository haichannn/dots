return {

  -- Catppuccin colorscheme
  -- https://github.com/catppuccin/nvim
  {
    "catppuccin/nvim",
    priority = 1000,
  },

  -- Onedarkpro colorscheme
  -- https://github.com/olimorris/onedarkpro.nvim
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-nvim",
    },
  },
}
