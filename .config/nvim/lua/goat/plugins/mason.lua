return {
    "mason-org/mason.nvim",
    opts = {
        registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry",
        },
        ensure_installed = {
			-- Python
			"basedpyright",

			-- C/C++
			"clangd",

			-- Lua,
			"lua_ls",

            -- C#
            "roslyn",
 
            -- Robot Framework
            "robotframework-lsp",
        },
    }
}
