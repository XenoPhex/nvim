return {
	settings = {
		gopls = {
			analyses = {
				nilness = true,
				shadow = true,
				unusedparams = true,
				unusedvariable = true,
				unusedwrite = true,
				useany = true,
			},
			experimentalPostfixCompletions = true,
			gofumpt = true,
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			staticcheck = false,
		},
	},
}
