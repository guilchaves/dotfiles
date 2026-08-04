local keymap = vim.keymap
local lsp = vim.lsp
local opts = { noremap = true, silent = true }

return {
	{
		"neovim/nvim-lspconfig",
		event = { "VeryLazy", "LspAttach" },
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.diagnostic.config({
				float = { border = "single" },
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then
						return
					end

					keymap.set("n", "K", lsp.buf.hover, vim.tbl_extend("force", opts, { buffer = bufnr }))
					keymap.set("n", "gd", lsp.buf.definition, vim.tbl_extend("force", opts, { buffer = bufnr }))
					keymap.set("n", "<leader>gr", lsp.buf.references, vim.tbl_extend("force", opts, { buffer = bufnr }))
					keymap.set(
						{ "i", "n" },
						"<C-s>",
						lsp.buf.signature_help,
						vim.tbl_extend("force", opts, { buffer = bufnr })
					)
					keymap.set("n", "<leader>rn", lsp.buf.rename, vim.tbl_extend("force", opts, { buffer = bufnr }))

					if client.name == "vtsls" then
						keymap.set("n", "<leader>co", function()
							vim.lsp.buf.code_action({
								apply = true,
								context = {
									only = { "source.organizeImports" },
									diagnostics = {},
								},
							})
						end, { buffer = bufnr, desc = "Organize Imports" })

						keymap.set("n", "<leader>cR", function()
							vim.lsp.buf.code_action({
								apply = true,
								context = {
									only = { "source.removeUnusedImports" },
									diagnostics = {},
								},
							})
						end, { buffer = bufnr, desc = "Remove Unused Imports" })
					end

					if client.name == "gopls" then
						keymap.set("n", "<leader>fs", function()
							vim.lsp.buf.code_action({
								context = { only = { "refactor.rewrite" } },
								apply = true,
							})
						end, { buffer = bufnr, desc = "Fill struct" })
					end
				end,
			})

			require("plugins.lsp.servers").setup(capabilities)
		end,
	},
}
