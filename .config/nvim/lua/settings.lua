-- Display line numbers
vim.wo.number = true
vim.wo.relativenumber = true -- Show line numbers relative to the cursor's position

-- Use spaces instead of tabs
vim.bo.expandtab = true

-- Set tab and indentation width
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

-- Enable line wrapping
vim.wo.wrap = false

-- Enable mouse in all modes
vim.o.mouse = 'a'

vim.o.clipboard = "unnamedplus"

-- Highlight search results as you type
vim.o.incsearch = true

-- Highlight all matches on previous search pattern
vim.o.hlsearch = true

-- Use smart case search: case insensitive unless there's an uppercase character
vim.o.ignorecase = true
vim.o.smartcase = true

-- Reduce the time before the vim-leader-guide window appears
vim.o.timeoutlen = 300

-- Always show the status line
vim.o.laststatus = 2

-- Show the current command in the bottom bar
vim.o.showcmd = true

-- Enable line and column highlight
-- vim.o.cursorline = true
vim.wo.colorcolumn = '80'

-- Create backups before overwriting a file
vim.o.backup = false
vim.o.writebackup = false

-- Specify backup directory
vim.o.backupdir = '/tmp/'

-- Reduce the swap file creation (1: file | 2: none | 0: swap file)
vim.o.swapfile = false

-- Determine how new vertical split windows are positioned
vim.o.splitright = true
-- Determine how new horizontal split windows are positioned
vim.o.splitbelow = true
-- Enable 24-bit RGB colors
vim.o.termguicolors = true

vim.cmd([[colorscheme moonfly]])
