vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    -- Unset 'formatexpr'
    vim.bo[args.buf].formatexpr = nil
    -- Unset 'omnifunc'
    vim.bo[args.buf].omnifunc = nil
    -- Unmap K
    -- vim.keymap.del("n", "K", { buffer = args.buf })

    local opts = { silent = true }
    opts.desc = "Show LSP references"
    vim.keymap.set("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts) -- show definition, references

    opts.desc = "Go to declaration"
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

    opts.desc = "Show LSP definitions"
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definitions

    opts.desc = "Show LSP implementations"
    vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts) -- show lsp implementations

    opts.desc = "See available code actions"
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

    opts.desc = "Smart rename"
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

    -- opts.desc = "Show buffer diagnostics"
    -- vim.keymap.set("n", "<leader>D", "<cmd>FzfLua diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

    opts.desc = "Show line diagnostics"
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

    opts.desc = "Go to previous diagnostic"
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

    opts.desc = "Go to next diagnostic"
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

    opts.desc = "Show documentation for what is under cursor"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

    opts.desc = "Show documentation for what is under cursor"
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

    vim.diagnostic.config({ virtual_lines = { current_line = true } })
end,
})

vim.lsp.config["basedpyright"] = {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
}
vim.lsp.enable("basedpyright")

vim.lsp.config("roslyn", {
    settings = {
        ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
        },
        ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
        },
    },
    filetypes = { "cs" },
    filewatching = "roslyn",
})
vim.lsp.enable("roslyn")

-- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
--     pattern = "*",
--     callback = function()
--         local clients = vim.lsp.get_clients({ name = "roslyn" })
--         if not clients or #clients == 0 then
--             return
--         end
--
--         local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
--         local buffers = vim.lsp.get_buffers_by_client_id(ctx.client_id)
--         for _, buf in ipairs(buffers) do
--             local params = { textDocument = vim.lsp.util.make_text_document_params(buf) }
--             client:request("textDocument/diagnostic", params, nil, buf)
--         end
--     end,
-- })

vim.lsp.config["robotframework"] = {
    cmd = { 'robotframework_ls' },
    filetypes = { 'robot' },
    root_markers = { 'robotidy.toml', 'robot.yaml', '.git' },
}
vim.lsp.enable("robotframework")

vim.lsp.config["phpactor"] =  {
    cmd = { "phpactor", "language-server" },
    filetypes = { "php" },
    root_markers = { ".git", "composer.json", ".phpactor.json", ".phpactor.yml" },
    -- workspace_required = true,
}
vim.lsp.enable("phpactor")

