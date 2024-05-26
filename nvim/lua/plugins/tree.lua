return {
  {
    "nvim-tree/nvim-web-devicons"
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.opt.termguicolors = true
      require("nvim-tree").setup({
        view = {
          width = 48,
        },
        renderer = {
          group_empty = true,
          indent_markers = {
            enable = true,
          },
        },
        hijack_cursor = false,
      })
      local api = require "nvim-tree.api"
      vim.keymap.set("n", "<leader>m", api.tree.toggle, {})
    end
  },
}
