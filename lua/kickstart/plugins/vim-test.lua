return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  vim.keymap.set('n', '<leader>t', ':TestNearest<CR>', { desc = '[T]est Nearest' }),
  vim.keymap.set('n', '<leader>T', ':TestFile<CR>', { desc = '[T]est File' }),
  vim.keymap.set('n', '<leader>a', ':TestSuite<CR>', { desc = '[T]est Suite' }),
  vim.keymap.set('n', '<leader>l', ':TestLast<CR>', { desc = '[T]est Last' }),
  vim.keymap.set('n', '<leader>g', ':TestVisit<CR>', { desc = '[T]est Visit' }),
  vim.cmd("let test#strategy = 'vimux'")
}
