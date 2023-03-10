local status_ok, barbecue = pcall(require, "barbecue")
if not status_ok then
	return
end

barbecue.setup({
	theme = "catppuccin",
	exclude_filetypes = { "gitcommit", "toggleterm", "neo-tree" },
	show_modified = true,
	show_dirname = true,
	kinds = {
		File = "", -- File
		Module = "", -- Module
		Namespace = "", -- Namespace
		Package = "", -- Package
		Class = "", -- Class
		Method = "", -- Method
		Property = "", -- Property
		Field = "", -- Field
		Constructor = "", -- Constructor
		Enum = "", -- Enum
		Interface = "", -- Interface
		Function = "", -- Function
		Variable = "", -- Variable
		Constant = "", -- Constant
		String = "", -- String
		Number = "", -- Number
		Boolean = "◩", -- Boolean
		Array = "", -- Array
		Object = "", -- Object
		Key = "", -- Key
		Null = "ﳠ", -- Null
		EnumMember = "", -- EnumMember
		Struct = "", -- Struct
		Event = "", -- Event
		Operator = "", -- Operator
		TypeParameter = "", -- TypeParameter
		Macro = "", -- Macro
	},
})
