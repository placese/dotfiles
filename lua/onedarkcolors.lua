require('onedark').setup {
  style = 'warmer',
  colors = {
    bright_orange = '#ff8800',
    amethyst = '#9966cc',
    veryperi = '#6667ab',
  },
  highlights = {
    ["@string"] = {fg = '$amethyst'},
    ["@text"] = {fg = '$amethyst'},
    ["@type"] = {fg = '$bright_orange'},
    ["@constant"] = {fg = '$veryperi'},
  }
}
