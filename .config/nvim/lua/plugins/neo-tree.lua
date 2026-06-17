return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	config = function()
		vim.keymap.set(
			"n",
			"<leader>ee",
			":Neotree filesystem toggle right<CR>",
			{ silent = true, desc = "Toggle Neo-tree" }
		)

		require("neo-tree").setup({
			close_if_last_window = true,
			window = {
				mappings = {
					["P"] = {
						"toggle_preview",
						config = {
							use_float = false,
						},
					},
				},
				width = 30,
			},
			filesystem = {
				hijack_netrw_behavior = "disabled",
				filtered_items = {
					visible = true,
					hide_dotfiles = true,
					hide_gitignored = true,
					hide_hidden = true,
					hide_by_name = {
						--"node_modules"
					},
				},
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
			},
		})
	end,
}
