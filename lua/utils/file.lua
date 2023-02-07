-- Modified from: https://github.com/luan/nvim/blob/c9b5e0ea19b42737cf7ab49cadc5c2cd13d3fa4a/lua/lvim/utils/file.lua
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

---@type boolean
M.is_mac = vim.loop.os_uname().sysname == "Darwin"

---@type string
M.sep = "/"

---@param filepath string
---@return boolean
M.exists = function(filepath)
  local stat = vim.loop.fs_stat(filepath)
  return stat ~= nil and stat.type ~= nil
end

---@return string
M.join = function(...)
  return table.concat({ ... }, M.sep)
end

---@param path string
---@return boolean
M.is_absolute = function(path)
  return vim.startswith(path, "/")
end

---@param path string
---@return string
M.abspath = function(path)
  if not M.is_absolute(path) then
    path = vim.fn.fnamemodify(path, ":p")
  end
  return path
end

---@param name string
---@return boolean
M.is_module_available = function(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        package.preload[name] = loader
        return true
      end
    end
    return false
  end
end

M.load_module = function(name)
  if M.is_module_available(name) then
    local ok, mod = pcall(require, name)
    if ok then
      return mod
    end
  end
  return nil
end

return M
