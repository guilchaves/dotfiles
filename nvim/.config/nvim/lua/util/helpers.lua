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
	local config = vim.fn["gruvbox_material#get_configuration"]()
	local palette = vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)
	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = palette.bg5[1], bold = false })
	vim.api.nvim_set_hl(0, "LineNr", { fg = palette.yellow[1], bg = palette.bg2[1], bold = true })
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = palette.bg5[1], bold = false })
end

return M
