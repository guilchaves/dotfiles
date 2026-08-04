return function(capabilities)
	return {
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
	}
end
