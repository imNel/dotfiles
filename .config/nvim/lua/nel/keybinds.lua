local set = vim.keymap.set
--
-- Launch telescope
set("n", "<C-p>", function()
	require("telescope.builtin").find_files()
end)
set("n", "<C-space>", "<cmd>Telescope live_grep <CR>")
set("n", "<leader>b", "<cmd>Telescope buffers<CR>")
set("n", "<leader>e", "<cmd>Ex<CR>")
-- set("n", "<leader>m", "<cmd>Telescope monorepo<CR>")
set("n", "<leader>m", function()
	require("telescope").extensions.monorepo.monorepo()
end)
set("n", "<leader>n", function()
	require("monorepo").toggle_project()
end)
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")
set("n", "J", "mzJ`z")

-- Keepin stuff centred
set("n", "<C-u>", "<C-u>zz")
set("n", "<C-d>", "<C-d>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- LSP Binds
set("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
set("n", "gh", function()
	vim.lsp.buf.hover({ silent = true })
end)
set("n", "gn", function()
	vim.lsp.buf.rename()
end)
set("n", "gr", "<cmd>Telescope lsp_references<CR>")
set("n", "gi", "<cmd>Telescope lsp_implementations<CR>")
set("n", "gl", function()
	vim.diagnostic.open_float()
end)
set("n", "gt", function()
	require("pretty-ts-errors").show_diagnostics({ silent = true })
end)
set("n", "<leader>f", function()
	vim.lsp.buf.format({
		async = true,
		filter = function(client)
			local ft = vim.bo.filetype
			if
				ft == "lua"
				or ft == "typescript"
				or ft == "typescriptreact"
				or ft == "javascript"
				or ft == "javascriptreact"
				or ft == "css"
				or ft == "scss"
				or ft == "json"
				or ft == "python"
			then
				return client.name == "null-ls"
			else
				return client.name
			end
		end,
	})
end)

-- Plugin Binds
set("n", "<leader>w", "<cmd>Telescope diagnostics<CR>")
set("n", "<leader>u", "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>")

-- Window Keybinds
set("n", "<C-w>z", "<cmd>:ZenMode<CR>")
set("n", "<C-h>", "<C-w>h")
set("n", "<C-j>", "<C-w>j")
set("n", "<C-k>", "<C-w>k")
set("n", "<C-l>", "<C-w>l")

-- System Clipboard
set("n", "<leader>y", '"+y')
set("v", "<leader>y", '"+y')
set("n", "<leader>Y", '"+Y')
-- Void Clipboard
set("x", "<leader>p", '"_dP')
set("n", "<leader>d", '"_d')
set("v", "<leader>d", '"_d')

-- Git
local g = "<leader>g"
set("n", g .. "", "<cmd>FloatermNew --name=lazygit --height=0.9 --width=0.9 lazygit<CR>")
-- set("n", g .. "s", "<cmd>Telescope git_status<CR>")
-- set("n", g .. "u", "<cmd>GitBlameOpenCommitURL<CR>")
-- set("n", g .. "?", "<cmd>GitBlameToggle<CR>")

set("n", "<leader><TAB>", "<cmd>Neorg workspace main<CR>")
set("n", "<leader><ESC>", "<cmd>Neorg return<CR>")

-- Harpoon
set("n", "<leader>h", function()
	require("harpoon.ui").toggle_quick_menu()
end)
set("n", "<leader>a", function()
	require("harpoon.mark").toggle_file()
end)
for i = 1, 9 do
	set("n", "<leader>" .. i, function()
		require("monorepo").go_to_project(i)
	end)
end

set("n", "<ESC>", "<cmd>:noh<CR><ESC>")
