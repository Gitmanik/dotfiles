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

    opts.desc = "Show buffer diagnostics"
    vim.keymap.set("n", "<leader>D", "<cmd>FzfLua diagnostics_document<CR>", opts) -- show  diagnostics for file

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

    vim.diagnostic.config({ virtual_lines = { 
            current_line = true,
        },
        underline = false,
    })

end,
})

vim.lsp.config("*", {
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
            require("nvim-navic").attach(client, bufnr)
        end
    end,
})

-- Copied from lspconfig/roslyn_ls

local function on_init_sln(client, target)
  vim.notify('Initializing: ' .. target, vim.log.levels.INFO, { title = 'roslyn_ls' })
  ---@diagnostic disable-next-line: param-type-mismatch
  client:notify('solution/open', {
    solution = vim.uri_from_fname(target),
  })
end

---@param client vim.lsp.Client
---@param project_files string[]
local function on_init_project(client, project_files)
  vim.notify('Initializing: projects', vim.log.levels.INFO, { title = 'roslyn_ls' })
  ---@diagnostic disable-next-line: param-type-mismatch
  client:notify('project/open', {
    projects = vim.tbl_map(function(file)
      return vim.uri_from_fname(file)
    end, project_files),
  })
end

vim.lsp.config["roslyn_ls"] = {
    on_init = {
      function(client)
        local root_dir = client.config.root_dir
        local preferred_sln = "Renode_NET.sln"
        local preferred_sln_path = nil

        -- First pass: look for Renode_NET.sln
        for entry, type in vim.fs.dir(root_dir) do
          if type == "file" and entry == preferred_sln then
            preferred_sln_path = vim.fs.joinpath(root_dir, entry)
            break
          end
        end

        if preferred_sln_path then
          on_init_sln(client, preferred_sln_path)
          return
        end

        -- Second pass: fall back to first solution
        for entry, type in vim.fs.dir(root_dir) do
          if type == "file" and vim.endswith(entry, ".sln") then
            on_init_sln(client, vim.fs.joinpath(root_dir, entry))
            return
          end
        end

        -- If no solution is found, load first project
        for entry, type in vim.fs.dir(root_dir) do
          if type == "file" and vim.endswith(entry, ".csproj") then
            on_init_project(client, { vim.fs.joinpath(root_dir, entry) })
          end
        end
      end,
    },

    cmd = {
        'roslyn',
        '--logLevel',
        'Information',
        '--extensionLogDirectory',
        vim.fs.joinpath(vim.fn.stdpath("state"), 'roslyn_ls/logs'),
        '--stdio', 
    }
}

--

vim.lsp.enable("roslyn_ls")
vim.lsp.enable("robotframework_ls")
vim.lsp.enable("basedpyright")
vim.lsp.enable("phpactor")
vim.lsp.enable("clangd")
vim.lsp.enable("texlab")

