local status_ok, tree = pcall(require, "neo-tree")
if not status_ok then
	return
end

local status_ok, picker = pcall(require, "window-picker")
if not status_ok then
	return
end

vim.g["neo_tree_remove_legacy_commands"] = 1

picker.setup({
	autoselect_one = true,
	include_current = false,
	filter_rules = {
		-- filter using buffer options
		bo = {
			-- if the file type is one of following, the window will be ignored
			filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

			-- if the buffer type is one of following, the window will be ignored
			buftype = { "terminal", "quickfix" },
		},
	},
	other_win_hl_color = "#e35e4f",
})

tree.setup({
	window = {
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			["<cr>"] = "open_with_window_picker",
		},
	},
	filesystem = {
		filtered_items = {
			visible = true,
			never_show = {
				".git",
				".DS_Store",
			},
		},
	},
})
