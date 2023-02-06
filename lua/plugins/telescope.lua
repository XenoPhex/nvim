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

telescope.setup {
  active = true,
  defaults = tbl.merge(dropdown, {
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
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
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  },
  pickers = {
    find_files = tbl.merge(dropdown, {
      hidden = true,
    }),
    live_grep = tbl.merge(dropdown, {
      --@usage don't include the filename in the search results
      only_sort_text = true,
    }),
    grep_string = tbl.merge(dropdown, {
      only_sort_text = true,
    }),
    buffers =  tbl.merge(dropdown, {
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
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
