return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "mason-org/mason.nvim" },
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"ruff",
				"stylua",
				"prettierd",
				"golines",
			},
			auto_update = true,
			run_on_start = true,
		})
	end,
}
