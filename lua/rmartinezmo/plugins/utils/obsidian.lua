return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Obsidian note", mode = "n" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian notes", mode = "n" },
    { "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch", mode = "n" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Show location list of backlinks", mode = "n" },
    { "<leader>ol", "<cmd>ObsidianLinks<cr>", desc = "Open note links", mode = "n" },
    { "<leader>ot", "<cmd>ObsidianToday<cr>", desc = "Open today note", mode = "n" },
    { "<leader>oT", "<cmd>ObsidianTemplate<cr>", desc = "Instert template", mode = "n" },
    { "<leader>oc", "<cmd>ObsidianToggleCheckbox<cr>", desc = "Toggle checkbox", mode = "n" },
  },
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    disable_frontmatter = true,
    workspaces = {
      {
        name = "Digital-brain",
        path = "~/Obsidian/Digital-brain",
      },
    },
    notes_subdir = "01 - Inbox",
    daily_notes = {
      folder = "05 - Daily/Daily/",
      template = "99 - Meta/00 - Templates/Daily/TPL-Daily.md",
    },
    templates = {
      folder = "99 - Meta/00 - Templates/",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
    ui = {
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["/"] = { char = "󰦕", hl_group = "ObsidianRightArrow" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
      },
    },
    mappings = {},
    -- Where to put new notes. Valid options are
    --  * "current_dir" - put new notes in same directory as the current buffer.
    --  * "notes_subdir" - put new notes in the default notes subdirectory.
    new_notes_location = "notes_subdir",

    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      -- Create timestamp+title_name
      -- return tostring(os.time()) .. "-" .. suffix
      return suffix
    end,

    -- -- Optional, customize how note file names are generated given the ID, target directory, and title.
    -- ---@param spec { id: string, dir: obsidian.Path, title: string|? }
    -- ---@return string|obsidian.Path The full path to the new note.
    -- note_path_func = function(spec)
    --   -- This is equivalent to the default behavior.
    --   local path = spec.dir / tostring(spec.id)
    --   return path:with_suffix(".md")
    -- end,

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    ---@param url string
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      vim.fn.jobstart({ "open", url }) -- Mac OS
      -- vim.fn.jobstart({"xdg-open", url})  -- linux
      -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
      -- vim.ui.open(url) -- need Neovim 0.10.0+
    end,
  },
}
