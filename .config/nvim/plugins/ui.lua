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
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = true
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  'blurfx/auto-indent.vim',
}
