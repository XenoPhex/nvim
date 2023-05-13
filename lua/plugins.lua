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
	["folke/which-key.nvim"] = c("folke/which-key.nvim"),
	["tanvirtin/vgit.nvim"] = c({
		"tanvirtin/vgit.nvim",
		event = "BufReadPre",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	}),
	["nvim-neo-tree/neo-tree.nvim"] = c({
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"s1n7ax/nvim-window-picker", -- Allows selecting which window is used
		},
	}),
	["fladson/vim-kitty"] = {
		"fladson/vim-kitty", -- Kitty Config helper
		event = "BufReadPre kitty.conf",
	},
	["tpope/vim-fugitive"] = {
		"tpope/vim-fugitive", -- Adds Neovim Git commands
		event = "BufReadPre",
	},
	["wsdjeg/vim-fetch"] = "wsdjeg/vim-fetch", -- Adds line number (ie file/path:num) parsing to various commands
	---- UI
	["catppuccin/nvim"] = p( -- Color Scheme
		1000,
		c({
			"catppuccin/nvim",
			name = "catppuccin",
		})
	),
	["rcarriga/nvim-notify"] = p(100, c("rcarriga/nvim-notify")), -- Pop-up notifications
	["nvim-telescope/telescope.nvim"] = c({ -- Fuzzy finder for files, buffer, etc.
		"nvim-telescope/telescope.nvim",
	}),
	["nvim-tree/nvim-web-devicons"] = c("nvim-tree/nvim-web-devicons"), -- More icons!
	["utilyre/barbecue.nvim"] = c({ -- Location bar
		"utilyre/barbecue.nvim",
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
			"nvim-treesitter/nvim-treesitter",
		},
	}),
	["mrjones2014/legendary.nvim"] = c({
		"mrjones2014/legendary.nvim",
		dependencies = {
			"ibhagwan/fzf-lua", -- not a real dependency, need to have FZF setup before legendary
		},
	}),
	["chrisgrieser/nvim-spider"] = { -- context aware word traversal for b, w, e keys
		"chrisgrieser/nvim-spider",
		lazy = true,
		config = function()
			require("spider").setup({
				skipInsignificantPunctuation = false,
			})
		end,
	},
	---- Language Setup
	--> 1. Setup Snippets
	["L3MON4D3/LuaSnip"] = { -- Base set of snippets
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		build = "make install_jsregexp",
	},
	["rafamadriz/friendly-snippets"] = { -- More snippets
		"rafamadriz/friendly-snippets",
		event = "InsertEnter",
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
			"nvim-treesitter/playground", -- Library used to interact / debug treesitter
			"RRethy/nvim-treesitter-endwise", -- Adds "end"/closes blocks
			"RRethy/nvim-treesitter-textsubjects", -- Adds block aware visual selection expansion
			"nvim-treesitter/nvim-treesitter-textobjects", -- Adds additional language parsing mechanisms
			"m-demare/hlargs.nvim", -- Highlight arguments' definitions and usages
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			"b0o/schemastore.nvim", -- contains various schema configs
			"https://gitlab.com/HiPhish/nvim-ts-rainbow2.git", -- Rainbow braces
		},
	}),
	["neovim/nvim-lspconfig"] = c({ -- Contains basic LSP configurations, when this runs it loads plugins.lsp due to c's gsub magic
		"neovim/nvim-lspconfig",
		branch = "master",
		event = "BufReadPre",
		dependencies = {
			{ "folke/neodev.nvim", config = true }, -- full signature help, docs and completion for the nvim lua API, needs to be setup before lspconfig
		},
	}),
	["jose-elias-alvarez/null-ls.nvim"] = { -- Allows non-LSP Language tools to integrate as LSP tools
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		dependencies = {
			"jay-babu/mason-null-ls.nvim", -- Bridges gap between mason and null_ls; provides automatic installs/updates
		},
	},
	["williamboman/mason.nvim"] = c({ -- Installs and Manages LSP Servers
		"williamboman/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim", -- Bridges gap between mason and lspconfig; provides automatic installs/updates
			"jose-elias-alvarez/null-ls.nvim",
		},
	}),
	--> 3. Tab / Text Completion
	["hrsh7th/nvim-cmp"] = c({ -- Tab completion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
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
	["ray-x/lsp_signature.nvim"] = c("ray-x/lsp_signature.nvim"), -- Connect tab completion with LSP
	--> 4. Language Tooling
	["j-hui/fidget.nvim"] = c("j-hui/fidget.nvim"), -- Floating LSP Status
	["numToStr/Comment.nvim"] = c({ -- Language aware comment helpers
		"numToStr/Comment.nvim",
		dependencies = "JoosepAlviste/nvim-ts-context-commentstring", -- Adds support for additional languages
	}),
	["windwp/nvim-autopairs"] = c({ -- Smart pairing for (["...etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = "hrsh7th/nvim-cmp",
	}),
	["code-biscuits/nvim-biscuits"] = c({ -- Displays opening block on closing block lines
		"code-biscuits/nvim-biscuits",
		event = "InsertEnter",
	}),
	["kevinhwang91/nvim-ufo"] = c({
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			"nvim-treesitter/nvim-treesitter",
			"luukvbaal/statuscol.nvim", -- integrate with the gutter properly
		},
	}),
	["folke/trouble.nvim"] = c("folke/trouble.nvim"), -- Error/Warning terminal
	["git.sr.ht/~whynothugo/lsp_lines.nvim"] = c({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		branch = "main",
	}), -- lsp line display
	["simrat39/symbols-outline.nvim"] = c({ -- A tree like view for symbols in a given file
		"simrat39/symbols-outline.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	}),
	["Fildo7525/pretty_hover"] = { -- Displays docs on hotkey
		"Fildo7525/pretty_hover",
		event = "LspAttach",
		opts = {},
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
	})
end

load_plugins()
