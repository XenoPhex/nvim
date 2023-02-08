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
	hidden = true, -- Allow buffer switching without saving
	linespace = -1, -- No extra spaces between rows
	wrap = true, -- Wrap long lines
	number = true, -- Show line numbers
	scrolloff = 5, -- Minumum lines to keep above and below cursor
	showmatch = true, -- Show matching brackets/parentthesis
	splitright = true, -- Vertical splits to the right
	termguicolors = true, -- Enable true colors in terminal
	updatetime = 300, -- Update swap file and CursorHold delay
	signcolumn = "yes", -- Always enable sign column to avoid spasms
	timeoutlen = 500, -- Timeout for keybindings
	ttimeoutlen = 5000, -- Timeout for completing commands
	inccommand = "nosplit", -- Preview commands like substitute
	ignorecase = true, -- Case insensitive search
	smartcase = true, -- ... but case sensitive when uc present
	smartindent = true, -- ... but case sensitive when uc present
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
	undofile = true, -- Persistent undo
	undodir = CACHE_PATH .. "/undo", -- set an undo directory
	undolevels = 999, -- Maximum number of changes that can be undone
	undoreload = 9999, -- Maximum number lines to save for undo on a buffer reload
	showmode = false, -- Hide current mode in command-line
	fillchars = "vert:│,stl: ,stlnc: ",
	writebackup = false,
	cursorline = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.shortmess:append("c")
vim.opt.iskeyword:append("$", "@", "-")
