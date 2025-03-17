local function config(opts)
	local name = string.lower(opts.name:gsub("%..*", ""))
	name = name:gsub("^n?vim%-", ""):gsub("%-n?vim$", ""):gsub("_", "-"):gsub("lspconfig", "lsp")
	local mod = "plugins." .. name
	local m = require(mod)
	if type(m) == "table" then
		m.setup()
	end
end

local function tableize(spec)
	if type(spec) == "string" then
		spec = { spec }
	end
	return spec
end

local function c(spec)
	spec = tableize(spec)
	spec["config"] = config
	return spec
end

local function p(priority, spec)
	spec = tableize(spec)
	spec["priority"] = priority
	return spec
end

local plugins = {
	---- General Utilities
	["nvim-lua/plenary.nvim"] = p(100, "nvim-lua/plenary.nvim"), -- Common Lua functions
	["tanvirtin/vgit.nvim"] = c({
		"tanvirtin/vgit.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	}),
	["nvim-neo-tree/neo-tree.nvim"] = c({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			{
				"s1n7ax/nvim-window-picker", -- Allows selecting which window is used
				version = "v2.x",
			},
		},
	}),
	["tpope/vim-fugitive"] = {
		"tpope/vim-fugitive", -- Adds Neovim Git commands
		event = "BufReadPre",
	},
	["wsdjeg/vim-fetch"] = "wsdjeg/vim-fetch", -- Adds line number (ie file/path:num) parsing to various commands
	["tpope/vim-abolish"] = {
		"tpope/vim-abolish", -- Adds Subvert for smart text replacement
		event = "BufReadPre",
	},
	---- UI
	["catppuccin/nvim"] = p( -- Color Scheme
		1000,
		c({
			"catppuccin/nvim",
			name = "catppuccin",
		})
	),
	["rcarriga/nvim-notify"] = p(100, c("rcarriga/nvim-notify")), -- Pop-up notifications
	["nvim-tree/nvim-web-devicons"] = c("nvim-tree/nvim-web-devicons"), -- More icons!
	["utilyre/barbecue.nvim"] = c({ -- Location bar
		"utilyre/barbecue.nvim",
		event = "BufReadPre",
		dependencies = {
			"SmiteshP/nvim-navic", -- Location Library
			"nvim-tree/nvim-web-devicons",
		},
	}),
	["nvim-lualine/lualine.nvim"] = c({ -- Bottom bar display
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	}),
	["glepnir/dashboard-nvim"] = c({ -- Dashboard for when Neovim opens
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	}),
	["ibhagwan/fzf-lua"] = c({
		"ibhagwan/fzf-lua",
		dependencies = {
			"nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
	}),
	["mrjones2014/legendary.nvim"] = c({
		"mrjones2014/legendary.nvim",
		dependencies = { -- not a real dependencies, just need to have FZF setup before legendary
			"ibhagwan/fzf-lua",
		},
	}),
	["chaoren/vim-wordmotion"] = { -- context aware word traversal for b, w, e keys
		"chaoren/vim-wordmotion",
		event = "BufReadPre",
	},
	---- Language Setup
	--> 1. Setup Snippets
	["L3MON4D3/LuaSnip"] = { -- Base set of snippets
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets", -- More snippets
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_snipmate").lazy_load()
		end,
	},
	--> 2. Language Parser and Configurations
	["nvim-treesitter/nvim-treesitter"] = c({ -- Core language parser
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = function()
			vim.cmd("TSUpdate")
		end,
		lazy = false,
		dependencies = {
			"RRethy/nvim-treesitter-endwise", -- Adds "end"/closes blocks
			"RRethy/nvim-treesitter-textsubjects", -- Adds block aware visual selection expansion
			"nvim-treesitter/nvim-treesitter-textobjects", -- Adds additional language parsing mechanisms
			"m-demare/hlargs.nvim", -- Highlight arguments' definitions and usages
			{
				"hiphish/rainbow-delimiters.nvim", -- Rainbow braces
				branch = "master",
			},
		},
	}),
	["neovim/nvim-lspconfig"] = c({ -- Contains basic LSP configurations, when this runs it loads plugins.lsp due to c's gsub magic
		"neovim/nvim-lspconfig",
		branch = "master",
		event = "BufReadPre",
		dependencies = {
			"cmp-nvim-lsp",
		},
	}),
	["williamboman/mason.nvim"] = c({ -- Installs and Manages LSP Servers
		"williamboman/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim", -- Bridges gap between mason and lspconfig; provides automatic installs/updates
			"b0o/schemastore.nvim", -- contains various schema configs
		},
	}),
	["mfussenegger/nvim-lint"] = c({ -- Additional linters
		event = "BufReadPre",
		"mfussenegger/nvim-lint",
	}),
	["stevearc/conform.nvim"] = c({ -- Formatters
		event = "BufReadPre",
		"stevearc/conform.nvim",
		opts = {},
	}),
	--> 3. Tab / Text Completion
	["hrsh7th/nvim-cmp"] = c({ -- Tab completion
		"hrsh7th/nvim-cmp",
		event = "BufReadPre",
		branch = "main",
		dependencies = {
			"onsails/lspkind.nvim", -- Formats the tab completion menu
			"hrsh7th/cmp-nvim-lsp", -- Complete connected to Neovim's LSP server
			"hrsh7th/cmp-nvim-lua", -- Complete connected to Neovim's Lua API
			"saadparwaiz1/cmp_luasnip", -- Complete snippets
			"hrsh7th/cmp-buffer", -- Complete for current words in the buffer
			"hrsh7th/cmp-path", -- Complete file system paths
			"hrsh7th/cmp-cmdline", -- Enables cmp in '/' (local find) and ':' (command mode)
			"abecodes/tabout.nvim", -- Jump out of things with <tab>
		},
	}),
	["ray-x/lsp_signature.nvim"] = c({
		"ray-x/lsp_signature.nvim",
		branch = "master",
		event = "BufReadPre",
	}), -- Connect tab completion with LSP
	--> 4. Language Tooling
	["jmbuhr/otter.nvim"] = c({ -- Allows for LSP in ``` blocks
		"jmbuhr/otter.nvim",
		event = "LspAttach",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
	}),
	["j-hui/fidget.nvim"] = c({
		"j-hui/fidget.nvim",
		branch = "legacy",
	}), -- Floating LSP Status
	["numToStr/Comment.nvim"] = c({ -- Language aware comment helpers
		"numToStr/Comment.nvim",
		event = "LspAttach",
		dependencies = "JoosepAlviste/nvim-ts-context-commentstring", -- Adds support for additional languages
	}),
	["windwp/nvim-autopairs"] = c({ -- Smart pairing for (["...etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = "hrsh7th/nvim-cmp",
	}),
	["folke/trouble.nvim"] = c({ -- Error/Warning terminal
		"folke/trouble.nvim",
		event = "LspAttach",
	}),
	["simrat39/symbols-outline.nvim"] = c({ -- A tree like view for symbols in a given file
		"simrat39/symbols-outline.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	}),
	["Fildo7525/pretty_hover"] = { -- Displays docs on hotkey
		"Fildo7525/pretty_hover",
		event = "LspAttach",
		opts = {},
	},
	["dgagn/diagflow.nvim"] = c({ -- Displays virtual text in the corner
		"dgagn/diagflow.nvim",
		event = "LspAttach",
	}),
	["shellRaining/hlchunk.nvim"] = {
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("hlchunk").setup({
				chunk = {
					enable = true,
					exclude_filetypes = {
						dashboard = true,
					},
				},
				indent = {
					enable = true,
					chars = {
						"│",
						"¦",
						"┆",
						"┊",
					},
					-- style = {
					-- 	peach = "#fe640b",
					-- 	red = "#d20f39",
					-- 	blue = "#1e66f5",
					-- 	yellow = "#df8e1d",
					-- 	green = "#40a02b",
					-- 	mauve = "#8839ef",
					-- 	teal = "#179299",
					-- },
					style = {
						vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
					},
				},
			})
		end,
	},
	["folke/lazydev.nvim"] = { -- full signature help, docs and completion for the nvim lua API, needs to be setup before lspconfig
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
				"LazyVim",
			},
		},
		dependencies = {
			"Bilal2453/luvit-meta", -- optional `vim.uv` typings
		},
	},
}

local function load_plugins()
	-- Add or replace any existing plugins with custom plugins
	for k, v in pairs(override_settings.plugins) do
		plugins[k] = v
	end

	-- Lazy takes a list, not a map. So flatten the map.
	local all_plugins = {}
	for _, v in pairs(plugins) do
		table.insert(all_plugins, v)
	end

	-- Setup leader to before plugins load to ensure correct keybindings
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "

	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable",
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)

	-- load lazy
	require("lazy").setup({
		spec = all_plugins,
		concurrency = 15,
		install = { colorscheme = { "catppuccin" } },
		defaults = { lazy = false, version = "*" },
		checker = {
			enabled = true,
			frequency = 3600 * 12, -- check every 12 hours
		},
		ui = {
			border = "rounded",
		},
	})
end

load_plugins()
