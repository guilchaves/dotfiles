return function(capabilities)
	return {
		cmd = { vim.fn.stdpath("data") .. "/mason/bin/elixir-ls" },
		capabilities = capabilities,
	}
end
