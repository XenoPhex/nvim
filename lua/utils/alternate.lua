-- Modified from: https://github.com/ray-x/go.nvim/blob/8ea5439288bf5a88c5e191bea47a5c60935f2e34/lua/go/alternate.lua
-- MIT License

-- Copyright (c) 2021 rayx.cn@gmail.com

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

local M = {}

function M.is_test_file()
	local file = vim.fn.expand("%")
	if #file <= 1 then
		vim.notify("no buffer name", vim.log.levels.ERROR)
		return
	end
	local is_test = string.find(file, "_test%.go$")
	local is_source = string.find(file, "%.go$")
	return file, (not is_test and is_source), is_test
end

function M.alternate()
	local file, is_source, is_test = M.is_test_file()
	if file == nil then
		return
	end
	local alt_file = file
	if is_test then
		alt_file = string.gsub(file, "_test.go", ".go")
	elseif is_source then
		alt_file = vim.fn.expand("%:r") .. "_test.go"
	else
		vim.notify("not a go file", vim.log.levels.ERROR)
	end
	return alt_file
end

function M.switch(bang, cmd)
	local alt_file = M.alternate()
	if alt_file == nil then
		return
	end
	if not vim.fn.filereadable(alt_file) and not vim.fn.bufexists(alt_file) and not bang then
		vim.notify("couldn't find " .. alt_file, vim.log.levels.ERROR)
		return
	elseif #cmd <= 1 then
		local ocmd = "e " .. alt_file
		vim.cmd(ocmd)
	else
		local ocmd = cmd .. " " .. alt_file
		vim.cmd(ocmd)
	end
end

return M
