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
  {
    'nvim-tree/nvim-tree.lua',
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
      require('nvim-tree').setup({
        renderer = {
          highlight_git = true,
        }
      })

      vim.keymap.set('', '<C-o>', '<Esc>:NvimTreeToggle<CR>', { noremap = true, silent = true })
    end
  },
  'nvim-tree/nvim-web-devicons',
  {
    'joshdick/onedark.vim',
    config = function()
      vim.cmd.colorscheme('onedark')
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local function map(mode, lhs, rhs, opts)
              opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
              vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
          end

          -- Navigation
          map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
          map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

          -- Actions
          map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
          map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
          map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
          map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
          map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
          map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
          map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
          map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
          map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
          map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
          map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

          -- Text object
          map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
          map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
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
