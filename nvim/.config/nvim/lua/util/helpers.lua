local M = {}

function M.apply_colors(color)
	color = color or "gruvbox-material"
	vim.cmd.colorscheme(color)
	vim.opt.signcolumn = "no"
	vim.cmd([[
		highlight CursorLineNr ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
	]])
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	M.color_lines()
end

function M.color_lines()
	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#45475a", bold = false })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#ca9ee6", bg = "#363a4f", bold = true })
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#45475a", bold = false })
end

return M
