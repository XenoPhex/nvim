local status_ok, lint = pcall(require, "lint")
if not status_ok then
	return
end

lint.linters_by_ft = tbl.merge({
	dockerfile = { "hadolint" },
	go = { "golangcilint" },
	lua = { "luacheck" },
	markdown = { "markdownlint" },
	sh = { "shellcheck" },
	-- missing: checkmake - https://github.com/mrtazz/checkmake
}, override_settings.lint)

override_settings.lint_config(lint)

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
