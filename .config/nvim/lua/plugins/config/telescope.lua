local project_actions = require("telescope._extensions.project.actions")
local action_state = require("telescope.actions.state")

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
		project = {
      base_dirs = {
        {'~/dotfiles'},
        {'~/Diversus', max_depth = 3},
        {'~/Clones', max_depth = 3},
      },
			on_project_selected = function(prompt_bufnr)
				-- Change dir to the selected project
				project_actions.change_working_directory(prompt_bufnr, false)

				-- Change monorepo directory to the selected project
				local selected_entry = action_state.get_selected_entry(prompt_bufnr)
				require("monorepo").change_monorepo(selected_entry.value)

	      require("telescope").extensions.monorepo.monorepo()
			end,
		},
	},
})

require("telescope").load_extension("project")
