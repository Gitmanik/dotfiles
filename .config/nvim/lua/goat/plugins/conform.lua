return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        rust = { "rustfmt" },
        go = { "goimports", "gofmt" },
        markdown = { "prettierd" },
        yaml = { "prettierd" },
      },

      format_on_save = function(bufnr)
        -- Enable autoformat on certain filetypes
        local format_filetypes = { "go", "lua" }
        if not vim.tbl_contains(format_filetypes, vim.bo[bufnr].filetype) then
          return
        end

        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
    })

    -- keymaps

    vim.keymap.set("n", "<leader>fm", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file" })
  end,
}
