require("colorizer").setup({
	buftypes = {
		"*",
		-- exclude prompt and popup buftypes from highlight
		"!prompt",
		"!popup",
	},
	filetypes = {
		"*",
	},
	user_default_options = {
		names = false,
		tailwind = "both",
	},
})
