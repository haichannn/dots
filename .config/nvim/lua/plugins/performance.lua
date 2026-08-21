return {
  -- Disable some heavy default LazyVim plugins if not needed
  {
    "folke/flash.nvim",
    enabled = true,
  },

  -- Optimize treesitter parsing
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "html",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "php",
        "blade",
      },
      sync_install = false,
      ignore_install = { "all" },
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      },
    },
  },

  -- Lazy-load which-key (not needed immediately)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },

  -- Disable gitsigns if on slow filesystem
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs_staged_enable = false,
      word_diff = false,
    },
  },
}
