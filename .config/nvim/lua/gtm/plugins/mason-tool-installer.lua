return {
    "WhoIsSethDaniel/mason-tool-installer",

    opts = {
        ensure_installed = {
			-- Python
			"basedpyright",

			-- C/C++
			"clangd",

            -- Robot Framework
            "robotframework-lsp",

            -- PHP
            "phpactor",

            -- LaTeX
            "tree-sitter-cli",
            "texlab",
            "tectonic",
        },
    }
}
