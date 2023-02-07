local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

function extended_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = { "documentation", "detail", "additionalTextEdits" },
  }
  -- Tell the server the capability of foldingRange,
  -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
  capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
  }
  return capabilities
end

function load_languages()
  local langs = {
      sumneko_lua = require("plugins.lang.sumneko_lua"),
  }

  local all_lang = vim.tbl_deep_extend("force", langs, override_settings.lang)
  for lang, config in pairs(all_lang) do
    config.capabilities = extended_capabilities()
    lspconfig[lang].setup(config)
  end
end

load_languages()
