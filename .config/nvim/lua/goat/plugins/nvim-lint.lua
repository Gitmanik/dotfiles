return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      go = { "golangcilint" },
    }

    -- local golangcilint = require("lint.linters.golangcilint")
    -- golangcilint.append_fname = true
    -- golangcilint.args = {
    --   "run",
    --   "--out-format",
    --   "json",
    --   "--fast",
    -- }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
      callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>li", lint.try_lint, { desc = "Lint" })
  end,
}
