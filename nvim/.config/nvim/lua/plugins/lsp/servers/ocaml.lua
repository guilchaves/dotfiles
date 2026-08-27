return function(capabilities)
	return {
		cmd = { "ocamllsp" },
		filetypes = { "ocaml", "menhir", "ocamlinterface", "ocamllex", "reason", "dune" },
		capabilities = capabilities,
	}
end
