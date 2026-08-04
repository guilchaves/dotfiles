return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		-- LazyVim config for treesitter
		indent = { enable = true },
		highlight = { enable = true },
		folds = { enable = true },
		ensure_installed = {
			"bash",
			"c",
			"css",
			"diff",
			"go",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"printf",
			"python",
			"query",
			"regex",
			"rust",
			"templ",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)

		vim.treesitter.language.register("javascript", "html")
	end,
}
