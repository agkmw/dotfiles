vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.scrolloff = 13

vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

-- vim.opt.colorcolumn = "80"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↪  "

vim.opt.swapfile = false
vim.opt.backup = false

local home = os.getenv("HOME") or os.getenv("USERPROFILE") or "/tmp"
vim.opt.undodir = home .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.fileformat = "unix"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
	vim.o.shell = "pwsh.exe"
	vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
end

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	float = {
		border = "rounded",
		severity_sort = true,
		scope = "line",
	},
})
vim.keymap.set("n", "<leader>od", function()
	vim.diagnostic.config({ virtual_text = false })
	vim.diagnostic.open_float()

	vim.api.nvim_create_autocmd("CursorMoved", {
		buffer = 0,
		group = vim.api.nvim_create_augroup("line-diagnostics", { clear = true }),
		callback = function()
			vim.diagnostic.config({ virtual_text = true })
			return true
		end,
	})
end, { desc = "Open diagnostics float and disable virtual text temporarily" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		-- vim.opt.clipboard = "unnamedplus"
		--
		-- if vim.fn.has("wsl") == 1 then
		-- 	vim.g.clipboard = {
		-- 		name = "win32yank-wsl",
		-- 		copy = {
		-- 			["+"] = "win32yank.exe -i --crlf",
		-- 			["*"] = "win32yank.exe -i --crlf",
		-- 		},
		-- 		paste = {
		-- 			["+"] = "win32yank.exe -o --lf",
		-- 			["*"] = "win32yank.exe -o --lf",
		-- 		},
		-- 		cache_enabled = 0,
		-- 	}
		-- else
		-- end
        vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"help",
		"alpha",
		"dashboard",
		"neo-tree",
		"Trouble",
		"lazy",
		"mason",
		"notify",
	},
	callback = function()
		vim.b.miniindentscope_disable = true
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local excluded_filetypes = { "log" }
		local buf = args.buf
		local ft = vim.bo[buf].filetype

		if vim.tbl_contains(excluded_filetypes, ft) then
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			vim.schedule(function()
				if client ~= nil then
					vim.lsp.buf_detach_client(buf, client.id)
				end
			end)
		end
	end,
})

vim.o.fillchars = "fold: ,vert:│,eob: ,msgsep:‾"

vim.lsp.config("roslyn", {})
