return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      background_colour = "#000000",
      stages = "fade",
    })
    vim.keymap.set("n", "<leader>nd", function()
      require("notify").dismiss({ silent = true, pending = true })
    end, { desc = "Clear Notifications" })
    vim.notify = require("notify")
  end,
}
