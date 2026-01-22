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
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				auto_integrations = true,
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				integrations = {
					all = true,
				},
				background = { dark = "mocha", light = "latte" },
				transparent_background = true,
				term_colors = true,
			})
		end,
	},
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({})
			require("bamboo").load()
		end,
	},
	{
		"rose-pine/neovim",
        name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				dark_variant = "main",
				disable_background = true,
				integrations = { all = true },
                styles = {
                    bold = true,
                    italic = true,
                    transparency = true,
                }
			})
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
