require('onedark').setup {
  style = 'warmer',
  colors = {
    bright_orange = '#ff8800',
    amethyst = '#9966cc',
    veryperi = '#6667ab',
    nice_purple = '#7350d1',
  },
  highlights = {
    ["@string"] = {fg = '$nice_purple'},
    ["@text"] = {fg = '$amethyst'},
    ["@type"] = {fg = '$bright_orange'},
    ["@constant"] = {fg = '$veryperi'},
  }
}
