require("guilchaves.set")
require("guilchaves.keymaps")
require("guilchaves.macros")
require("guilchaves.helpers")
require("guilchaves.go_macros")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

vim.api.nvim_set_keymap("n", "<leader>cq", ':lua require("guilchaves.macros").insert_quack_log()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>q", ':lua require("guilchaves.macros").insert_quack()<CR>', { noremap = true, silent = true })

require("lazy").setup("plugins")
color = "catppuccin"
-- color = "embark"
ColorMyPencils(color)
