local keymap = vim.keymap
local lsp = vim.lsp
local opts = { noremap = true, silent = true }

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				auto_install = true,
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"tailwindcss",
					"elixirls",
					"ts_ls",
					"htmx",
					"templ",
					"gopls",
					"emmet_language_server",
					"angularls",
					"eslint",
					"html",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local util = require("lspconfig.util")
			local _border = "single"

			local on_attach = function(client, bufnr) end

			local ok, mason_registry = pcall(require, "mason-registry")
			local angularls_cmd = { "ngserver", "--stdio" }

			if ok then
				local success, pkg = pcall(mason_registry.get_package, mason_registry, "angular-language-server")
				if success and pkg then
					-- Tenta usar get_install_path() se existir, senão usa install_path
					local install_path = nil
					if type(pkg.get_install_path) == "function" then
						install_path = pkg:get_install_path()
					elseif pkg.install_path then
						install_path = pkg.install_path
					end

					if install_path then
						angularls_cmd = {
							"ngserver",
							"--stdio",
							"--tsProbeLocations",
							table.concat({
								install_path,
								vim.uv.cwd(),
							}, ","),
							"--ngProbeLocations",
							table.concat({
								install_path .. "/node_modules/@angular/language-server",
								vim.uv.cwd(),
							}, ","),
						}
					end
				end
			end

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = _border,
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = _border,
			})

			vim.diagnostic.config({
				float = { border = _border },
			})

			-- lua_ls
			vim.lsp.config("lua_ls", {
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				root_markers = {
					".luarc.json",
					".luarc.jsonc",
					".luacheckrc",
					".stylua.toml",
					"stylua.toml",
					"selene.toml",
					"selene.yml",
					".git",
				},
				capabilities = capabilities,
			})
			vim.lsp.enable("lua_ls")

			-- elixirls
			vim.lsp.config("elixirls", {
				cmd = { vim.fn.expand("~/.bin/elixir-ls/language_server.sh") },
				filetypes = { "elixir", "eelixir", "heex", "surface" },
				root_markers = { "mix.exs", ".git" },
				capabilities = capabilities,
			})
			vim.lsp.enable("elixirls")

			-- tailwindcss
			vim.lsp.config("tailwindcss", {
				cmd = { "tailwindcss-language-server", "--stdio" },
				filetypes = { "templ", "javascript", "typescript", "typescriptreact", "javascriptreact", "html" },
				root_markers = {
					"tailwind.config.js",
					"tailwind.config.cjs",
					"tailwind.config.mjs",
					"tailwind.config.ts",
					"postcss.config.js",
					"postcss.config.cjs",
					"postcss.config.mjs",
					"postcss.config.ts",
					"package.json",
					"node_modules",
					".git",
				},
				capabilities = capabilities,
				on_attach = on_attach,
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
				root_markers = { "go.mod", ".git" },
				capabilities = capabilities,
				on_attach = on_attach,
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
				filetypes = { "html" },
				root_markers = { ".git" },
				capabilities = capabilities,
				on_attach = on_attach,
			})
			vim.lsp.enable("htmx")

			-- html
			vim.lsp.config("html", {
				cmd = { "vscode-html-language-server", "--stdio" },
				filetypes = { "html", "templ" },
				root_markers = { "package.json", ".git" },
				capabilities = capabilities,
			})
			vim.lsp.enable("html")

			-- angularls
			vim.lsp.config("angularls", {
				cmd = angularls_cmd,
				filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
				root_markers = { "angular.json", "project.json", ".git" },
				capabilities = capabilities,
				on_new_config = function(new_config, new_root_dir)
					new_config.cmd = angularls_cmd
				end,
			})
			vim.lsp.enable("angularls")

			-- ts_ls
			vim.lsp.config("ts_ls", {
				cmd = { "typescript-language-server", "--stdio" },
				filetypes = {
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"javascript",
					"javascriptreact",
					"html",
				},
				root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
				capabilities = capabilities,
				settings = {
					completions = {
						completeFunctionCalls = true,
					},
				},
			})
			vim.lsp.enable("ts_ls")

			-- Keymaps para ts_ls (organize imports e remove unused)
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client.name == "ts_ls" then
						vim.keymap.set("n", "<leader>co", function()
							vim.lsp.buf.code_action({
								apply = true,
								context = {
									only = { "source.organizeImports.ts" },
									diagnostics = {},
								},
							})
						end, { buffer = args.buf, desc = "Organize Imports" })

						vim.keymap.set("n", "<leader>cR", function()
							vim.lsp.buf.code_action({
								apply = true,
								context = {
									only = { "source.removeUnused.ts" },
									diagnostics = {},
								},
							})
						end, { buffer = args.buf, desc = "Remove Unused Imports" })
					end
				end,
			})

			-- eslint
			vim.lsp.config("eslint", {
				cmd = { "vscode-eslint-language-server", "--stdio" },
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
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
				capabilities = capabilities,
				on_attach = function(client, bufnr) end,
				-- settings = {
				-- 	experimental = {
				-- 		useFlatConfig = true, -- importante para eslint.config.mjs
				-- 	},
				-- },
			})
			vim.lsp.enable("eslint")

			-- gopls
			vim.lsp.config("gopls", {
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_markers = { "go.work", "go.mod", ".git" },
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

			-- Keymap específico para gopls (fill struct)
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client.name == "gopls" then
						vim.keymap.set("n", "<leader>fs", function()
							vim.lsp.buf.code_action({
								context = { only = { "refactor.rewrite" } },
								apply = true,
							})
						end, { buffer = args.buf, desc = "Fill struct" })
					end
				end,
			})

			-- emmet_language_server
			vim.lsp.config("emmet_language_server", {
				cmd = { "emmet-language-server", "--stdio" },
				filetypes = {
					"css",
					"html",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
				},
				root_markers = { ".git" },
			})
			vim.lsp.enable("emmet_language_server")

			-- Keymaps globais
			keymap.set("n", "K", lsp.buf.hover, {})
			keymap.set("n", "gd", lsp.buf.definition, {})
			keymap.set("n", "<leader>gr", lsp.buf.references, {})
			-- keymap.set({ "n", "v" }, "<leader>ca", lsp.buf.code_action, {})
			keymap.set({ "i", "n" }, "<C-s>", lsp.buf.signature_help, opts)
			keymap.set("n", "<leader>rn", lsp.buf.rename, opts)
		end,
	},
}
