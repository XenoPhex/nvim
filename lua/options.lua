-- Modified from: https://github.com/luan/nvim/blob/c9b5e0ea19b42737cf7ab49cadc5c2cd13d3fa4a/lua/lvim/core/options.lua
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

-- For more info on options: https://neovim.io/doc/user/options.html
local options = {
	autoread = true, -- reload changes from disk
	autowriteall = true, -- Writes on make/shell commands
	cursorline = true, -- Highlight the text line of the cursor
	fileencoding = "utf-8",
	fillchars = "vert:│,stl: ,stlnc: ",
	hidden = true, -- Allow buffer switching without saving
	ignorecase = true, -- Case insensitive search
	inccommand = "nosplit", -- Preview commands like substitute
	linespace = -1, -- No extra spaces between rows
	number = true, -- Show line numbers
	scrolloff = 5, -- Minimum lines to keep above and below cursor
	showmatch = true, -- Show matching brackets/parentheses
	showmode = false, -- Hide current mode in command-line
	signcolumn = "yes", -- Always enable sign column to avoid spasms
	smartcase = true, -- ... but case sensitive when uc present
	smartindent = false, -- ... but case sensitive when uc present
	splitright = true, -- Vertical splits to the right
	termguicolors = true, -- Enable true colors in terminal
	timeoutlen = 500, -- Timeout for keybindings
	ttimeoutlen = 5000, -- Timeout for completing commands
	updatetime = 1000, -- Update swap file and CursorHold delay
	wrap = true, -- Wrap long lines
	writebackup = false, -- Disable making a backup before overwriting a file

	sessionoptions = {
		"blank",
		"buffers",
		"curdir",
		"folds",
		"help",
		"options",
		"tabpages",
		"winsize",
		"resize",
		"winpos",
		"terminal",
	},

	-- Mouse
	mouse = "a", -- Mouse enabled in all modes

	-- Completion
	pumheight = 20, -- Avoid the pop up menu occupying the whole screen
	completeopt = { "menuone", "noselect" },

	-- Indentation
	expandtab = true, -- Tabs are spaces, not tabs
	shiftwidth = 4, -- Use indents of 4 spaces
	softtabstop = 4, -- Let backspace delete indent
	tabstop = 4, -- An indentation every four columns

	-- Undo
	undodir = CACHE_PATH .. "/undo", -- set an undo directory
	undofile = true, -- Persistent undo
	undolevels = 999, -- Maximum number of changes that can be undone
	undoreload = 9999, -- Maximum number lines to save for undo on a buffer reload

	-- Spelling
	spell = true,
	spelllang = "en_us",

	-- Fold Settings
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.shortmess:append("c") -- don't pass messages to |ins-completion-menu|
vim.opt.iskeyword:append("$", "@", "-")
