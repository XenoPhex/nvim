-- Modified from: https://github.com/luan/nvim/blob/80bf368ecca034e3c88e3314cfb296894db79a90/lua/lvim/config/lsp/diagnostics.lua
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

local icons = require("utils.icons")
local signs = {
    { name = "DiagnosticSignError", text = icons.diagnostics.BoldError },
    { name = "DiagnosticSignWarn",  text = icons.diagnostics.BoldWarning },
    { name = "DiagnosticSignHint",  text = icons.diagnostics.BoldHint },
    { name = "DiagnosticSignInfo",  text = icons.diagnostics.BoldInformation },
}
for _, sign in ipairs(signs) do
    if not sign.texthl then
        sign.texthl = sign.name
    end
    vim.fn.sign_define(sign.name, sign)
end

local diagnostics = {
    off = {
        underline = false,
        virtual_text = false,
        signs = false,
        update_in_insert = false,
        virtual_lines = false,
    },
    on = {
        float = {
            border = "rounded",
            focusable = false,
            severity_sort = true,
            source = "always",
        },
        severity_sort = true,
        update_in_insert = true,
        virtual_text = false,
        virtual_lines = false,
    },
}
return diagnostics
