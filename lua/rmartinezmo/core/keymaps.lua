-- For conciseness
local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Show Full File-Path
keymap.set("n", "<leader>p", "ShowPath") -- Show Full File Path

-- delete single character without copying into register
keymap.set("n", "x", '"_x')
keymap.set("v", "c", '"_c')

-- Indenting
keymap.set("v", "<", "<gv", { silent = true, noremap = true })
keymap.set("v", ">", ">gv", { silent = true, noremap = true })

-- better up/down
keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- windows
keymap.set("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Terminal Mappings
keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
keymap.set("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- telescope
keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Open fuzzy finder" })
keymap.set(
  "n",
  "<leader>fa",
  ":lua require('telescope.builtin').find_files({ hidden = true })<CR>",
  { desc = "Find dotfiles in root" }
)

-- save file without auto-formatting
-- save file
keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Open lazy
keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Vertical scroll and center
keymap.set("n", "<C-d>", "<C-d>zz", opts)
keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- toggle line wrapping
keymap.set("n", "<leader>W", "<cmd>set wrap!<CR>", opts)

-- Move text up and down
keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)

-- Keep last yanked when pasting
keymap.set("v", "p", '"_dP', opts)

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Noice
vim.api.nvim_set_keymap("n", "<leader>nn", ":Noice dismiss<CR>", { noremap = true })

-- clear highlights
keymap.set("n", "<Esc>", ":noh<CR>", opts)

-- save file
keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

-- quit file
keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- Enable/disable completion
keymap.set("n", "<leader>p", '<cmd>lua require("cmp").setup { enabled = true }<cr>', { desc = "Enable completion" })
keymap.set("n", "<leader>P", '<cmd>lua require("cmp").setup { enabled = false }<cr>', { desc = "Disable completion" })

-- surrounding words
keymap.set("n", "<leader>wsq", 'ciw""<Esc>P', { desc = "Word Surround Quotes" })

-- lsp
keymap.set("n", "<leader>S", "<cmd>LspStop<CR>", { desc = "LspStop" })

-- these keep the cursor in the middle when scrolling with ctrl d and u
-- from https://github.com/ThePrimeagen/init.lua
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- and these are for searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- new file
keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- quit
keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
keymap.set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
keymap.set("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })
