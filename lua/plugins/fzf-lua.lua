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
		fd_opts = fzf_defaults.files.fd_opts
			.. " --no-ignore-vcs" -- Include git ignored files
			.. " -E *.class" -- Exclude Java class files
			.. " -E *.pyc" -- Exclude (python) cache files
			.. " -E *.spl" -- Exclude binary spell files
			.. " -E .cache" -- Exclude .cache
			.. " -E .git" -- Exclude .git
			.. " -E .gradle" -- Exclude .gradle
			.. " -E .venv", -- Exclude python virtual envs
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
