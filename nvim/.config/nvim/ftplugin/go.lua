vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

vim.keymap.set("n", "<leader>er", function()
	vim.api.nvim_put({
		"  if err != nil {",
		"    return",
		"  }",
	}, "l", true, true)
end, { desc = "Insert Go error check", buffer = true })
