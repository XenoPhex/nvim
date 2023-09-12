local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

mason.setup(vim.tbl_deep_extend("force", {
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
}, override_settings.mason))

mason_lsp.setup({
	automatic_installation = true,
})

require("plugins.lang")
