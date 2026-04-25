-- if when healthchecking, cannot find 'tree-sitter' executable, install 'tree-sitter-cli' via npm

require('nvim-treesitter').install({'c', 'cpp', 'python', 'latex', 'rust', 'lua', 'markdown', 'javascript', 'typst'})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function()
    vim.treesitter.start()

    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'

    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
