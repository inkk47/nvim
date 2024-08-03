vim.cmd("let g:netrw_liststyle = 3")
vim.g.have_nerd_font = true

local opt = vim.opt -- for conciseness

-- line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.relativenumber = true -- show relative line numbers

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.breakindent = true -- enable break indnt
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- line wrapping
opt.wrap = true -- disable line wrapping
opt.scrolloff = 8 -- set 10 lines of context

-- search settings
opt.incsearch = true -- search as characters are entered
opt.ignorecase = true -- ignore case when searching
opt.smartcase = false -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- enable mouse
opt.mouse = "a"

-- appereance
opt.showmode = false -- don't show the mode, since it's already in the status line
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- Save undo history
opt.undofile = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
opt.hlsearch = true

-- Obsidian needs
opt.conceallevel = 2

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- Nvim automatically configures lazygit:
-- * theme, based on the active colorscheme.
-- * editorPreset to nvim-remote
-- * enables nerd font icons
-- Set to false to disable.
vim.g.lazygit_config = true

-- set tab name as buffer
vim.g.airline_extensions_tabline_formatter = "unique_tail"

vim.o.completeopt = "menuone,noselect" -- Set completeopt to have a better completion experience
vim.opt.termguicolors = true -- set termguicolors to enable highlight groupspt.swapfile = false
