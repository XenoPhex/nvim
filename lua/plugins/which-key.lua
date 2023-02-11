-- Modified from: https://github.com/luan/nvim/blob/lazy/lua/lvim/config/which-key.lua
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

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 2, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 10,
	},
	layout = {
		height = { min = 3, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 5, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
}

which_key.setup(setup)

-- [<leader>]
local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	-- [";"] = { "<cmd>Alpha<cr>", "Go to dashboard" },
	-- ["S"] = { "<cmd>TSJSplit<cr>", "Split block" },
	-- ["J"] = { "<cmd>TSJJoin<cr>", "Split block" },
	-- ["M"] = { "<cmd>TSJToggle<cr>", "Split block" },
	-- ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	-- ["E"] = { "<cmd>NvimTreeFindFile<cr>", "Explorer (reveal current file)" },
	-- ["w"] = {
	--   function()
	--     reload("lvim.utils").save()
	--   end,
	--   "Format and Save",
	-- },
	-- ["q"] = {
	-- 	name = "[q]uickfix",
	-- 	["q"] = { require("lvim.utils").toggle_quickfix, "Toggle quickfix" },
	-- 	["l"] = { require("lvim.utils").toggle_loc, "Toggle location list" },
	-- },
	["f"] = {
		name = "[f]iles",
		["f"] = { "<cmd>Telescope find_files<cr>", "Find files" },
		["o"] = {
			"<cmd>lua require('telescope.builtin').buffers()<cr>",
			"Find open buffers",
		},
		["m"] = {
			"<cmd>Telescope oldfiles<cr>",
			"Recent files",
		},
	},
	["s"] = {
		name = "[s]earch",
		["s"] = { "<cmd>Telescope live_grep<cr>", "Find text (live)" },
		["w"] = { "<cmd>Telescope grep_string<cr>", "Find text at cursor (live)" },
		["g"] = "Find text",
	},
	["<Tab>"] = { "<c-6>", "Move back and forth" },
	["="] = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
	-- ["t"] = {
	--   name = "[t]esting",
	--   ["t"] = { [[<cmd>lua require("neotest").run.run()<cr>]], "Run Nearest" },
	--   ["f"] = { [[<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>]], "Run File" },
	--   ["s"] = { [[<cmd>lua require("neotest").run.stop()<cr>]], "Stop test" },
	--   ["."] = { [[<cmd>lua require("neotest").run.run_last()<cr>]], "Run Last" },
	--   ["d"] = { [[<cmd>lua require("neotest").run.run_last({strategy = "dap"})<cr>]], "Debug Last" },
	--   ["o"] = { [[<cmd>lua require("neotest").output.open({ enter = true })<cr>]], "Show test output" },
	-- },
	["k"] = {
		name = "tas[k]s",
		["r"] = { "<cmd>OverseerRun<cr>", "Run task" },
		["t"] = { "<cmd>OverseerToggle<cr>", "Toggle tasks window" },
		["a"] = { "<cmd>OverseerTaskAction<cr>", "Select a task action to run" },
		["i"] = { "<cmd>OverseerInfo<cr>", "Show tasks info" },
	},
	["j"] = {
		name = "[l]jumps",
		["j"] = { "<cmd>HopAnywhere<cr>", "Jump anywhere" },
		["w"] = { "<cmd>HopWord<cr>", "Jump words" },
		["p"] = { "<cmd>HopPattern<cr>", "Jump patterns" },
		["l"] = { "<cmd>HopLineStart<cr>", "Jump lines" },
		["c"] = { "<cmd>HopChar1<cr>", "Jump character" },
		["v"] = { "<cmd>HopVertical<cr>", "Jump vertically" },
	},
	-- ["n"] = {
	--   name = "[n]otifications",
	--   ["r"] = { "<cmd>Telescope notify<cr>", "Browse recent notifications" },
	--   ["l"] = { "<cmd>Noice log<cr>", "Browse log" },
	-- },
	["l"] = {
		name = "[l]sp",
		["a"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		["d"] = {
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			"Document Diagnostics",
		},
		["w"] = {
			"<cmd>Telescope diagnostics<cr>",
			"Workspace Diagnostics",
		},
		["h"] = { "<cmd>lua require('lsp-inlayhints').toggle()<cr>", "Toggle inlay hints" },
		["i"] = { "<cmd>LspInfo<cr>", "Info" },
		["I"] = { "<cmd>Mason<cr>", "Installer (Mason)" },
		["l"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		["r"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		["s"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Document Symbols" },
		["q"] = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		["S"] = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},
}
which_key.register(mappings, opts)
which_key.register({
	["="] = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
}, tbl.merge(opts, { mode = "x" }))

local g_mappings = {
	["d"] = { "<cmd>Telescope lsp_definitions<cr>", "Go to definition" },
	["r"] = { "<cmd>Telescope lsp_references<cr>", "Go to references" },
	["i"] = { "<cmd>Telescope lsp_implementations<cr>", "Go to implementations" },
	["l"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open float" },
}
-- Go to [g]
local goto_opts = {
	mode = "n", -- NORMAL mode
	prefix = "g",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
which_key.register(g_mappings, goto_opts)

-- [] pairs
local pair_opts = {
	mode = "n", -- NORMAL mode
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local pair_mappings = {
	["d"] = {
		prev = "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
		next = "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
		desc = "%s diagnostic",
	},
}

local prev_mappings = {}
local next_mappings = {}
for index, value in pairs(pair_mappings) do
	prev_mappings[index] = { value.prev, string.format(value.desc, "Previous") }
	next_mappings[index] = { value.prev, string.format(value.desc, "Next") }
end

which_key.register(prev_mappings, tbl.merge(pair_opts, { prefix = "[" }))
which_key.register(next_mappings, tbl.merge(pair_opts, { prefix = "]" }))

-- for some reason this doesn't work through whichkey
vim.keymap.set("n", "<leader>sg", ":silent! grep! ", {
	desc = "Find text",
})