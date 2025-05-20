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
    markdown_lines = vim.split(markdown_lines, "\n", { plain = true, trimempty = true })()
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

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local buffer = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- Enable Inlay Hints if server provides it
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true)
        end

        -- Formatting
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffer })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = buffer,
                callback = function()
                    vim.lsp.buf.format({ timeout_ms = 5000 })
                end,
            })
        end

        -- Navic
        local status_ok, navic = pcall(require, "nvim-navic")
        if not status_ok then
            return
        end

        navic.setup({
            icons = require("utils.icons").ui_with_space,
            highlight = true,
        })

        if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, buffer)
        end
    end,
})
