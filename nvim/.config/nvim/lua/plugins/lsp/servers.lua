local M = {}

function M.setup(capabilities)
	local servers = {
		"lua_ls",
		"elixirls",
		"tailwindcss",
		"templ",
		"htmx",
		"html",
		"vtsls",
		"eslint",
		"gopls",
		"emmet",
		"pyright",
		"ocaml",
	}

	for _, server in ipairs(servers) do
		local ok, config = pcall(require, "plugins.lsp.servers." .. server)
		if ok then
			config = config(capabilities) or config
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end
	end
end

return M
