return function(capabilities)
	return {
		capabilities = capabilities,
		filetypes = { "haskell", "lhaskell", "cabal" },
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
