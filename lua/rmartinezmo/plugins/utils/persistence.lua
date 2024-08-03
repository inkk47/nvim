return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>qr", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qx", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
}
