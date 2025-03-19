local status_ok, fzf = pcall(require, "fzf-lua")
if not status_ok then
	vim.notify("fzf-lua could not load", vim.log.levels.WARN)
	return
end

fzf.setup({
	fzf_opts = {
		["--highlight-line"] = true,
	},
	winopts = {
		preview = {
			default = "bat_native",
			layout = "vertical",
			vertical = "up:65%",
			wrap = "wrap",
		},
	},
	lsp = {
		ignore_current_line = true,
		jump1 = true,
		symbols = {
			symbol_icons = require("utils.icons").ui,
		},
		sync = true,
	},
})

vim.cmd("FzfLua register_ui_select") -- register fzf-lua as the UI interface for vim.ui.select
