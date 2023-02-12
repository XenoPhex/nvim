local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local themes = require("telescope.themes")
local dropdown = themes.get_dropdown({
	color_devicons = true,
	set_env = { ["COLORTERM"] = "truecolor" },
	layout_config = {
		width = 0.8,
	},
})

-- See
-- local builtins = require("telescope.builtin")
-- local picker_config = {}
-- for b, _ in pairs(builtins) do
-- 	picker_config[b] = { fname_width = 30 }
-- end

telescope.setup({
	active = true,
	defaults = tbl.merge(dropdown, {
		prompt_prefix = " ",
		selection_caret = " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		path_display = { "truncate" },
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob=!.git/",
		},
		file_ignore_patterns = {
			"%.7z",
			"%.burp",
			"%.bz2",
			"%.cache",
			"%.class",
			"%.dylib",
			"%.ico",
			"%.ipynb",
			"%.jar",
			"%.lock",
			"%.met",
			"%.o",
			"%.pdf",
			"%.rar",
			"%.sqlite3",
			"%.svg",
			"%.tar",
			"%.tar.gz",
			"%.zip",
			".cache/",
			".git/",
			".github/",
			".gradle/",
			".idea/",
			".settings/",
			".vscode/",
			"__pycache__/",
			"__pycache__/*",
			"gradle/",
			"node_modules/",
			"node_modules/*",
			"vendor/*",
		},
	}),
	pickers = {
		lsp_definitions = tbl.merge(dropdown, {
			fname_width = 60,
		}),
		find_files = tbl.merge(dropdown, {
			hidden = true,
			find_command = {
				"fd",
				"--color=never",
				"--exclude=git",
				"--follow",
				"--hidden",
				"--type=f",
			},
		}),
		live_grep = tbl.merge(dropdown, {
			--@usage don't include the filename in the search results
			only_sort_text = true,
		}),
		grep_string = tbl.merge(dropdown, {
			only_sort_text = true,
		}),
		buffers = tbl.merge(dropdown, {
			initial_mode = "normal",
			mappings = {
				i = {
					["<C-d>"] = actions.delete_buffer,
				},
				n = {
					["dd"] = actions.delete_buffer,
				},
			},
		}),
		colorscheme = {
			enable_preview = true,
		},
	},
})

require("telescope").load_extension("notify")
