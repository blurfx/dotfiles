local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Font configuration
config.font = wezterm.font('MesloLGS NF')
config.font_size = 14.0
config.color_scheme = 'Seoul256 (Gogh)'
config.enable_tab_bar = false
config.hide_mouse_cursor_when_typing = true
config.scrollback_lines = 100000
config.selection_word_boundary = ' \t\n{}[]()"\':;,│'
config.default_prog = { '/bin/zsh', '-l', '-i', '-c', 'tmux' }
config.window_decorations = 'RESIZE'
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.window_background_opacity = 0.95
config.macos_window_background_blur = 20
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false
config.automatically_reload_config = true

-- Key bindings
config.keys = {
  -- Alt + Arrow keys for word navigation
  {
    key = 'RightArrow',
    mods = 'ALT',
    action = wezterm.action.SendString('\x1bF'),
  },
  {
    key = 'LeftArrow',
    mods = 'ALT',
    action = wezterm.action.SendString('\x1bB'),
  },
  
  -- Tmux bindings
  {
    key = 'p',
    mods = 'CMD',
    action = wezterm.action.SendString('\x02p'),
  },
  {
    key = 'r',
    mods = 'CMD',
    action = wezterm.action.SendString('\x02,'),
  },
  
  -- Number keys for tmux windows
  {
    key = '1',
    mods = 'CMD',
    action = wezterm.action.SendString('\x021'),
  },
  {
    key = '2',
    mods = 'CMD',
    action = wezterm.action.SendString('\x022'),
  },
  {
    key = '3',
    mods = 'CMD',
    action = wezterm.action.SendString('\x023'),
  },
  {
    key = '4',
    mods = 'CMD',
    action = wezterm.action.SendString('\x024'),
  },
  {
    key = '5',
    mods = 'CMD',
    action = wezterm.action.SendString('\x025'),
  },
  {
    key = '6',
    mods = 'CMD',
    action = wezterm.action.SendString('\x026'),
  },
  {
    key = '7',
    mods = 'CMD',
    action = wezterm.action.SendString('\x027'),
  },
  {
    key = '8',
    mods = 'CMD',
    action = wezterm.action.SendString('\x028'),
  },
  {
    key = '9',
    mods = 'CMD',
    action = wezterm.action.SendString('\x029'),
  },
  
  -- Command + Shift bindings
  {
    key = 'N',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SendString('\x02N'),
  },
  {
    key = 'R',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SendString('\x02$'),
  },
  {
    key = 'Z',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SendString('\x02z'),
  },
  
  -- tmux bindings
  {
    key = 's',
    mods = 'CMD',
    action = wezterm.action.SendString('\x02q'),
  },
  {
    key = 't',
    mods = 'CMD',
    action = wezterm.action.SendString('\x02c'),
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.SendString('\x02X'),
  },
  {
    key = 'D',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SendString('\x02"'),
  },
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SendString('\x02%'),
  },
  {
    key = 'o',
    mods = 'CMD',
    action = wezterm.action.SendString('\x02o'),
  },
  {
    key = 'F',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SendString('\x1bF'),
  },
  {
    key = 'P',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SendString('\x1bP'),
  },
  {
    key = 'O',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SendString('\x02\x0f'),
  },
  
  -- Arrow key navigation
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action.SendString('\x02H'),
  },
  {
    key = 'DownArrow',
    mods = 'CMD',
    action = wezterm.action.SendString('\x02J'),
  },
  {
    key = 'UpArrow',
    mods = 'CMD',
    action = wezterm.action.SendString('\x02K'),
  },
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action.SendString('\x02L'),
  },
  
  -- Additional bindings
  {
    key = 'e',
    mods = 'CMD',
    action = wezterm.action.SendString('\x02w'),
  },
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.SendString('\x1bk'),
  },
  {
    key = 'n',
    mods = 'CMD',
    action = wezterm.action.SendString('\x1bn'),
  }
}


return config
