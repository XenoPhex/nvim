-- Modified from: https://github.com/luan/nvim/blob/80bf368ecca034e3c88e3314cfb296894db79a90/lua/lvim/utils/rainbow-colors.lua
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

local color_utils = require "utils.colors"

local highlights = {
  "@function",
  "@method",
  "@readonly",
  "@local",
  "@modifier",
  "@namespace",
  "@interface",
  "Constant",
  "String",
  "Character",
  "Number",
  "Boolean",
  "Identifier",
  "Float",
  "Comment",
  "Function",
  "Statement",
  "Conditional",
  "Repeat",
  "Label",
  "Operator",
  "Keyword",
  "Exception",
  "PreProc",
  "Include",
  "Define",
  "Macro",
  "PreCondit",
  "Type",
  "StorageClass",
  "Structure",
  "Typedef",
  "Special",
  "SpecialChar",
  "Delimiter",
  "SpecialComment",
}

local color_set = {}

for _, hl in ipairs(highlights) do
  local fg = color_utils.get_hl_fg(hl)
  if fg ~= nil then
    fg = color_utils.brighten(fg, 0.3)
    if fg ~= nil and not color_set[fg] then
      color_set[fg] = true
    end
  end
end

local colors = {}

for color, _ in pairs(color_set) do
  table.insert(colors, color)
end

return colors
