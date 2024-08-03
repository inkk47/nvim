return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      -- filesystem = {
      --   filtered_items = {
      --     hide_dotfiles = false,
      -- },
      -- },
    })
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>e", ":Neotree filesystem reveal left toggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>E", ":Neotree float<CR>", { desc = "Toggle float file explorer" })
    -- keymap.set("n", "<leader>bf", ":Neotree buffers reveal float toggle<CR>", {desc = "Reveal buffers"})
  end,
}
