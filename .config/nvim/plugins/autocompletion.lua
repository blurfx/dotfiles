return {
  -- 'github/copilot.vim',
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
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

      
      -- vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', { expr = true, silent = true })
      vim.keymap.set("i", "<S-TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', { expr = true, silent = true })
      -- vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], { expr = true, silent = true })
      vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], { expr = true, silent = true })

    end,
  },
  'rstacruz/vim-closer',
}
