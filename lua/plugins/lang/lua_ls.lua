return {
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
				displayContext = 1,
			},
			format = {
				defaultConfig = {
					indent_style = "tab",
					indent_size = "4",
				},
			},
			hint = {
				enable = true,
				arrayIndex = "Disable",
				paramName = "Disable",
				paramType = false,
				semicolon = "SameLine",
				setType = true,
			},
			runtime = {
				version = "LuaJIT",
				special = {
					reload = "require",
				},
			},
			diagnostics = {
				globals = { "vim", "global_settings", "override_settings", "os" },
				neededFileStatus = {
					["codestyle"] = "Opened",
					["unused"] = "Opened",
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
