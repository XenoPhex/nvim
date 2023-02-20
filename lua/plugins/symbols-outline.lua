local status_ok, so = pcall(require, "symbols-outline")
if not status_ok then
	return
end

so.setup({
	auto_close = true,
	highlight_hovered_item = true,
	show_guides = true,
	show_symbol_details = true,
	wrap = true,
	preview_bg_highlight = "Pmenu",
	relative_width = true,
})
