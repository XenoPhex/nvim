-- Modified from: https://github.com/luan/nvim/blob/80bf368ecca034e3c88e3314cfb296894db79a90/lua/lvim/config/lsp-signature.lua
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

local status_ok, signature = pcall(require, "lsp_signature")
if not status_ok then
	return
end

local cfg = {
	log_path = CACHE_PATH .. "/lsp_signature.log", -- debug log path
	max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
	fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
	hint_enable = false, -- virtual hint enable
	use_lspsaga = false, -- set to true if you want to use lspsaga popup
	handler_opts = {
		border = "rounded", -- double, rounded, single, shadow, none
	},
	timer_interval = 100, -- default timer check interval set to lower value if you want to reduce latency
}

signature.setup(cfg) -- no need to specify bufnr if you don't use toggle_key
