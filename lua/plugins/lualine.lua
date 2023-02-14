-- Modified from: https://github.com/luan/nvim/blob/92343f4ed31f0eccae86c1403f3635b9b872a4cb/lua/lvim/config/lualine.lua
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

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local branch = {
	"branch",
	icon = { "" },
}

local location = {
	"location",
	fmt = function(str)
		return "" .. str
	end,
}

local diagnostics = {
	"diagnostics",
	colored = true,
	update_in_insert = true,
	always_visible = true,
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " },
}

local mode = {
	"mode",
	icons_enabled = true,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	colored = true,
	icons_only = false,
}

local float_config = {
	options = {
		theme = global_settings.theme,
		icons_enabled = true,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = { "neo-tree" },
			"alpha",
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 100,
		},
	},
	sections = {
		lualine_a = { mode, branch },
		lualine_b = { diagnostics },
		lualine_c = {},
		lualine_x = {
			{
				"lsp_progress",
				percentage = { use = true },
				display_components = { "lsp_client_name", { "title", "percentage", "message" } },
			},
		},
		lualine_y = { diff },
		lualine_z = { location, "progress", filetype },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
}

lualine.setup(float_config)
