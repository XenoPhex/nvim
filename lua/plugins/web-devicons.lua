local status_ok, web_devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
	return
end

local icons = require("utils.icons")

web_devicons.set_icon({
	lock = { icon = icons.ui.Lock, name = "Lock" },
	zip = { icon = icons.ui.Zip, name = "Zip" },
})
