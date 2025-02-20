return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status")

        local mode = {
            'mode',
            fmt = function(str)
                return ' ' .. str
            end
        }

        local diagnostics = {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            sections = { 'error', 'warn' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            colored = false,
            update_in_insert = false,
            always_visible = false,
        }

        local diff = {
            'diff',
            colored = false,
            symbols = { added = ' ', modified = ' ', removed = ' ' },
        }

        local colors = {
            bg = '#141A1B',
            bg_alt = '#1B2224',
            fg = '#CCD7D4',
            green = '#2EB398',
            blue = '#6A7CE0',
            purple = '#D25DE6',
            orange = '#FF9262',
            red = '#CC575D',
            gray = '#2A3538',
        }

        local my_theme = {
            normal = {
                a = { bg = colors.green, fg = colors.bg, gui = "bold" },
                b = { bg = colors.gray, fg = colors.fg },
                c = { bg = colors.bg_alt, fg = colors.fg },
            },
            insert = {
                a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
                b = { bg = colors.gray, fg = colors.fg },
                c = { bg = colors.bg_alt, fg = colors.fg },
            },
            visual = {
                a = { bg = colors.purple, fg = colors.bg, gui = "bold" },
                b = { bg = colors.gray, fg = colors.fg },
                c = { bg = colors.bg_alt, fg = colors.fg },
            },
            command = {
                a = { bg = colors.orange, fg = colors.bg, gui = "bold" },
                b = { bg = colors.gray, fg = colors.fg },
                c = { bg = colors.bg_alt, fg = colors.fg },
            },
            replace = {
                a = { bg = colors.red, fg = colors.bg, gui = "bold" },
                b = { bg = colors.gray, fg = colors.fg },
                c = { bg = colors.bg_alt, fg = colors.fg },
            },
            inactive = {
                a = { bg = colors.bg_alt, fg = colors.gray, gui = "bold" },
                b = { bg = colors.bg_alt, fg = colors.gray },
                c = { bg = colors.bg_alt, fg = colors.gray },
            },
        }

        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = my_theme,
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                disabled_filetypes = { 'alpha', 'NvimTree' },
                always_divide_middle = true,
            },
            sections = {
                lualine_a = { mode },
                lualine_b = { 'filetype' },
                lualine_c = { 'branch', diff },
                lualine_x = { diagnostics },
                lualine_y = { 'encoding', 'fileformat' },
                lualine_z = { 'location', 'progress' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { 'fugitive' },
        }
    end
}
