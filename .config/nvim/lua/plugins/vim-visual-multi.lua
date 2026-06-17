return {
  "mg979/vim-visual-multi",
  branch = "master", -- optional, just to be explicit
  init = function()
    vim.g.VM_maps = {
      ["Find Under"] = "<C-n>",
      ["Find Subword Under"] = "<C-n>",
    }
  end,
}
