require("telescope").setup({
	defaults = {
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		prompt_prefix = "   ",
		selection_caret = "  ",
		entry_prefix = "  ",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.65,
			},
			width = 0.9,
			height = 0.9,
			preview_cutoff = 120,
		},
		path_display = { "truncate" },
	},
	extensions = {
		file_browser = {
			initial_mode = "normal",
		},
	},
})
