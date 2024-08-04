return {
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require("which-key").setup()

    -- Document existing key chains
    require("which-key").add({
      { "<leader>g", group = "git" },
      { "<leader>H", group = "git hunks" },
      { "<leader>K", group = "Keywordprg", icon = { icon = " ", color = "blue" } },
      { "<leader>n", group = "no neckpain", icon = { icon = " ", color = "blue" } },
      { "<leader>U", group = "undotree", icon = { icon = " ", color = "grey" } },
      { "<leader>l", group = "open LazyVim", icon = { icon = "󰒲 ", color = "blue" } },
      { "<leader>h", group = "harpoon", icon = { icon = " ", color = "grey" } },
      { "<leader>o", group = "obsidian", icon = { icon = " ", color = "purple" } },
      { "<leader>c", group = "code" },
      { "<leader>f", group = "file/find" },
      { "<leader>q", group = "quit/session" },
      { "<leader>s", group = "search" },
      { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
      { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
      { "<leader>p", group = "paste bellow", icon = { icon = " ", color = "cyan" } },
      { "<leader>P", group = "paste above", icon = { icon = " ", color = "cyan" } },
      { "<leader>W", group = "set wrap", icon = { icon = "󰖶 ", color = "cyan" } },
      -- { "<leader><tab>", group = "tabs" },
      -- { "[", group = "prev" },
      -- { "]", group = "next" },
      -- { "g", group = "goto" },
      -- { "gs", group = "surround" },
      -- { "z", group = "fold" },
      {
        "<leader>b",
        group = "buffer",
        expand = function()
          return require("which-key.extras").expand.buf()
        end,
      },
      {
        "<leader>w",
        group = "windows",
        proxy = "<c-w>",
        expand = function()
          return require("which-key.extras").expand.win()
        end,
      },
      -- better descriptions
      { "gx", desc = "Open with system app" },
      -- { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    })
  end,
}
