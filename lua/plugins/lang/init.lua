local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

local function extended_capabilities()
    return tbl.merge(vim.lsp.protocol.make_client_capabilities(), cmp_nvim_lsp.default_capabilities(), {
        textDocument = {
            foldRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            },
        },
        -- FIXME: workaround for https://github.com/neovim/neovim/issues/28058
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = false,
                relativePatternSupport = false,
            },
        },
    })
end

local function load_languages()
    for _, config in pairs(override_settings.custom_lang) do
        require(config)
    end

    local langs = {
        bashls = {},
        gopls = require("plugins.lang.gopls"),
        jsonls = require("plugins.lang.jsonls"),
        lua_ls = require("plugins.lang.lua_ls"),
        marksman = {},
        yamlls = require("plugins.lang.yamlls"),
    }

    local all_lang = tbl.merge(langs, override_settings.lang)
    for lang, config in pairs(all_lang) do
        config.capabilities = extended_capabilities()
        -- lspconfig[lang].setup(config)
        vim.lsp.config(lang, {
            settings = {
                [lang] = config,
            },
        })
    end
end

load_languages()
