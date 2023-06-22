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
	hint = "floating-big-letter",
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

local icons = require("utils.icons").ui
local gitIcons = require("utils.icons").git

tree.setup({
	default_component_configs = {
		icon = {
			folder_empty = icons.EmptyFolder,
			folder_empty_open = icons.EmptyFolderOpen,
		},
		git_status = {
			symbols = {
				added = gitIcons.LineAdded,
				modified = gitIcons.LineModified,
				deleted = gitIcons.LineRemoved,
				renamed = gitIcons.FileRenamed,

				untracked = gitIcons.FileUntracked,
				ignored = gitIcons.FileIgnored,
				unstaged = gitIcons.FileUnstaged,
				staged = gitIcons.FileStaged,
				conflict = gitIcons.FileUnmerged,
			},
		},
	},
	document_symbols = {
		kinds = {
			File = { icon = icons.File, hl = "Tag" },
			Namespace = { icon = icons.Namespace, hl = "Include" },
			Package = { icon = icons.Package, hl = "Label" },
			Class = { icon = icons.Class, hl = "Include" },
			Property = { icon = icons.Property, hl = "@property" },
			Enum = { icon = icons.Field, hl = "@number" },
			Function = { icon = icons.Function, hl = "Function" },
			String = { icon = icons.String, hl = "String" },
			Number = { icon = icons.Number, hl = "Number" },
			Array = { icon = icons.Array, hl = "Type" },
			Object = { icon = icons.Object, hl = "Type" },
			Key = { icon = icons.Key, hl = "" },
			Struct = { icon = icons.Struct, hl = "Type" },
			Operator = { icon = icons.Operator, hl = "Operator" },
			TypeParameter = { icon = icons.TypeParameter, hl = "Type" },
			StaticMethod = { icon = "󰠄 ", hl = "Function" },
		},
	},
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
