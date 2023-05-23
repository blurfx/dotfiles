return {
  'junegunn/fzf', run = './install --all',
  {
    'junegunn/fzf.vim',
    config = function()
      vim.keymap.set('n', '<M-p>', ':Files .<CR>', { noremap = true, silent = true })
    end
  },
  'wakatime/vim-wakatime',
}