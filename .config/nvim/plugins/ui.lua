  return {
  'folke/which-key.nvim',
  {
    'folke/neoconf.nvim',
    cmd = 'Neoconf'
  },
  'folke/lazydev.nvim',
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
        },
        filters = {
          dotfiles = false,
          git_ignored = false,
        },
      })
      vim.keymap.set('', '<C-o>', '<Esc>:NvimTreeToggle<CR>', { noremap = true, silent = true })
    end
  },
  'nvim-tree/nvim-web-devicons',
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')
      dashboard.section.header.val = {""}
      dashboard.section.buttons.val = {
        dashboard.button("e", "New file" , ":ene <BAR> startinsert <CR>"),
        dashboard.button("b", "Buffers" , ":Telescope buffers<CR>"),
        dashboard.button("f", "Find file", ":Telescope find_files<CR>"),
        dashboard.button("r", "Recent"   , ":Telescope oldfiles<CR>"),
     -- dashboard.button("s", "Open Last Session", ':source ~/.config/nvim/session.vim<CR>'),
        dashboard.button("c", "Config" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
        dashboard.button("q", "Quit", ":qa<CR>"),
      }
      alpha.setup(dashboard.config)
    end,
    dependencies = {{'nvim-tree/nvim-web-devicons'}},
  },
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
          map('n', ']h', "&diff ? ']h' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
          map('n', '[h', "&diff ? '[h' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

          -- Actions
          map('n', '<leader>sh', ':Gitsigns stage_hunk<CR>')
          map('v', '<leader>sh', ':Gitsigns stage_hunk<CR>')
          map('n', '<leader>rh', ':Gitsigns reset_hunk<CR>')
          map('v', '<leader>rh', ':Gitsigns reset_hunk<CR>')
          map('n', '<leader>sb', '<cmd>Gitsigns stage_buffer<CR>')
          map('n', '<leader>uh', '<cmd>Gitsigns undo_stage_hunk<CR>')
          map('n', '<leader>rb', '<cmd>Gitsigns reset_buffer<CR>')
          map('n', '<leader>ph', '<cmd>Gitsigns preview_hunk<CR>')
          map('n', '<leader>bl', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
          map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
          map('n', '<leader>df', '<cmd>Gitsigns diffthis<CR>')
          map('n', '<leader>dF', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
          map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

          -- Text object
          map('o', 'lh', ':<C-U>Gitsigns select_hunk<CR>')
          map('x', 'lh', ':<C-U>Gitsigns select_hunk<CR>')
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
  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      })
    end,
  },
}
