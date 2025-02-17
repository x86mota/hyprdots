vim.g.mapleader = ' '

local keymap = vim.keymap

keymap.set('n', '<leader>sh', ':nohlsearch<CR>', { desc = 'Clear search highlights' })
