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
    ["Tastyep/structlog.nvim"] = "Tastyep/structlog.nvim", -- Logging
    ["nvim-lua/plenary.nvim"] = p(100, "nvim-lua/plenary.nvim"), -- Common Lua functions
    ---- UI
    ["alaric/nortia.nvim"] = c { -- Color scheme
        "alaric/nortia.nvim",
        branch = "main",
        dependencies = {
            "rktjmp/lush.nvim" -- Color scheme creation / color management utility
        },
    },
    ["rcarriga/nvim-notify"] = p(100, c("rcarriga/nvim-notify")), -- Pop-up notifications
    ["nvim-telescope/telescope.nvim"] = c { -- Fuzzy finder for files, buffer, etc.
        "nvim-telescope/telescope.nvim",
        dependencies = { "telescope-fzf-native.nvim" },
    },
    ["nvim-telescope/telescope-fzf-native.nvim"] = { -- Use native FZF (will install automatically)
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        lazy = true,
    },
    -- TODO: Look into https://github.com/nvim-telescope/telescope-ui-select.nvim
    ["nvim-tree/nvim-web-devicons"] = c "nvim-tree/nvim-web-devicons", -- More icons!
    ["utilyre/barbecue.nvim"] = c { -- Location bar
        "utilyre/barbecue.nvim",
        dependencies = {
            "SmiteshP/nvim-navic", -- Location Library
            "nvim-tree/nvim-web-devicons",
        },
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
          require("luasnip.loaders.from_lua").lazy_load()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_snipmate").lazy_load()
        end,
    },
    --> 2. Tab Completion
    -- Try https://github.com/folke/neodev.nvim instead
    ["hrsh7th/nvim-cmp"] = c { -- Tab completion
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer", -- Complete for current words in the buffer
            "hrsh7th/cmp-cmdline", -- Complete for command line
            "hrsh7th/cmp-nvim-lsp", -- Complete connected to NeoVim's LSP server
            "hrsh7th/cmp-nvim-lua", -- Complete connected to NeoVim's Lua API
            "hrsh7th/cmp-path", -- Complete filesystem paths
            "onsails/lspkind.nvim", -- Adds icons to completions
            "saadparwaiz1/cmp_luasnip", -- Complete snippets
            -- "cmp-nvim-lsp-signature-help" - try it -> https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
        },
    },
    ["ray-x/lsp_signature.nvim"] = c "ray-x/lsp_signature.nvim", -- Connect tab completion with LSP
    ["lvimuser/lsp-inlayhints.nvim"] = "lvimuser/lsp-inlayhints.nvim", -- Inline documentation 'hints'
    ["nvim-treesitter/nvim-treesitter"] = c { -- Core language integration
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        dependencies = {
            "nvim-treesitter/playground", -- Library used to interact / debug treesitter
            "mrjones2014/nvim-ts-rainbow", -- Rainbow braces
            "RRethy/nvim-treesitter-endwise", -- Adds "end"/closes blocks
            "nvim-treesitter/nvim-treesitter-textobjects", -- Adds additional language parsing mechanisms
        },
    },
    ["neovim/nvim-lspconfig"] = c { -- Contains basic language configurations
        "neovim/nvim-lspconfig",
        branch = "master",
        event = "BufReadPre",
    },
    ["williamboman/mason.nvim"] = c { -- Installs language tools
        "williamboman/mason.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason-lspconfig.nvim", -- Bridges gap between mason and lspconfig
        },
    }
    -- Look into https://github.com/AstroNvim/AstroNvim/blob/main/lua/configs/aerial.lua -> https://github.com/stevearc/aerial.nvim
}

local function load_plugins()
  -- Add or replace any existing plugins with custom plugins
  for k, v in pairs(override_settings.plugins) do plugins[k] = v end

  -- Lazy takes a list, not a map. So flatten the map.
  local all_plugins = {}
  for k, v in pairs(plugins) do table.insert(all_plugins, v) end


  -- Setup leader to before plugins load to ensure correct keybindings
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }
  end
  vim.opt.rtp:prepend(lazypath)

  -- load lazy
  require("lazy").setup {
      spec = all_plugins,
      defaults = { lazy = false, version = "*" },
      checker = { enabled = true, fequency = 3600 },
  }
end

load_plugins()
