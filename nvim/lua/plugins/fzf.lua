return {
  {
    "vijaymarupudi/nvim-fzf",
  },
  {
    "junegunn/fzf",
    build = "./install --bin"
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({})
      vim.keymap.set("n", "<C-p>", require("fzf-lua").git_files, {})
      vim.keymap.set("n", "<C-g>",
        function() require("fzf-lua").live_grep({ cmd = "git grep --line-number --column --color=always" }) end,
        {})
      vim.keymap.set("x", "<C-g>", require("fzf-lua").grep_visual, {})
      vim.keymap.set("n", "gs", require("fzf-lua").git_status, {})
    end
  },
}
