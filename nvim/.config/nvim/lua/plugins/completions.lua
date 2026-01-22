-- return {
--     {
--         "hrsh7th/cmp-nvim-lsp",
--     },
--     {
--         "L3MON4D3/LuaSnip",
--         dependencies = {
--             "saadparwaiz1/cmp_luasnip",
--             "rafamadriz/friendly-snippets",
--         },
--     },
--     {
--         "hrsh7th/nvim-cmp",
--         config = function()
--             local cmp = require("cmp")
--             require("luasnip.loaders.from_vscode").lazy_load()
--
--             cmp.setup({
--                 snippet = {
--                     expand = function(args)
--                         require("luasnip").lsp_expand(args.body)
--                     end,
--                 },
--                 window = {
--                     completion = cmp.config.window.bordered(),
--                     documentation = cmp.config.window.bordered(),
--                 },
--                 mapping = cmp.mapping.preset.insert({
--                     ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--                     ["<C-f>"] = cmp.mapping.scroll_docs(4),
--                     ["<C-Space>"] = cmp.mapping.complete(),
--                     ["<C-e>"] = cmp.mapping.abort(),
--                     ["<CR>"] = cmp.mapping.confirm({ select = true }),
--                 }),
--                 sources = cmp.config.sources({
--                     { name = "nvim_lsp" },
--                     { name = "luasnip" }, -- For luasnip users.
--                 }, {
--                     { name = "buffer" },
--                 }),
--                 formatting = {
--                     format = function(entry, item)
--                         return require("nvim-highlight-colors").format(entry, item)
--                     end,
--                 },
--             })
--         end,
--     },
-- }

return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"onsails/lspkind-nvim",
		config = function()
			require("lspkind").init({
				-- show symbol + text. Use "symbol" for icons only.
				mode = "symbol_text",
				preset = "codicons",
				-- you can override symbols here if you want
				symbol_map = {
					Text = "󰉿",
					Method = "󰆧",
					Function = "󰊕",
					Constructor = "",
					Field = "󰜢",
					Variable = "󰀫",
					Class = "󰠱",
					Interface = "",
					Module = "",
					Property = "󰜢",
					Unit = "󰑭",
					Value = "󰎠",
					Enum = "",
					Keyword = "󰌋",
					Snippet = "",
					Color = "󰏘",
					File = "󰈙",
					Reference = "󰈇",
					Folder = "󰉋",
					EnumMember = "",
					Constant = "󰏿",
					Struct = "󰙅",
					Event = "",
					Operator = "󰆕",
					TypeParameter = "",
				},
			})
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					-- combine lspkind's formatter with your existing nvim-highlight-colors.format
					format = (function()
						local ok_lspkind, lspkind = pcall(require, "lspkind")
						local ok_hc, nvim_highlight = pcall(require, "nvim-highlight-colors")

						local lspkind_fmt = nil
						if ok_lspkind and type(lspkind.cmp_format) == "function" then
							-- create the lspkind formatter
							lspkind_fmt = lspkind.cmp_format({
								mode = "symbol_text", -- "symbol" for icons only
								maxwidth = 50,
								ellipsis_char = "...",
							})
						end

						return function(entry, item)
							if lspkind_fmt then
								item = lspkind_fmt(entry, item) or item
							end

							if ok_hc and type(nvim_highlight.format) == "function" then
								return nvim_highlight.format(entry, item)
							end

							return item
						end
					end)(),
				},
			})
		end,
	},
}
