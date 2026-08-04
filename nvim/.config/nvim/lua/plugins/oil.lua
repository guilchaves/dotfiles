local arg = vim.fn.argv(0)
local open_directory = arg and vim.fn.isdirectory(arg) == 1

return {
	"stevearc/oil.nvim",
	lazy = not open_directory,
	priority = open_directory and 1000 or nil,
	cmd = "Oil",
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
	},
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			view_options = {
				show_hidden = true,
			},
		})

		if open_directory then
			require("oil").open(arg)
		end
	end,
}
