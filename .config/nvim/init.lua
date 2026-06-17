require("config.lazy")
require("oil").setup({
	default_file_explorer = true,
	columns = { "icon" },
	view_options = {
		show_hidden = true,
	},
	float = {
		padding = 2,
		preview_split = "right",
		max_width = math.floor(vim.o.columns * 0.8),
		max_height = math.floor(vim.o.lines * 0.8),
	},
})

vim.cmd.colorscheme("catppuccin-mocha")

-- Transparent main editing area only
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#89b4fa" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#d8a657" })

vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})

vim.filetype.add({
	extension = {
		jet = "html",
	},
})
