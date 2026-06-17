return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    -- local eslint = require("none-ls.diagnostics.eslint_d")
    -- eslint.with({
    --   extra_args = { "--config", "./eslint.config.mjs" },
    -- })

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.completion.spell,
        -- eslint,
      },
    })

    vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "Format buffer" })
  end,
}
