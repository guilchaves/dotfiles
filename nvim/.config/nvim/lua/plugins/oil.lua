return {
	"stevearc/oil.nvim",
	event = "VimEnter",
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

		local arg = vim.fn.argv(0)
		if arg and vim.fn.isdirectory(arg) == 1 then
			require("oil").open(arg)
		end
	end,
}
