local status_ok, fzf = pcall(require, "fzf-lua")
if not status_ok then
	vim.notify("fzf-lua could not load", vim.log.levels.WARN)
	return
end

local fzf_defaults = require("fzf-lua.defaults").defaults

fzf.setup({
	winopts = {
		preview = {
			vertical = "up:65%",
			wrap = "wrap",
			layout = "vertical",
		},
	},
	files = {
		fd_opts = fzf_defaults.files.fd_opts .. " --no-ignore", -- Include git ignored files
	},
	lsp = {
		ignore_current_line = true,
		jump_to_single_result = true,
	},
})

vim.cmd("FzfLua register_ui_select") -- register fzf-lua as the UI interface for vim.ui.select
