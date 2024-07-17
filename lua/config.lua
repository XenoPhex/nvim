local file = require("utils.file")

local M = {}

M.setup_globals = function()
	-- Setup Globals
	_G.CONFIG_PATH = vim.fn.stdpath("config")
	_G.DATA_PATH = vim.fn.stdpath("data")
	_G.CACHE_PATH = vim.fn.stdpath("cache")
	_G.XDG_CONFIG_HOME = os.getenv("XDG_CONFIG_HOME") or file.join(os.getenv("HOME"), ".config")
	_G.tbl = require("utils.table")
	_G.global_settings = {
		theme = "catppuccin",
		log = { level = "INFO" },
		ignore_ft = {
			"alpha",
			"fzf",
			"neo-tree",
			"neo-tree-popup",
			"notify",
			"NvimTree",
			"quickfix",
			"TelescopePrompt",
		},
	}
	-- Configure python based on the virtualenv
	local virtualenv = os.getenv("VIRTUAL_ENV")
	if virtualenv then
		vim.g["python3_host_prog"] = virtualenv .. "/bin/python"
	end

	_G.override_settings = M.get_overrides()
end

M.get_overrides = function()
	local status_ok, overrides = pcall(require, "custom")
	if not status_ok then
		return require("custom_template")
	end
	return tbl.merge(require("custom_template"), overrides) -- merge custom settings with template in case custom is missing fields
end

M.setup = function()
	M.setup_globals()

	require("options")

	vim.cmd("set whichwrap+=<,>,[,]")
	vim.cmd([[set iskeyword+=-]])
	-- disable open fold with `l`
	vim.cmd([[set foldopen-=hor]])

	require("plugins")
	require("keyboard")
	require("autocmd")
	vim.notify("Config Loaded!", "info")
end

return M
