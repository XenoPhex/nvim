return {
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
				["https://raw.githubusercontent.com/streetsidesoftware/cspell/main/cspell.schema.json"] = "cspell.json",
			},
			schemaStore = {
				url = "https://www.schemastore.org/api/json/catalog.json",
				enable = true,
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
