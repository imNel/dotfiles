local if_nil = vim.F.if_nil

local default_terminal = {
	type = "terminal",
	command = nil,
	width = 69,
	height = 8,
	opts = {
		redraw = true,
		window_config = {},
	},
}
local ascii = {}
if vim.g.neovide then
	ascii = {
		[[ ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ █████▄ ▓█████ ]],
		[[ ██ ▀█  ▐█ ▓█   ▀ ▒██▒  ██▒ ██░  ▐█▒ ██▒ ██▀ ██▌▓█   ▀ ]],
		[[▓██  ▀█ ██ ▒███   ▒██░  ██▒ ▓██  █▒  ██▒ ██   █▌▒███   ]],
		[[▓██▒  ▐▌██ ▒▓█  ▄ ▒██   ██░  ▒██ █░ ░██░ ▓█▄   ▌▒▓█  ▄ ]],
		[[▒██░   ▓██ ░▒████▒░ ████▓▒░   ▒▀█░  ░██░ ▒████▓ ░▒████▒]],
		[[░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓   ▒▒▓  ▒ ░░ ▒░ ░]],
		[[░ ░░   ░ ▒  ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░ ░ ▒  ▒  ░ ░  ░]],
		[[   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░ ░ ░  ░    ░   ]],
		[[         ░    ░  ░    ░ ░        ░   ░     ░       ░  ░]],
		[[                                ░        ░             ]],
	}
else
	ascii = {
		[[ ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓]],
		[[ ██ ▀█  ▐█ ▓█   ▀ ▒██▒  ██▒ ██░  ▐█▒ ██▒ ██▒▀█▀ ██▒]],
		[[▓██  ▀█ ██ ▒███   ▒██░  ██▒ ▓██  █▒░ ██▒ ██    ▓██░]],
		[[▓██▒  ▐▌██ ▒▓█  ▄ ▒██   ██░  ▒██ █░  ██░ ██    ▒██ ]],
		[[▒██░   ▓██ ░▒████▒░ ████▓▒░   ▒▀█░  ░██░ ██▒   ░██▒]],
		[[░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓    ▒░   ░  ░]],
		[[░ ░░   ░ ▒  ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░   ░      ░]],
		[[   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░       ░   ]],
		[[         ░    ░  ░    ░ ░        ░   ░         ░   ]],
		[[                                ░                  ]],
	}
end

local default_header = {
	type = "text",
	val = ascii,
	opts = {
		position = "center",
		hl = "Type",
	},
}

local footer = {
	type = "text",
	val = "https://github.com/imNel/dotfiles",
	opts = {
		position = "center",
		hl = "Comment",
	},
}

local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 3,
		width = 50,
		align_shortcut = "right",
		hl_shortcut = "Keyword",
	}
	if keybind then
		keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_, keybind, keybind_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "t", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

local buttons = {
	type = "group",
	val = {
		-- button("e", "󰈔  New file", "<cmd>ene <CR>"),
		button("ctrl + p", "  Find files", "<cmd>Telescope find_files<CR>"),
		button("<leader> p", "  Find Projects", "<cmd>Telescope project<CR>"),
		button("<leader> e", "  Open File Explorer", "<cmd>Oil<CR>"),
		-- button("SPC f h", "Recently opened files"),
		-- button("SPC f r", "Frecency/MRU"),
		-- button("SPC f g", "Find word"),
		-- button("SPC f m", "Jump to bookmarks"),
		-- button("SPC s l", "Open last session"),
	},
	opts = {
		spacing = 1,
	},
}

local section = {
	terminal = default_terminal,
	header = default_header,
	buttons = buttons,
	footer = footer,
}

local config = {
	layout = {
		{ type = "padding", val = 2 },
		section.header,
		{ type = "padding", val = 2 },
		section.buttons,
		{ type = "padding", val = 1 },
		section.footer,
	},
	opts = {
		margin = 5,
	},
}

return {
	button = button,
	section = section,
	config = config,
	-- theme config
	leader = leader,
}
