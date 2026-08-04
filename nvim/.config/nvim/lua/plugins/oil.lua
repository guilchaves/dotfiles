local arg = vim.fn.argv(0)
local load_on_vimenter = arg and vim.fn.isdirectory(arg) == 1

return {
	"stevearc/oil.nvim",
	event = load_on_vimenter and "VimEnter" or nil,
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

		if load_on_vimenter then
			require("oil").open(arg)
		end
	end,
}
