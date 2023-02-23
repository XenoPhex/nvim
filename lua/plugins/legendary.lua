local status_ok, legendary = pcall(require, "legendary")
if not status_ok then
	vim.notify("Unable to load legendary", "error")
	return
end

local status_ok, keyboard = pcall(require, "keyboard")
if not status_ok then
	vim.notify("Unable to load keyboard shortcuts", "error")
	return
end

legendary.setup(tbl.merge({
	keymaps = keyboard,
	default_opts = {
		keymaps = { silent = true, noremap = true },
	},
}, override_settings.legendary))
