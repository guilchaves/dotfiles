return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			python = { "ruff_organize_imports", "ruff_format" },
			go = { "gofmt", "golines" },
			elixir = { "mix" },
		},
		formatters = {
			mix = {
				timeout_ms = 10000,
				cwd = function()
					return vim.fs.root(0, "mix.exs") or vim.fn.getcwd()
				end,
			},
		},
		format_on_save = function(bufnr)
			if vim.bo[bufnr].filetype == "elixir" then
				return { timeout_ms = 10000, lsp_fallback = true }
			end
			return { timeout_ms = 2000, lsp_fallback = true }
		end,
	},
}
