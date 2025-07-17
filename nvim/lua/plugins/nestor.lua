return {
  url = "ssh://git@gitlab.tcsbank.ru:7999/nestor/assistant.git",
  name = "nestor",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function(plugin)
    vim.opt.rtp:append(plugin.dir .. "/neovim_plugin")
    -- This is needed for nestor docs to be picked up after editing rtp
    vim.cmd("helptags ALL")
    require("nestor").setup()
  end,
}
