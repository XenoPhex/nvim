-- Do not modify this file! Instead copy it to a custom.lua file.
return {
	legendary = {}, -- legendary configuration
	plugins = {
		-- format should look like:
		-- ["plugin/name"] = { Lazy style config },
		-- Lazy Config: https://github.com/folke/lazy.nvim#-plugin-spec
		-- Yes, you will have to repeat the name in both the key and the config.
	},
	treesitter_lang = {}, -- List of treesitter languages to support: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
	lang = {
		-- format should look like:
		-- language_server_name = { LSP Config },
		-- LSP Config: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	},
	mason = {}, -- Any custom Mason configuration: https://github.com/williamboman/mason.nvim#configuration
	lint = {},
	lint_config = function(lint)
		-- fill me in as necessary
		return {}
	end,
	conform = {},
}
