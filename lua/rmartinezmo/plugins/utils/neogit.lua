return {
  "NeogitOrg/neogit",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup({})

    vim.keymap.set("n", "<leader>gn", neogit.open, { silent = true, noremap = true, desc = "Open Neogit" })
    vim.keymap.set(
      "n",
      "<leader>gc",
      ":Neogit commit<CR>",
      { silent = true, noremap = true, desc = "Commit changes with Neogit" }
    )
    vim.keymap.set(
      "n",
      "<leader>gp",
      ":Neogit pull<CR>",
      { silent = true, noremap = true, desc = "Pull changes with Neogit" }
    )
    vim.keymap.set(
      "n",
      "<leader>gP",
      ":Neogit push<CR>",
      { silent = true, noremap = true, desc = "Push changes with Neogit" }
    )
    vim.keymap.set(
      "n",
      "<leader>fb",
      ":Telescope git_branches<CR>",
      { silent = true, noremap = true, desc = "List git branches with Telescope" }
    )
    vim.keymap.set("n", "<leader>gB", ":G blame<CR>", { silent = true, noremap = true, desc = "Git blame" })
  end,
}
