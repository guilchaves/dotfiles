local keymap = vim.keymap
local lsp = vim.lsp
local opts = { noremap = true, silent = true }

return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				auto_install = true,
				automatic_enable = {
					-- ruff is installed via mason-tool-installer only for formatting (conform.nvim)
					exclude = { "elixirls", "ruff" },
				},
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
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
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local _border = "single"

			vim.diagnostic.config({
				float = { border = _border },
			})

			-- Global LSP keymaps applied on every LspAttach
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

					-- vtsls specific keymaps
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

					-- gopls specific keymaps
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

			-- lua_ls
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			vim.lsp.enable("lua_ls")

			-- elixirls
			vim.lsp.config("elixirls", {
				cmd = { vim.fn.stdpath("data") .. "/mason/bin/elixir-ls" },
				capabilities = capabilities,
			})
			vim.lsp.enable("elixirls")

			-- tailwindcss
			vim.lsp.config("tailwindcss", {
				capabilities = capabilities,
				filetypes = { "templ", "javascript", "typescript", "typescriptreact", "javascriptreact", "html" },
				settings = {
					tailwindCSS = {
						includeLanguages = {
							"html",
							"javascript",
							"javascriptreact",
							"typescript",
							"typescriptreact",
						},
						classFunctions = { "cva", "cx" },
					},
				},
			})
			vim.lsp.enable("tailwindcss")

			-- templ
			vim.lsp.config("templ", {
				cmd = { "templ", "lsp" },
				filetypes = { "html", "templ" },
				capabilities = capabilities,
			})
			vim.lsp.enable("templ")

			-- Função templ_format (mantida separada)
			local templ_format = function()
				local bufnr = vim.api.nvim_get_current_buf()
				local filename = vim.api.nvim_buf_get_name(bufnr)
				local cmd = "templ fmt " .. vim.fn.shellescape(filename)

				vim.fn.jobstart(cmd, {
					on_exit = function()
						if vim.api.nvim_get_current_buf() == bufnr then
							vim.cmd("e!")
						end
					end,
				})
			end

			-- htmx
			vim.lsp.config("htmx", {
				cmd = { "htmx-lsp" },
				capabilities = capabilities,
			})
			vim.lsp.enable("htmx")

			-- html
			vim.lsp.config("html", {
				filetypes = { "html", "templ" },
				capabilities = capabilities,
			})
			vim.lsp.enable("html")

			-- vtsls
			vim.lsp.config("vtsls", {
				capabilities = capabilities,
				settings = {
					complete_function_calls = true,
					vtsls = {
						enableMoveToFileCodeAction = true,
						autoUseWorkspaceTsdk = true,
						experimental = {
							maxInlayHintLength = 30,
							completion = {
								enableServerSideFuzzyMatch = true,
							},
						},
					},
					typescript = {
						updateImportsOnFileMove = { enabled = "always" },
						suggest = {
							completeFunctionCalls = true,
							includeCompletionsForModuleExports = true,
							includeAutomaticOptionalChainCompletions = true,
						},
						inlayHints = {
							enumMemberValues = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							parameterNames = { enabled = "all" },
							parameterTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							variableTypes = { enabled = true },
						},
					},
					javascript = {
						suggest = {
							completeFunctionCalls = true,
							includeCompletionsForModuleExports = true,
							includeAutomaticOptionalChainCompletions = true,
						},
						inlayHints = {
							enumMemberValues = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							parameterNames = { enabled = "all" },
							parameterTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							variableTypes = { enabled = true },
						},
					},
				},
			})
			vim.lsp.enable("vtsls")

			-- eslint
			vim.lsp.config("eslint", {
				capabilities = capabilities,
				root_markers = {
					".eslintrc",
					".eslintrc.js",
					".eslintrc.cjs",
					".eslintrc.yaml",
					".eslintrc.yml",
					".eslintrc.json",
					"eslint.config.js",
					"eslint.config.mjs",
					"eslint.config.cjs",
					"eslint.config.ts",
					"eslint.config.mts",
					"eslint.config.cts",
					"package.json",
					".git",
				},
			})
			vim.lsp.enable("eslint")

			-- gopls
			vim.lsp.config("gopls", {
				capabilities = capabilities,
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						deepCompletion = true,
						linkTarget = "gopls",
						analyses = {
							unusedparams = true,
							useany = true,
							fillstruct = true,
						},
						staticcheck = true,
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				},
			})
			vim.lsp.enable("gopls")

			-- emmet_language_server
			vim.lsp.config("emmet_language_server", {
				filetypes = {
					"css",
					"html",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
				},
			})
			vim.lsp.enable("emmet_language_server")

			-- pyright
			vim.lsp.config("pyright", {
				capabilities = capabilities,
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
							typeCheckingMode = "basic",
						},
					},
				},
			})
			vim.lsp.enable("pyright")
		end,
	},
}
