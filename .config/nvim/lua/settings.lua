local g = vim.g
local o = vim.o
local opt = vim.opt

-- Display line numbers
o.number = true
o.relativenumber = true -- Show line numbers relative to the cursor's position

g.python_recommended_style = 0
g.rust_recommended_style = 0
opt.tabstop = 4
opt.smartindent = true
opt.shiftwidth = 4
opt.expandtab = true

-- Enable line wrapping
o.wrap = false

-- Enable mouse in all modes
o.mouse = 'a'

o.clipboard = "unnamedplus"

-- Highlight search results as you type
o.incsearch = true

-- Highlight all matches on previous search pattern
o.hlsearch = true

-- Use smart case search: case insensitive unless there's an uppercase character
o.ignorecase = true
o.smartcase = true

-- Reduce the time before the vim-leader-guide window appears
o.timeoutlen = 300

-- Always show the status line
o.laststatus = 2

-- Show the current command in the bottom bar
o.showcmd = true

-- Enable line and column highlight
-- vim.o.cursorline = true
o.colorcolumn = '80'

-- Create backups before overwriting a file
o.backup = false
o.writebackup = false

-- Specify backup directory
o.backupdir = '/tmp/'

-- Reduce the swap file creation (1: file | 2: none | 0: swap file)
o.swapfile = false

-- Determine how new vertical split windows are positioned
o.splitright = true
-- Determine how new horizontal split windows are positioned
o.splitbelow = true
-- Enable 24-bit RGB colors
o.termguicolors = true

o.conceallevel = 2
o.autochdir = false


vim.cmd([[colorscheme everforest]])
