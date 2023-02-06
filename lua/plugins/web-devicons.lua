local status_ok, web_devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
  return
end

web_devicons.set_icon {
  lock = { icon = "", name = "Lock" },
  zip = { icon = "", name = "Zip" },
}
