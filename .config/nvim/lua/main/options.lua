vim.cmd('let g:netrw_liststyle = 3')

local opt = vim.opt

-- {{{ Global
opt.errorbells = false
opt.title = false
opt.encoding = 'utf-8'
opt.updatetime = 300
opt.mouse = ""
opt.laststatus = 2
opt.showtabline = 2
-- }}}

-- {{{ Editor
opt.number = true
opt.cursorline = true
opt.wrap = false
opt.foldmethod = 'marker'
opt.foldmarker = {'{{{', '}}}'}
opt.scrolloff = 10
opt.backspace = 'indent,eol,start'
opt.syntax = 'on'
opt.filetype = 'indent', 'plugin', 'on'
opt.list = true
opt.listchars = { 
    eol = '↲',
    tab = '→ ',
    trail = '•',
    space = '·',
}
-- }}}

-- {{{ Indent
opt.autoindent = true
opt.smartindent = true
-- }}}

-- {{{ Tabulation
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
-- }}}

-- {{{ Search
opt.path = '.,**'
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
vim.fn.setreg('/', '')
opt.wildmenu = true
opt.wildmode = 'longest,full'
opt.wildoptions = 'pum'
-- }}}

-- {{{ Buffer
opt.hidden = true
opt.confirm = true
opt.splitright = true
opt.splitbelow = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.undodir = '/tmp'
-- }}}
