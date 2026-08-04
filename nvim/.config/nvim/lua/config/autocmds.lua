local web_filetypes = {
	"css",
	"html",
	"htmx",
	"javascript",
	"javascriptreact",
	"scss",
	"typescript",
	"typescriptreact",
	"prisma",
	"ruby",
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = web_filetypes,
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

