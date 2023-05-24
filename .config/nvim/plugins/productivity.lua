return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() 
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<M-p>', builtin.find_files, {})
      vim.keymap.set('n', '<M-S-f>', builtin.live_grep, {})
    end,
  },
  'wakatime/vim-wakatime',
}
