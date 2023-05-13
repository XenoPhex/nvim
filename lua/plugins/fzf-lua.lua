local status_ok, fzf = pcall(require, "fzf-lua")
if not status_ok then
	vim.notify("fzf-lua could not load", vim.log.levels.WARN)
	return
end

fzf.setup({
	winopts = {
		preview = {
			vertical = "up:65%",
			wrap = "wrap",
			layout = "vertical",
		},
	},
	lsp = {
		ignore_current_line = true,
		jump_to_single_result = true,
		symbols = {
			symbol_icons = require("utils.icons").ui,
		},
	},
})

vim.cmd("FzfLua register_ui_select") -- register fzf-lua as the UI interface for vim.ui.select
