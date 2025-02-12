return {
  {
    "vijaymarupudi/nvim-fzf",
  },
  {
    "junegunn/fzf",
    dir = "~/.fzf",
    build = "./install --bin",
    name = "fzf"
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("fzf-lua").setup({})
        vim.keymap.set("n", "<C-p>", require("fzf-lua").files, {})
        vim.keymap.set("n", "<C-g>", require("fzf-lua").live_grep, {})
        vim.keymap.set("x", "<C-g>", require("fzf-lua").grep_visual, {})
        vim.keymap.set("n", "gs", require("fzf-lua").git_status, {})
    end
  },
}
