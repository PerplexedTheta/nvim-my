-- set native vim opts
local opt = vim.opt

-- Tabulation
opt.tabstop = 8
opt.softtabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.shiftround = true
opt.backspace = "indent,eol,start"
opt.autoindent = true
opt.copyindent = true
opt.showmatch = true
opt.smarttab = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
--opt.hlsearch = false

-- Appearance
opt.number = true
opt.termguicolors = true
opt.colorcolumn = "80,120"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"
opt.showmode = false

-- Behaviour
opt.hidden = true
opt.errorbells = true
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.local/var/nvim/undo_dir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse = "r"
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
opt.encoding = "utf-8"

-- ftplugin
vim.api.nvim_command('filetype on')
vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_command('syntax on')
