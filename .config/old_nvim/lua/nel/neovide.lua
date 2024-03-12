-- Add keybinds that a terminal emulator would usually have
vim.keymap.set("n", "<D-s>", ":w<CR>")
vim.keymap.set("v", "<D-c>", '"+y')
vim.keymap.set("n", "<D-v>", '"+P')
vim.keymap.set("v", "<D-v>", '"+P')
vim.keymap.set("c", "<D-v>", "<C-R>+")
vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli')

vim.g.neovide_refresh_rate = 120
vim.g.neovide_refresh_rate_idle = 5
vim.o.guifont = "Twilio Sans Mono:h16"

-- Transparency formatting
local alpha = function()
	return string.format("%x", math.floor(255 * vim.g.neovide_transparency_point))
end
vim.g.neovide_transparency = 0.0
vim.g.neovide_transparency_point = 0.75
vim.g.neovide_background_color = "#24283b" .. alpha()
