local status_ok, barbecue = pcall(require, "barbecue")
if not status_ok then
	return
end

barbecue.setup({
	theme = "catppuccin",
	exclude_filetypes = { "gitcommit", "toggleterm", "neo-tree" },
	show_modified = true,
	show_dirname = true,
	kinds = require("utils.icons").ui,
})
