return {
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
			format = {
				defaultConfig = {
					indent_style = "tab",
				},
			},
			hint = {
				enable = true,
				arrayIndex = "Disabled",
				paramName = "Disabled",
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
					["codestyle-check"] = "Opened",
					["spell-check"] = "Opened",
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
