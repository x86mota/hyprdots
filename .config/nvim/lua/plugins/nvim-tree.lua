return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },

    config = function()
        local nvimtree = require('nvim-tree')

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            view = {
                width = 30,
                relativenumber = false
            },
            renderer = {
                indent_markers = {
                    enable = true,
                    icons = {
                        corner = '｜',
                        edge = '｜',
                        item = '｜',
                        bottom = '｜',
                        none = ' '
                    }
                },
            },
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    }
                }
            },
            git = {
                ignore = false
            }
        })

    end
}
