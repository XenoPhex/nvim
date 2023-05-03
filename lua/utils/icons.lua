-- Modified from: https://github.com/luan/nvim/blob/80bf368ecca034e3c88e3314cfb296894db79a90/lua/lvim/core/icons.lua
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

-- https://www.unicode.org/charts/charindex.html

local M = {
	git = {
		Branch = "",
		Diff = "",
		FileDeleted = "",
		FileIgnored = "◌",
		FileRenamed = "➜",
		FileStaged = "S",
		FileUnmerged = "",
		FileUnstaged = "",
		FileUntracked = "U",
		LineAdded = "",
		LineModified = "",
		LineRemoved = "",
		Octoface = "",
		Repo = "",
	},
	ui = {
		Array = "󰅪",
		ArrowCircleDown = "",
		ArrowCircleLeft = "",
		ArrowCircleRight = "",
		ArrowCircleUp = "",
		BoldArrowDown = "",
		BoldArrowLeft = "",
		BoldArrowRight = "",
		BoldArrowUp = "",
		BoldClose = "",
		BoldDividerLeft = "",
		BoldDividerRight = "",
		BoldLineLeft = "▎",
		BookMark = "",
		Boolean = "",
		BoxChecked = "",
		Bug = "",
		Calendar = "",
		Check = "󰄬",
		ChevronRight = ">",
		ChevronShortDown = "",
		ChevronShortLeft = "",
		ChevronShortRight = "",
		ChevronShortUp = "",
		Circle = "",
		Class = "",
		Close = "󰅖",
		CloudDownload = "",
		Code = "",
		Comment = "󰅺",
		Constant = "󰏿",
		Constructor = "",
		Dashboard = "",
		DebugConsole = "",
		DividerLeft = "",
		DividerRight = "",
		DoubleChevronRight = "»",
		Ellipsis = "…",
		EmptyFolder = "",
		EmptyFolderOpen = "",
		Enum = "",
		EnumMember = "",
		Event = "",
		Field = "",
		File = "󰈙",
		Files = "󰈢",
		FileSymlink = "",
		FindFile = "󰈞",
		FindText = "󰊄",
		Fire = "",
		Folder = "󰉋",
		FolderOpen = "",
		FolderSymlink = "",
		Forward = "",
		Function = "󰊕",
		Gear = "",
		History = "󰄉",
		Interface = "󰕘",
		Key = "󰌋",
		Lightbulb = "󰌵",
		LineLeft = "▏",
		LineMiddle = "│",
		List = "",
		Lock = "󰍁",
		Macro = "󰉨",
		Method = "󰊕",
		Module = "",
		Namespace = "󰦮",
		NewFile = "",
		Note = "󰎞",
		Null = "󰟢",
		Number = "󰎠",
		Object = "󰅩",
		Operator = "󰆕",
		Package = "",
		Pencil = "󰏫",
		Plus = "",
		Project = "",
		Property = "",
		Scopes = "",
		Search = "󰍉",
		SignIn = "",
		SignOut = "",
		Stacks = "",
		String = "",
		Struct = "󰌗",
		Suggestion = "󰌏",
		Tab = "󰌒",
		Table = "",
		Target = "󰀘",
		Telescope = "",
		Text = "",
		Tree = "",
		Triangle = "󰐊",
		TriangleShortArrowDown = "",
		TriangleShortArrowLeft = "",
		TriangleShortArrowRight = "",
		TriangleShortArrowUp = "",
		TypeParameter = "󰗴",
		Variable = "󰀫",
		Watches = "󰂥",
		Zip = "",
	},
	diagnostics = {
		BoldError = "",
		Error = "󰅚",
		BoldWarning = "",
		Warning = "󰀪",
		BoldInformation = "",
		Information = "󰋽",
		BoldQuestion = "",
		Question = "",
		BoldHint = "󰌵",
		Hint = "󰌶",
		Debug = "",
		Trace = "✎",
	},
	misc = {
		CircuitBoard = "",
		Package = "",
		Robot = "󰚩",
		Smiley = "󰞅",
		Squirrel = "",
		Tag = "",
		Watch = "",
	},
}

M.ui_with_space = {}
for name, value in pairs(M.ui) do
	M.ui_with_space[name] = value .. " "
end

return M
