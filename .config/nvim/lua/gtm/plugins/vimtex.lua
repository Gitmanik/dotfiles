return {
    "lervag/vimtex",
    lazy = true,
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_method = 'latexmk'
        vim.g.vimtex_view_forward_search_on_start = false
        vim.g.tex_conceal='abdmg'
        conceallevel = 1
        vim.cmd([[autocmd BufEnter *.tex set conceallevel=1]])
        vim.g.vimtex_compiler_latexmk = {
            aux_dir = vim.fn.stdpath("cache") .. "/vimtex_aux",
        }
    end
}
