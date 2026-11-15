-- Requirements before plugin
--
-- Zoxide must be installed on your computer
-- nvim-telescope 


return {
  "jvgrootveld/telescope-zoxide",
  dependencies = {
    "nvim-telescope/telescope.nvim",

    config = function()
      local telescope = require "telescope"

      -- Load extensions zoxide kedalam telescope
      telescope.load_extension "zoxide"

      -- Keymaps trigger zoxide
      vim.keymap.set("n", "<leader>fz", telescope.extensions.zoxide.list, {
        desc = "Zoxide search file | directory",
      })
    end,
  },
}
