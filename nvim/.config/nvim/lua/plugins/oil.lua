return {
	"stevearc/oil.nvim",
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

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				local arg = vim.fn.argv(0)
				if arg and vim.fn.isdirectory(arg) == 1 then
					require("oil").open(arg)
				end
			end,
		})
	end,
}
