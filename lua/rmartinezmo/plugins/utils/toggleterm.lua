return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      direction = "float",
      float_opts = {
        border = "curved",
        -- width = 150,
        -- height = 40,
      },
    })

    -- Define the function to open the terminal in the current buffer's folder
    function _G.open_terminal_in_buffer_folder()
      local buf_path = vim.fn.expand("%:p:h")
      local cmd = "cd " .. buf_path .. " && clear"
      require("toggleterm.terminal").Terminal
        :new({
          dir = buf_path,
          on_open = function(term)
            vim.cmd("startinsert!")
            term:send(cmd)
          end,
        })
        :toggle()
    end

    -- Set up keybindings
    vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm direction=float<CR>", { desc = "open floating terminal" })
    vim.keymap.set(
      "n",
      "<leader>T",
      ":lua open_terminal_in_buffer_folder()<CR>",
      { desc = "open terminal in buffer folder" }
    )
  end,
}
