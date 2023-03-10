local starts_with = require("utils.strings").starts_with

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
local lsp_commands = {}
for b, _ in pairs(require("telescope.builtin")) do
	if starts_with(tostring(b), "lsp_") then
		lsp_commands[b] = {
			fname_width = 70,
		}
	end
end

telescope.setup({
	active = true,
	defaults = tbl.merge(dropdown, {
		prompt_prefix = " ",
		selection_caret = " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		path_display = { "smart" },
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
	pickers = tbl.merge(lsp_commands, {
		find_files = tbl.merge(dropdown, {
			hidden = true,
			find_command = {
				"fd",
				"--smart",
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
	}),
})

require("telescope").load_extension("notify")
