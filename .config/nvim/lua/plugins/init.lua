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
	"nvim-treesitter/playground",

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
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.config.comment")
		end,
	},
	"JoosepAlviste/nvim-ts-context-commentstring",
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
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				window = {
					backdrop = 1,
				},
			})
		end,
	},
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("plugins.config.noice")
		end,
	},
	"ThePrimeagen/harpoon",
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
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
	"voldikss/vim-floaterm",

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
		dev = true,
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			-- require("mini.pairs").setup()
			require("mini.statusline").setup()
		end,
	},
}, {
	dev = { path = "~/Clones/plugins" },
})
