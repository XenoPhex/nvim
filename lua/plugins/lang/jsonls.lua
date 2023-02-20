local schemas = {}
local status_ok, schemastore = pcall(require, "schemastore")
if status_ok then
	schemas = schemastore.json.schemas()
end

return {
	settings = {
		json = {
			schemas = schemas,
			validate = { enable = true },
		},
	},
}
