return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find git-files in cwd" })
    vim.keymap.set("n", "<leader>fs", "<cmd>FzfLua live_grep_native<cr>", { desc = "Find Files" })
  end,
}
