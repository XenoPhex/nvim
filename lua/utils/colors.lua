-- Modified from: https://github.com/luan/nvim/blob/80bf368ecca034e3c88e3314cfb296894db79a90/lua/lvim/utils/colors.lua
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

local M = {}

function M.hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  local r, g, b = tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6))
  return r, g, b
end

function M.rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x", r, g, b)
end

function M.brighten(hex, percent)
  local r, g, b = M.hex_to_rgb(hex)
  r = math.min(math.floor(r + (255 - r) * percent), 255)
  g = math.min(math.floor(g + (255 - g) * percent), 255)
  b = math.min(math.floor(b + (255 - b) * percent), 255)
  return M.rgb_to_hex(r, g, b)
end

function M.darken(hex, percent)
  local r, g, b = M.hex_to_rgb(hex)
  r = math.max(math.floor(r * (1 - percent)), 0)
  g = math.max(math.floor(g * (1 - percent)), 0)
  b = math.max(math.floor(b * (1 - percent)), 0)
  return M.rgb_to_hex(r, g, b)
end

function M.get_hl_fg(name)
  local ret = vim.api.nvim_get_hl_by_name(name, true)
  if type(ret.foreground) ~= "number" then
    return nil
  end

  return string.format("#%06x", ret.foreground)
end

function M.get_hl_bg(name)
  local ret = vim.api.nvim_get_hl_by_name(name, true)
  if type(ret.background) ~= "number" then
    return nil
  end

  return string.format("#%06x", ret.background)
end

return M
