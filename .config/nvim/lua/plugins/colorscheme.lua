return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			highlight_overrides = {
				all = function(colors)
					return {
						CursorLineNr = {
							fg = "#fab387",
							bg = colors.none,
							style = { "bold" },
						},
					}
				end,
			},
			flavour = "mocha",
			no_italic = false,
			transparent_background = true,
			styles = {
				comments = { "italic" },
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
		})
	end,
}
