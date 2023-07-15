require("telescope").setup({
	defaults = {
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		prompt_prefix = "  > ",
		selection_caret = "  ",
		entry_prefix = "  ",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.65,
			},
			width = 0.9,
			height = 0.9,
			preview_cutoff = 80,
		},
		path_display = { "truncate" },
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "f", "-H", "-E", ".git" },
		},
	},
	extensions = {
		file_browser = {
			initial_mode = "normal",
		},
	},
})
