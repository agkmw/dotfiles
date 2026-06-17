return {
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			automatic_enable = {
				exclude = {
					"jdtls",
				},
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"gopls",
					"tailwindcss",
					"emmet_language_server",
					"intelephense",
					"clangd",
					"prismals",
				},
				automatic_enable = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				settings = {
					["ts_ls"] = {},
				},
			})

			vim.lsp.config("clangd", {
				command = {
					"clangd",
					"--fallback-style=webkit",
				},
			})

			vim.lsp.config("emmet_language_server", {
				capabilities = capabilities,
				filetypes = {
					"html",
					"css",
					"scss",
					"javascript",
					"javascriptreact",
					"typescriptreact",
					"svelte",
					"vue",
					"php",
					"jet",
					"tmpl",
					"template",
				},
				-- settings = {
				-- 	["emmet_language_server"] = {},
				-- },
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- "eslint_d",
					"stylua",
					"prettier",
					"php-cs-fixer",
					"clang-format",
				},
				auto_update = false,
				run_on_start = true,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			async = true,
			formatters_by_ft = {
				php = { "php-cs-fixer" },
				cs = { "csharpier_k" },
				csproj = { "csharpier_k" },
                sql = { "sleek" },
			},
			formatters = {
				csharpier_k = {
					command = "csharpier",
					args = {
						"format",
						"--write-stdout",
					},
					to_stdin = true,
				},
				["php-cs-fixer"] = {
					command = "php-cs-fixer",
					args = {
						"fix",
						"--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
						"$FILENAME",
					},
					stdin = false,
				},
                sleek = {
                    command = "sleek",
                    args = {
                        "--uppercase=true",
                    },
                }
			},
			notify_on_error = true,
		},
	},
	{ "mfussenegger/nvim-jdtls" },
	{
		"seblyng/roslyn.nvim",
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {
			-- your configuration comes here; leave empty for default settings
		},
		ft = { "cs", "razor" },
	},
}
