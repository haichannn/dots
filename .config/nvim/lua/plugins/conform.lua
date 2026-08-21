return {
  -- formating filetype
  {
    "stevearc/conform.nvim",
    optional = true,
    opts =  {
      formatters_by_ft = {
        php = { { "pint" } },
        lua = { "stylua" },
      },
      default_format_opts = {
        lsp_fallback = true,
        async = false,
      },
    },
  },
}
