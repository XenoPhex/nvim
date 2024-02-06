-- Modified from: https://github.com/luan/nvim/blob/80bf368ecca034e3c88e3314cfb296894db79a90/lua/lvim/config/lsp/init.lua
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

vim.diagnostic.config(require("plugins.lsp.diagnostics")["on"])

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(function(_, result, ctx, config)
	config = config or {}
	config.focus_id = ctx.method
	if not (result and result.contents) then
		return
	end
	---@diagnostic disable-next-line: missing-parameter
	local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
	markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
	if vim.tbl_isempty(markdown_lines) then
		return
	end
	return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
end, {
	border = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█" },
	width = 60,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█" },
	width = 60,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local buffer = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		require("plugins.lsp.navic").on_attach(client, buffer)
		require("plugins.lsp.format").on_attach(client, buffer)

		-- Enable Inlay Hints if server provides it
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(args.buf, true)
		end
	end,
})
