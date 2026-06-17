return {
  "echasnovski/mini.nvim",
  version = "*",
  config = function()
    require("mini.surround").setup()
    require("mini.pairs").setup()
    require("mini.files").setup({
      windows = {
        preview = true,
      },
    })
    local indentscope = require("mini.indentscope")
    indentscope.setup({
      draw = {
        animation = indentscope.gen_animation.linear({ duration = 100, unit = "total" }),
      },
    })
  end,
}
