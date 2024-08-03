return {
  "ThePrimeagen/harpoon",
  lazy = false,
  branch = "harpoon2",
  init = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "Add new harpoon file" })
    keymap.set("n", "<leader>hh", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Open harpoon file list" })

    keymap.set("n", "<leader>h1", function()
      harpoon:list():select(1)
    end, { desc = "Open harpoon file 1" })
    keymap.set("n", "<leader>h2", function()
      harpoon:list():select(2)
    end, { desc = "Open harpoon file 2" })
    keymap.set("n", "<leader>h3", function()
      harpoon:list():select(3)
    end, { desc = "Open harpoon file 3" })
    keymap.set("n", "<leader>h4", function()
      harpoon:list():select(4)
    end, { desc = "Open harpoon file 4" })

    -- Toggle previous & next buffers stored within Harpoon list
    keymap.set("n", "<leader>hp", function()
      harpoon:list():prev()
    end, { desc = "Prev harpoon file" })
    keymap.set("n", "<leader>hn", function()
      harpoon:list():next()
    end, { desc = "Next harpoon file" })
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
}
