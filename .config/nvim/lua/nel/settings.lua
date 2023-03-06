local o = vim.opt
local g = vim.g

-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line Numbers
o.number = true
o.numberwidth = 4
o.relativenumber = true

-- Netrw
g.netrw_keepdir = 1
g.netrw_banner = 0
g.netrw_localcopydircmd = "cp -r"

-- Indentation
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

-- Window behaviour
o.splitright = true
o.splitbelow = true

-- Others
o.wrap = false
-- o.guicursor = "" -- Removes thin cursor
o.mouse = "a" -- Fixes mouse highlighting etc
o.scrolloff = 8
o.termguicolors = true
o.conceallevel = 2
o.concealcursor = ""

vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	signs = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		style = "minimal",
		source = "always",
		prefix = "",
		header = "",
	},
})

o.signcolumn = "yes"
