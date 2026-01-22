return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	lazy = false,
	ft = { "rust" },
	config = function()
		vim.g.rustaceanvim = {
			server = {
				on_attach = function(client, bufnr)
					-- Hover actions
					vim.keymap.set("n", "<Leader>gh", function()
						vim.cmd.RustLsp({ "hover", "actions" })
					end, { buffer = bufnr, desc = "Rust Hover Actions" })

					-- Code action group
					vim.keymap.set("n", "<Leader>r", function()
						vim.cmd.RustLsp("codeAction")
					end, { buffer = bufnr, desc = "Rust Code Actions" })
				end,
			},
			tools = {
				hover_actions = {
					auto_focus = true,
				},
			},
		}
	end,
}
