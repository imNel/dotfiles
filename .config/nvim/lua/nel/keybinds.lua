-- Launch telescopekey
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files <CR>")
vim.keymap.set("n", "<C-space>", "<cmd>Telescope live_grep <CR>")
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>Ex<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

-- Keepin stuff centred
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- LSP Binds
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
vim.keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>")
vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>")
vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end)
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({
		async = true,
		filter = function(client)
			return client.name ~= "tsserver"
		end,
	})
end)

-- Plugin Binds
vim.keymap.set("n", "<leader>w", "<cmd>Telescope diagnostics<CR>")
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>")

-- Window Keybinds
vim.keymap.set("n", "<C-w>z", "<cmd>:ZenMode<CR>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- System Clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
-- Void Clipboard
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- Git
local g = "<leader>g"
vim.keymap.set("n", g .. "b", "<cmd>Telescope git_branches<CR>")
vim.keymap.set("n", g .. "s", "<cmd>Telescope git_status<CR>")
vim.keymap.set("n", g .. "u", "<cmd>GitBlameOpenCommitURL<CR>")
vim.keymap.set("n", g .. "?", "<cmd>GitBlameToggle<CR>")

-- Harpoon
vim.keymap.set("n", "<leader>h", function()
	require("harpoon.ui").toggle_quick_menu()
end)
vim.keymap.set("n", "<leader>a", function()
	require("harpoon.mark").toggle_file()
end)
for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, function()
		require("harpoon.ui").nav_file(i)
	end)
end

vim.keymap.set("n", "<ESC>", "<cmd>:noh<CR><ESC>")
