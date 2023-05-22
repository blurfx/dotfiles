return {
  'folke/which-key.nvim',
  {
    'folke/neoconf.nvim',
    cmd = 'Neoconf'
  },
  'folke/neodev.nvim',
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'onedark',
      },
    },
  },
  'nvim-tree/nvim-web-devicons',
  {
    'joshdick/onedark.vim',
    config = function()
      vim.cmd.colorscheme('onedark')
    end,
  },
  'blurfx/auto-indent.vim',
}