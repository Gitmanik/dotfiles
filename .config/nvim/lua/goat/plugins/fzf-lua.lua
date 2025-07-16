return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    files = {

      -- Use `rg` as the file lister, which respects .gitignore
      cmd = "rg --files --hidden --glob '!.git/'"
    },
    grep = {
      -- Use `rg` for grep with .gitignore support
      rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden --glob '!.git/'"
    },
  },
  config = function()
    vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find git-files in cwd" })
    vim.keymap.set("n", "<leader>fs", "<cmd>FzfLua live_grep_native<cr>", { desc = "Find Files" })
  end,
}
