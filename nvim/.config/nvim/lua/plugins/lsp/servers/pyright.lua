return function(capabilities)
	return {
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
	}
end
