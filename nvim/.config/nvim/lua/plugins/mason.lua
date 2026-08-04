return {
	{
		"mason-org/mason.nvim",
		event = "VeryLazy",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		event = "VeryLazy",
		dependencies = { "mason-org/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				auto_install = true,
				automatic_enable = {
					exclude = { "elixirls", "ruff", "rust_analyzer", "hls" },
				},
				ensure_installed = {
					"lua_ls",
					"tailwindcss",
					"elixirls",
					"vtsls",
					"htmx",
					"templ",
					"gopls",
					"emmet_language_server",
					"eslint",
					"html",
					"pyright",
					"hls",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = "VeryLazy",
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
	},
	{
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
					timeout_ms = 30000,
					cwd = function()
						local filename = vim.api.nvim_buf_get_name(0)
						return vim.fs.root(filename, "mix.exs") or vim.fn.getcwd()
					end,
				},
			},
			format_on_save = function(bufnr)
				if vim.bo[bufnr].filetype == "elixir" then
					return { timeout_ms = 30000, lsp_fallback = true }
				end
				return { timeout_ms = 2000, lsp_fallback = true }
			end,
		},
	},
}
