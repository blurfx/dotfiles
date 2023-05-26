local script_path = debug.getinfo(1, "S").source:sub(2)
local script_dir = script_path:match("(.*[/\\])")
package.path = package.path .. ";" .. script_dir .. "?.lua"

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- UI
  require('plugins.ui'),

  -- Autocompletion
  require('plugins.autocompletion'),
  
  -- Language Support
  require('plugins.languages'),

  -- Productivity
  require('plugins.productivity'),
})

-- Vim Built-in settings
vim.cmd.cnoreabbrev('W!', 'w!')
vim.cmd.cnoreabbrev('Q!', 'q!')
vim.cmd.cnoreabbrev('Wq', 'wq')
vim.cmd.cnoreabbrev('Wa', 'wa')
vim.cmd.cnoreabbrev('wQ', 'wq')
vim.cmd.cnoreabbrev('WQ', 'wq')
vim.cmd.cnoreabbrev('W', 'w')
vim.cmd.cnoreabbrev('Q', 'q')
vim.cmd('filetype plugin indent on')
vim.cmd('highlight CursorLine cterm=bold gui=bold')
vim.o.syntax = 'on'
vim.o.autoindent = true
vim.o.background = 'dark'
vim.o.backspace = 'indent,eol,start'
vim.o.cindent = true
vim.o.cul = true
vim.o.display = 'lastline'
vim.o.encoding = 'utf-8'
vim.o.formatoptions = vim.o.formatoptions .. 'o'
vim.o.gdefault = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.laststatus = 2
vim.o.lazyredraw = true
vim.o.mouse = 'nicr'
vim.o.number = true
vim.o.ruler = true
vim.o.showmatch = true
vim.o.showmode = true
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.ttyfast = true
vim.o.hidden = true
vim.o.termguicolors = true
vim.o.incsearch = true
vim.o.autoread = true
vim.o.wildmenu = true
vim.o.wildmode = 'full'
vim.o.wildignorecase = true
vim.o.backupdir = '/tmp//,'
vim.o.directory = '/tmp//,'

-- Vim key mappings
vim.g.mapleader = ','

vim.keymap.set('n', '<Space>', '<PageDown>', {})
vim.keymap.set('n', '<M-Space>', '<PageUp>', {})

vim.keymap.set('n', '<leader>bn', ':enew<CR>', { noremap = true })
vim.keymap.set('n', '<leader>[', ':bprevious<CR>', { noremap = true })
vim.keymap.set('n', '<leader>]', ':bnext<CR>', { noremap = true })
vim.keymap.set('n', '<leader>bc', ':bdelete<CR>', { noremap = true })
vim.keymap.set('n', '<leader>bC', ':bdelete!<CR>', { noremap = true })

vim.keymap.set('n', '<leader>tt', ':tabnew<CR>', { noremap = true })
vim.keymap.set('n', '<leader>t[', ':tabprevious<CR>', { noremap = true })
vim.keymap.set('n', '<leader>t]', ':tabnext<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tC', ':tabclose!<CR>', { noremap = true })

