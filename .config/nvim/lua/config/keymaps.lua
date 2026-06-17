vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local buf = args.buf
		local opts = { buffer = buf }

		vim.keymap.set("n", "<S-k>", vim.lsp.buf.hover, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<S-h>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>crn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>crf", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
		vim.keymap.set("n", "<leader>vds", vim.lsp.buf.document_symbol, opts)
	end,
})

-- todo-comments
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- Navigate between windows
vim.keymap.set("n", "<M-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<M-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<M-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<M-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<M-m>", "<C-w><S-t>", { desc = "Maximize the window" })
vim.keymap.set("n", "<leader><Tab>", "gt", { desc = "Move to another tab" })
vim.keymap.set("n", "<leader>rw", "<C-w>r<C-w>w", { desc = "Rotate windows and switch focus" })

-- Navigate through buffers
-- vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
-- vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

-- Replace the word under cursor
vim.keymap.set(
	"n",
	"<leader>s",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ desc = "Substitute word under cursor" }
)

-- Yank from cursor to end of line (like D/C)
vim.keymap.set("n", "Y", "yg$", { desc = "Yank to end of line" })

-- Move selected text down/up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })

-- Append line below to current line with cursor position preserved
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines (keep cursor)" })

-- Centered scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })

-- Center search results
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })

-- Paste over selection without losing register content
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })

-- Delete to void register
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Escape insert mode
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })

-- Disable Q
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })

-- Format current buffer
-- vim.keymap.set("n", "<leader>f", function()
-- 	vim.lsp.buf.format()
-- end, { desc = "Format buffer with LSP" })

-- Quickfix and location list navigation
vim.keymap.set("n", "<S-l>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "<S-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })
vim.keymap.set("n", "<S-d>", "<cmd>lnext<CR>zz", { desc = "Next location list item" })
vim.keymap.set("n", "<S-s>", "<cmd>lprev<CR>zz", { desc = "Previous location list item" })

-- Make current file executable
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Close current buffer
vim.keymap.set("n", "<leader>co", "<C-w>o", { desc = "Close all windows and focus on the current one" })
vim.keymap.set("n", "<leader>cw", "<C-w>c", { desc = "Close window" })
vim.keymap.set("n", "<leader>w", "<C-w>w", { desc = "Move to another window" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal to Normal mode" })
vim.keymap.set("t", "<C-q>", "<Esc>", { desc = "Send Esc to terminal" })
vim.keymap.set("n", "<leader><leader>q", ":q<CR>", { silent = true, desc = "Quit" })
vim.keymap.set("n", "<leader><leader>w", ":w<CR>", { silent = true, desc = "Write" })

vim.keymap.set("n", "<leader>bdf", ":bd!<CR>", { desc = "Force close buffer" })
vim.keymap.set("n", "<leader>bdn", ":bd<CR>", { desc = "Force close buffer" })

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

vim.keymap.set("n", "<leader>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 10)
end)

vim.keymap.set("i", "<C-]>", "<C-w>", { desc = "Delete previous word" })
vim.keymap.set("n", "<leader>ew", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
vim.keymap.set(
	"n",
	"<leader>ef",
	":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>",
	{ silent = true, desc = "Open" }
)

vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
	if not require("noice.lsp").scroll(4) then
		return "<c-f>"
	end
end, { silent = true, expr = true })

vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
	if not require("noice.lsp").scroll(-4) then
		return "<c-b>"
	end
end, { silent = true, expr = true })

vim.keymap.set("n", "<leader><leader>r", "<CMD>LspRestart<CR>", { desc = "Restart LSP" })
vim.keymap.set("n", "<leader><leader>s", "<CMD>split<CR>", { desc = "Horizontally split window" })

vim.keymap.set("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end)
