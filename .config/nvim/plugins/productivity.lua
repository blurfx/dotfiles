return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() 
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<M-S-p>', builtin.find_files, {})
      vim.keymap.set('n', '<M-S-f>', builtin.live_grep, {})
    end,
  },
  'wakatime/vim-wakatime',
  {
    'akinsho/toggleterm.nvim',
    cmd = { 'ToggleTerm', 'TermExec' },
    keys = {
      {
        '<C-\\>',
        mode = { 'n', 't' },
        silent = true,
        function()
          local venv = vim.b['virtual_env']
          local term = require('toggleterm.terminal').Terminal:new({
            env = venv and { VIRTUAL_ENV = venv } or nil,
            count = vim.v.count > 0 and vim.v.count or 1,
          })
          term:toggle()
        end,
        desc = 'Toggle terminal',
      },
    },
    opts = {
      open_mapping = false,
      float_opts = {
        border = 'curved',
      },
    },
  },
  { 'junegunn/goyo.vim' },
  { 'junegunn/limelight.vim' },
}
