return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "ahmedkhalf/project.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
      config = function()
        -- keymap.set("n", "<space>fb", ":telescope file_browser<cr>")
        -- open file_browser with the path of the current buffer
        -- keymap.set(
        --   "n",
        --   "<space>e",
        --   ":Telescope file_browser path=%:p:h select_buffer=true<cr>",
        --   { desc = "telescope file browser" }
        -- )
      end,
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local trouble = require("trouble")
    local trouble_telescope = require("trouble.sources.telescope")
    telescope.setup({
      defaults = {
        path_display = { "truncate = 4", "hidden = false" },
        -- path_display = { "smart" },
        mappings = {
          i = {
            ["<c-k>"] = actions.move_selection_previous, -- move to prev result
            ["<c-j>"] = actions.move_selection_next, -- move to next result
            ["<c-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<c-t>"] = trouble_telescope.open,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("projects")
    require("project_nvim").setup({
      manual_mode = true,
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local builtin = require("telescope.builtin")
    keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "find files in root" })
    keymap.set(
      "n",
      "<leader>fa",
      ":lua require('telescope.builtin').find_files({ hidden = true })<cr>",
      { desc = "find dotfiles in root" }
    )
    keymap.set(
      "n",
      "<leader>ff",
      ':lua require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })<cr>',
      { noremap = true, silent = true, desc = "find files in cwd" }
    )
    -- keymap.set("n", "<leader>/", "<cmd>telescope current_buffer_fuzzy_find<cr>", { desc = "buffer search" })
    keymap.set("n", "<leader>/", function()
      -- you can pass additional configuration to telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "fuzzily search in current buffer" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "open recent files" })
    keymap.set("n", "<leader>fc", "<cmd>telescope grep_string<cr>", { desc = "find string under cursor in cwd" })
    keymap.set("n", "<leader>fh", "<cmd>Telescope command_history<cr>", { desc = "command history" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "find todos" })
    keymap.set("n", "<leader>-", require("telescope.builtin").buffers, { desc = "find existing buffers" })
    -- projects
    keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "projects" })

    -- search
    keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "find string in cwd" })
    keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "search current word" })
    keymap.set("n", "<leader>ss", builtin.builtin, { desc = "search select telescope" })
    keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "search diagnostics" })
    keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "search keymaps" })
    keymap.set("n", "<leader>s/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "live grep in open files",
      })
    end, { desc = "search in open files" })
    -- shortcut for searching your neovim configuration files
    keymap.set("n", "<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "search neovim files" })

    -- git
    keymap.set("n", "<leader>gc", "<cmd>telescope git_commits<cr>", { desc = "list commits" })
    keymap.set("n", "<leader>gb", "<cmd>telescope git_branches<cr>", { desc = "list branches" })
    -- keymap.set("n", "<leader>gf", "<cmd>telescope git_files<cr>", { desc = "list git files" })
    keymap.set("n", "<leader>gs", "<cmd>telescope git_status<cr>", { desc = "status changes" })
  end,
}
