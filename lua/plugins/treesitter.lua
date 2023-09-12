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

local status_ok, rainbow_delimiters = pcall(require, "rainbow-delimiters")
if not status_ok then
	vim.notify("rainbow_delimiters could not load", vim.log.levels.WARN)
else
	vim.g.rainbow_delimiters = {
		strategy = {
			[""] = rainbow_delimiters.strategy["global"],
			commonlisp = rainbow_delimiters.strategy["local"],
		},
		query = {
			[""] = "rainbow-delimiters",
			latex = "rainbow-blocks",
		},
		blacklist = { "c", "cpp" },
	}
end

local status_ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify("treesitter could not load", vim.log.levels.WARN)
	return
end

treesitter_config.setup({
	auto_install = true,
	sync_install = false,
	ensure_installed = tbl.merge_lists({
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
		"java",
		"json",
		"lua",
		"luadoc",
		"luap",
		"make",
		"markdown",
		"markdown_inline",
		"query",
		"ruby",
		"toml",
		"vim",
		"vimdoc",
		"yaml",
	}, override_settings.treesitter_lang),
	ignore_install = { "phpdoc", "tree-sitter-phpdoc" }, -- List of parsers to ignore installing

	-- Following are built-in modules
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
	},
	indent = {
		enable = true,
	},

	-- Following are module extensions
	autopairs = {
		enable = true,
	},
	endwise = {
		enabled = true,
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
				["]f"] = "@function.outer",
			},
			goto_previous = {
				["[c"] = "@conditional.outer",
				["[a"] = "@parameter.outer",
				["[f"] = "@function.outer",
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
})

require("hlargs").setup()
