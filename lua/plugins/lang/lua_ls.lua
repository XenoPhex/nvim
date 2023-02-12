return {
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
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
				globals = { "vim", "global_settings", "override_settings" },
				neededFileStatus = {
					["codestyle-check"] = "Opened",
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
