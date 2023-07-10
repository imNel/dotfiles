local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("plugins.config.treesitter")
		end,
	},

	-- Theme
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-storm")
		end,
	},
	-- {
	-- 	"eddyekofo94/gruvbox-flat.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("gruvbox-flat")
	-- 	end,
	-- },
	"kyazdani42/nvim-web-devicons",
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("plugins.config.colorizer")
		end,
	},

	-- Autocomplete
	"onsails/lspkind.nvim",
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.config.cmp")
		end,
		dependencies = { { "hrsh7th/cmp-cmdline" } },
	},
	{
		"js-everts/cmp-tailwind-colors",
		config = function()
			require("cmp-tailwind-colors").setup({
				width = 1,
			})
		end,
	},

	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	-- LSP
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.config.lsp")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.config.null-ls")
		end,
	},
	"folke/neodev.nvim",
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("plugins.config.telescope")
		end,
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	"mbbill/undotree",
	{
		"anuvyklack/windows.nvim",
		dependencies = {
			"anuvyklack/middleclass",
		},
		config = function()
			require("windows").setup()
		end,
	},
	{
		"echasnovski/mini.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("mini.comment").setup({
				options = {
					custom_commentstring = function()
						return require("ts_context_commentstring.internal").calculate_commentstring()
							or vim.bo.commentstring
					end,
				},
			})
		end,
	},
	"ThePrimeagen/harpoon",
	"f-person/git-blame.nvim",
	-- Copilot
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = true,
	},
	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" },
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			char = "┊",
			show_trailing_blankline_indent = false,
		},
	},
	-- Dev Stuff
	{
		"imNel/pretty-ts-errors.nvim",
		dev = true,
	},
	{
		"imNel/monorepo.nvim",
		config = function()
			require("monorepo").setup({
				silent = false,
			})
		end,
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
}, {
	dev = { path = "~/Clones/plugins" },
})
