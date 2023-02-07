local file = require("utils.file")

-- Setup Globals
_G.CONFIG_PATH = vim.fn.stdpath "config"
_G.DATA_PATH = vim.fn.stdpath "data"
_G.CACHE_PATH = vim.fn.stdpath "cache"
_G.XDG_CONFIG_HOME = os.getenv "XDG_CONFIG_HOME" or file.join(os.getenv "HOME", ".config")
_G.tbl = require("utils.table")
_G.global_settings = {
    log = { level = "INFO" },
}

_G.override_settings = file.load_module("custom") or { plugins = {}, mason = {}, lang = {} }

require("options")

vim.cmd "set whichwrap+=<,>,[,]"
vim.cmd [[set iskeyword+=-]]
-- diable open fold with `l`
vim.cmd [[set foldopen-=hor]]

vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"

require("plugins")
require("keyboard")
require("autocmd")
vim.notify("Config Loaded!", "info")
