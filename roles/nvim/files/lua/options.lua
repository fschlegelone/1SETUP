-- general
vim.opt.swapfile = false -- turn off swapfile
-- vim.g.loaded_netrw = 1 -- disable netrw file_explorer

-- tabs & indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.autoindent = true -- copy indent from current line when starting new one

-- editor settings
vim.opt.mouse = "" -- disable mouse
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
-- lines
vim.opt.cursorline = true -- highlight current line
vim.opt.relativenumber = true -- relative line numbers
vim.opt.number = true -- show line numbers
vim.opt.wrap = false -- don't wrap lines
-- appearance
vim.opt.termguicolors = true -- enable true color support
vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark
vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register
vim.highlight.on_yank = true -- highlight yanked text

-- splits
vim.opt.splitright = true -- split vertical window to the right
-- vim.opt.splitbelow = true -- split horizontal window to the bottom

-- disable some providers
vim.g.loaded_ruby_provider = 0 -- disable ruby provider
vim.g.loaded_perl_provider = 0 -- disable perl provider
