require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"tsserver",
	},
})

require("neodev").setup()

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_attach = function(client, bufnr)
	-- Create your keybindings here...
end

require("lspconfig").gdscript.setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
})

require("lspconfig").kotlin_language_server.setup({
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
})
require("lspconfig").intelephense.setup({
	settings = {
		intelephense = {
			stubs = {
				"wordpress",
				"wordpress-globals",
				"wp-cli",
			},
			environment = {
				includePaths = "/home/your-user/.composer/vendor/php-stubs/", -- this line forces the composer path for the stubs in case inteliphense don't find it...
			},
			files = {
				maxSize = 5000000,
			},
		},
	},
})

local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = lsp_attach,
			capabilities = lsp_capabilities,
		})
	end,
})
