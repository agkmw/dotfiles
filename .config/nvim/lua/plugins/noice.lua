return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				hover = {
					view = "hover",
				},
				signature = {
					view = "hover",
				},
			},
			presets = {
				bottom_search = false,
				command_palette = false,
				long_message_to_split = false,
				inc_rename = false,
			},
			views = {
				cmdline_popup = {
					position = {
						row = 7,
						col = "50%",
					},
					size = {
						width = math.floor(vim.o.columns * 0.5),
						height = "auto",
					},
				},
				popupmenu = {
					relative = "editor",
					position = {
						row = 8,
						col = "50%",
					},
					size = {
						width = 60,
						height = 10,
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
					},
				},
				hover = {
					size = {
						max_height = 8,
						max_width = 80,
					},
					border = {
						style = "rounded",
						padding = { 0, 2 },
					},
					position = { row = 2, col = 2 },
				},
			},
		})
	end,
}
