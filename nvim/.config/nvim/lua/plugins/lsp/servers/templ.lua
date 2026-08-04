return function(capabilities)
	return {
		cmd = { "templ", "lsp" },
		filetypes = { "html", "templ" },
		capabilities = capabilities,
	}
end
