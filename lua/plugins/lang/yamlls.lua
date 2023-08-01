local schemas = {}
local status_ok, schemastore = pcall(require, "schemastore")
if status_ok then
	schemas = schemastore.yaml.schemas({
		extra = {
			{
				name = "k8s.yaml",
				description = "K8s yamls",
				fileMatch = "/*.k8s.yaml",
				url = "https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json",
			},
		},
	})
end

return {
	settings = {
		yaml = {
			schemas = schemas,
			schemaStore = { -- ignore built-in functionality to use schemastore plugin instead
				url = "",
				enable = false,
			},
			settings = {
				redhat = {
					telemetry = {
						enabled = false,
					},
				},
			},
		},
	},
}
