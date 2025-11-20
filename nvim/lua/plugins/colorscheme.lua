return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		name = "kanagawa",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				undercurl = true,
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				transparency = true,
				theme = "wave",
				background = {
					dark = "wave",
					light = "lotus",
				},
			})
			vim.cmd.colorscheme("kanagawa")
		end,
	},
	{
		"crispybaccoon/evergarden",
		lazy = false,
		name = "evergarden",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("evergarden")
			require("evergarden").setup({
				contrast_dark = "medium",
				override_terminal = true,
				style = {
					tabline = { reverse = true, color = "green" },
					search = { rever = false, inc_rever = true },
					types = { italic = true },
					keyword = { italic = true },
					comment = { italic = false },
				},
			})
		end,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				auto_integrations = true,
				flavour = "frappe", -- latte, frappe, macchiato, mocha
				background = { dark = "frappe", light = "latte" },
				transparent_background = true,
				term_colors = true,
			})
		end,
	},
	{
		"tinted-theming/base16-vim",
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").setup({
				transparent = {
					bg = true,
					float = true,
				},
			})
		end,
	},
}
