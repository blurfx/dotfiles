return {
	'blurfx/auto-indent.vim',
	'folke/which-key.nvim',
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
					icons = {
						show = {
							file = false,
							folder = false,
							folder_arrow = true,
							git = false,
							modified = false,
						},
						glyphs = {
							folder = {
								arrow_closed = ">",
								arrow_open = "v",
							},
						},
					},
				},
			})
			vim.keymap.set('', '<C-o>', '<Esc>:NvimTreeToggle<CR>', { noremap = true, silent = true })
		end
	},
	{
		'joshdick/onedark.vim',
		config = function()
			vim.cmd.colorscheme('onedark')
		end
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
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({})
		end,
	},
	{
		'mason-org/mason.nvim',
		opts = {}
	},
	{
		'nvim-telescope/telescope.nvim', version = '*',
		config = function() 
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<M-S-p>', builtin.find_files, {})
			vim.keymap.set('n', '<M-S-f>', builtin.live_grep, {})
		end,
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- optional but recommended
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		}
	},
	{
		'nvim-lualine/lualine.nvim',
		opts = {
			options = {
				icons_enabled = false,
				theme = 'onedark',
				component_separators = { left = '>', right = '<'},
				section_separators = { left = '', right = ''},
			},
		},
	},
	{
		'romgrk/barbar.nvim',
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			icons = {
				button = '✕',
				filetype = { enabled = false }
			},
		}
	},
	{
		'easymotion/vim-easymotion',
		keys = {
			{'f', '<Plug>(easymotion-overwin-f)', mode = 'n'},
			{'f', '<Plug>(easymotion-bd-f)'},
		}
	}
}
