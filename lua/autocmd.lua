-- Modified from: https://github.com/luan/nvim/blob/80bf368ecca034e3c88e3314cfb296894db79a90/lua/lvim/core/autocmds.lua
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

local augroup = vim.api.nvim_create_augroup("GeneralAutoCmds", { clear = true })

-- Auto resize buffers on window resize.
vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = augroup,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Set 'q' hot key to close various window pop ups.
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup,
	pattern = { "qf", "help", "man", "lspinfo" },
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>q!<CR>", { noremap = true, silent = true })
		vim.cmd([[
		      set nobuflisted
		]])
	end,
})

-- Automatically enable spelling and wrap for git commits and markdown files.
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup,
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- PKL/PCL Settings
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup,
	pattern = { "pcl", "pkl" },
	callback = function()
		vim.opt_local.wrap = true
		vim.bo.shiftwidth = 2
	end,
})

-- Proto Settings
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup,
	pattern = { "proto" },
	callback = function()
		vim.opt_local.wrap = true
		vim.bo.shiftwidth = 2
	end,
})

-- Modify formatting options.
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	group = augroup,
	pattern = { "*" },
	callback = function()
		vim.cmd([[set formatoptions-=cro]])
	end,
})

-- Automatically generate spell file when writing to vim dictionary.
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = augroup,
	pattern = { "*.add" },
	callback = function()
		vim.cmd("mkspell! %")
	end,
})

-- Set Brewfile to be Ruby
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = augroup,
	pattern = { "Brewfile" },
	callback = function()
		vim.o.ft = "ruby"
	end,
})
