require("core.set")
require("core.keymaps")
require("core.macros")
require("core.helpers")
require("core.go_macros")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.opt.splitright = true
vim.o.winborder = "single"

vim.api.nvim_set_keymap(
	"n",
	"<leader>cq",
	':lua require("core.macros").insert_quack_log()<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>q",
	':lua require("core.macros").insert_quack()<CR>',
	{ noremap = true, silent = true }
)

require("lazy").setup("plugins")
color = "gruvbox-material"
ColorMyPencils(color)
