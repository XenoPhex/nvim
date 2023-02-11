-- Modified from: https://github.com/luan/nvim/blob/80bf368ecca034e3c88e3314cfb296894db79a90/lua/lvim/config/treesitter.lua
-- MIT License
--
-- Copyright (c) 2018 Luan Santos
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

require("nvim-treesitter.configs").setup({
	auto_install = true,
	sync_install = false,
	ensure_installed = tbl.merge({
		"bash",
		"c",
		"cmake",
		"diff",
		"dockerfile",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"go",
		"gomod",
		"gosum",
		"gowork",
		"help",
		"java",
		"json",
		"lua",
		"make",
		"markdown",
		"query",
		"ruby",
		"toml",
		"vim",
		"yaml",
	}, override_settings.lang),
	ignore_install = { "phpdoc", "tree-sitter-phpdoc" }, -- List of parsers to ignore installing
	autopairs = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = { "yaml", "python" },
	},
	context_commentstring = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = false,
		disable = { "html" },
		colors = require("utils.rainbow-colors"),
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@conditional.outer",
				["ic"] = "@conditional.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
			},
			include_surrounding_whitespace = true,
		},
		swap = {
			enable = true,
			swap_next = {
				["<A-l>"] = "@parameter.inner",
			},
			swap_previous = {
				["<A-h>"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next = {
				["]c"] = "@conditional.outer",
				["]a"] = "@parameter.outer",
				["]f"] = "@funcion.outer",
			},
			goto_previous = {
				["[c"] = "@conditional.outer",
				["[a"] = "@parameter.outer",
				["[f"] = "@funcion.outer",
			},
		},
	},
	textsubjects = {
		enable = true,
		prev_selection = ",", -- (Optional) keymap to select the previous selection
		keymaps = {
			["."] = "textsubjects-smart",
			[";"] = "textsubjects-container-outer",
			["i;"] = "textsubjects-container-inner",
		},
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
	endwise = { enabled = true },
})

--Setting up folding
vim.api.nvim_set_option("foldmethod", "expr")
vim.api.nvim_set_option("foldexpr", "nvim_treesitter#foldexpr()")
vim.api.nvim_set_option("foldenable", false) --Disabled folding on start up
