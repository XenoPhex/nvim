local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local status_ok, mason_null_ls = pcall(require, "mason-null-ls")
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

local sources = {
	-- null_ls.builtins.code_actions.refactoring, need to figure out why this is breaking
	-- null_ls.builtins.diagnostics.gospel, do the other spell checkers work well enough?
	null_ls.builtins.diagnostics.alex,
	null_ls.builtins.diagnostics.checkmake,
	null_ls.builtins.diagnostics.codespell,
	null_ls.builtins.diagnostics.golangci_lint,
	null_ls.builtins.diagnostics.hadolint,
	null_ls.builtins.diagnostics.markdownlint,
	null_ls.builtins.diagnostics.shellcheck,
	null_ls.builtins.diagnostics.trail_space,
	null_ls.builtins.diagnostics.yamllint,
	null_ls.builtins.diagnostics.zsh,
	null_ls.builtins.formatting.markdownlint,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.trim_newlines,
}

null_ls.setup({
	sources = tbl.merge_lists(sources, override_settings.null_ls),
})

mason_null_ls.setup({
	ensure_installed = nil,
	automatic_installation = true,
	automatic_setup = false,
})
