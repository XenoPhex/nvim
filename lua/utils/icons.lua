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

return {
	git = {
		LineAdded = "",
		LineModified = "",
		LineRemoved = "",
		FileDeleted = "",
		FileIgnored = "◌",
		FileRenamed = "➜",
		FileStaged = "S",
		FileUnmerged = "",
		FileUnstaged = "",
		FileUntracked = "U",
		Diff = "",
		Repo = "",
		Octoface = "",
		Branch = "",
	},
	ui = {
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
		BoxChecked = "",
		Bug = "",
		Stacks = " ",
		Scopes = "",
		Watches = "󰂥",
		DebugConsole = " ",
		Calendar = "",
		Check = "󰄬",
		ChevronRight = ">",
		ChevronShortDown = "",
		ChevronShortLeft = "",
		ChevronShortRight = "",
		ChevronShortUp = "",
		Circle = "",
		Close = "󰅖",
		CloudDownload = "",
		Code = "",
		Comment = "󰅺",
		Dashboard = "",
		DividerLeft = "",
		DividerRight = "",
		DoubleChevronRight = "»",
		Ellipsis = "…",
		EmptyFolder = "",
		EmptyFolderOpen = "",
		File = "󰈔",
		FileSymlink = "",
		Files = "󰈢",
		FindFile = "󰈞",
		FindText = "󰊄",
		Fire = "",
		Folder = "󰉋",
		FolderOpen = "",
		FolderSymlink = "",
		Forward = "",
		Gear = "",
		History = "󰄉",
		Lightbulb = "󰌵",
		LineLeft = "▏",
		LineMiddle = "│",
		List = "",
		Lock = "󰍁",
		NewFile = "",
		Note = "󰎞",
		Package = "",
		Pencil = "󰏫",
		Plus = "",
		Project = "",
		Search = "󰍉",
		SignIn = "",
		SignOut = "",
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
		Robot = "󰚩",
		Squirrel = "",
		Tag = "",
		Watch = "",
		Smiley = "󰞅",
		Package = "",
		CircuitBoard = "",
	},
}
