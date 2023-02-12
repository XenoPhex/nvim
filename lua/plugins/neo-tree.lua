local status_ok, tree = pcall(require, "neo-tree")
if not status_ok then
	return
end

local status_ok, picker = pcall(require, "nvim-window-picker")
if not status_ok then
	return
end

tree.setup({})
picker.setup({
	autoselect_one = true,
	include_current = false,
	filter_rules = {
		-- filter using buffer options
		bo = {
			-- if the file type is one of following, the window will be ignored
			filetype = { "neo-tree", "neo-tree-popup", "notify" },

			-- if the buffer type is one of following, the window will be ignored
			buftype = { "terminal", "quickfix" },
		},
	},
	other_win_hl_color = "#e35e4f",
})
