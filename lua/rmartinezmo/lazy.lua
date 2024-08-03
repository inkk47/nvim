local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    { import = "rmartinezmo.plugins" },
    { import = "rmartinezmo.plugins.lsp" },
    { import = "rmartinezmo.plugins.ui" },
    { import = "rmartinezmo.plugins.syntax" },
    { import = "rmartinezmo.plugins.utils" },
  },
  {
    checker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = false,
    },
  }
)
