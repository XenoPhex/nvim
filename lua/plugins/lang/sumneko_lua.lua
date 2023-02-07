return {
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace",
            },
            hint = {
                enable = true,
                arrayIndex = "Auto",
                paramName = "Literal",
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
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
