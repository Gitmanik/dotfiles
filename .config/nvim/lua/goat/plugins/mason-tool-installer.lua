return {
    "WhoIsSethDaniel/mason-tool-installer",

    opts = {
        ensure_installed = {
			-- Python
			"basedpyright",

			-- C/C++
			"clangd",

            -- C#
            "roslyn",

            -- Robot Framework
            "robotframework-lsp",

            -- PHP
            "phpactor",
        },
    }
}
