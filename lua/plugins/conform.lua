local status_ok, conform = pcall(require, "conform")
if not status_ok then
	return
end

conform.setup({
	formatters_by_ft = tbl.merge({
		go = { "goimports" },
		lua = { "stylua" },
		toml = { "taplo" },
		-- Missing Markdownlint
		["*"] = { "trim_whitespace", "trim_newlines" },
	}, override_settings.conform),
	format_on_save = {
		lsp_fallback = true,
		quiet = true,
		timeout_ms = 5000,
	},
	notify_on_error = true,
})
