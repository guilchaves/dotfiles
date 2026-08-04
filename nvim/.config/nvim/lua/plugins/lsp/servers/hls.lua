return function(capabilities)
	return {
		cmd = { "haskell-language-server-wrapper", "--lsp" },
		capabilities = capabilities,
		filetypes = { "haskell", "lhaskell", "cabal" },
		root_markers = {
			"hie.yaml",
			"*.cabal",
			"package.yaml",
			"stack.yaml",
			"cabal.project",
		},
		single_file_support = true,
		settings = {
			haskell = {
				formattingProvider = "fourmolu",
			},
		},
		flags = {
			debounce_text_changes = 150,
		},
	}
end
