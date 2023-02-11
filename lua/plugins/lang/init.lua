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
			completion = {
				completionItem = {
					documentationFormat = { "markdown", "plaintext" },
				},
			},
			-- Tell the server the capability of foldingRange,
			-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			},
		},
	})
end

local function load_languages()
	local langs = {
		sumneko_lua = require("plugins.lang.sumneko_lua"),
		gopls = require("plugins.lang.gopls"),
	}

	local all_lang = tbl.merge(langs, override_settings.lsp)
	for lang, config in pairs(all_lang) do
		config.capabilities = extended_capabilities()
		lspconfig[lang].setup(config)
	end
end

load_languages()
