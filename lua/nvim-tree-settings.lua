vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 48,
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    dotfiles = true,
  },
  hijack_cursor = false,
})
