return function(capabilities)
	return {
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
	}
end
