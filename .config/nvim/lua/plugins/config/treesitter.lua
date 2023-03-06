require("nvim-treesitter.configs").setup({
	-- ensure installed: typescript rust lua
	ensure_installed = { "typescript", "rust", "lua", "tsx", "javascript", "json" },
	sync_install = false,
	auto_install = true,
	ignore_install = { "phpdoc" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	context_commentstring = {
		enable = true,
	},
})
