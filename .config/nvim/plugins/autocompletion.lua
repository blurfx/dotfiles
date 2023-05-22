return {
  'github/copilot.vim',
  {
    'neoclide/coc.nvim',
    branch = 'release',
    init = function()
      vim.g.coc_global_extensions = {
        'coc-tsserver',
        'coc-eslint',
        'coc-prettier',
        'coc-json',
        'coc-yaml',
        'coc-toml',
        'coc-html',
        'coc-css',
        'coc-highlight'
      }
    end,
    config = function()
      function _G.check_back_space()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local has_backspace = vim.api.nvim_get_current_line():sub(col, col):match("%s") ~= nil
        return col == 0 or has_backspace
      end
      
      vim.keymap.set('i', '<TAB>', 'pumvisible() ? "<C-n>" : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', { expr = true, silent = true })
      vim.keymap.set('i', '<S-TAB>', 'pumvisible() ? "<C-p>" : "<C-h>"', { expr = true })
    end,
  },
}
