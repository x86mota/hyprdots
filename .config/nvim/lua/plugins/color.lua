local hl = vim.api.nvim_set_hl

local function colors()
    return {
        fg          =   '#CCD7D4',
        bg          =   '#141A1B',
        bg_alt      =   '#1B2224',
        green       =   '#2EB398',
        lime        =   '#73C48F',
        gray        =   '#2A3538',
        blue        =   '#6A7CE0',
        red         =   '#CC575D',
        purple      =   '#D25DE6',
        lightgray   =   '#222B2E',
        orange      =   '#FF9262',
        comment     =   '#454F4C',
        string      =   '#E0AF68',
    }
end

local colors = colors()

return {
        hl( 0,  'Normal',           { fg = colors.fg,           bg = colors.bg          }),
        hl( 0,  'LineNr',           { fg = colors.gray,         bg = 'NONE'             }),
        hl( 0,  'NonText',          { fg = colors.gray,         bg = colors.bg          }),
        hl( 0,  'EndOfBuffer',      { fg = colors.bg,           bg = colors.bg          }),
        hl( 0,  'CursorLine',       { fg = 'NONE',              bg = colors.bg_alt      }),
        hl( 0,  'CursorColumn',     { fg = 'NONE',              bg = colors.bg_alt      }),
        hl( 0,  'SignColumn',       { fg = 'NONE',              bg = 'NONE'             }),
        hl( 0,  'CursorLineNr',     { fg = colors.green,        bg = 'NONE'             }),
        hl( 0,  'Folded',           { fg = colors.bg,           bg = colors.gray        }),
        hl( 0,  'CursorLineFold',   { fg = colors.green,        bg = colors.bg          }),
        hl( 0,  'FoldColumn',       { fg = colors.gray,         bg = colors.bg          }),
        hl( 0,  'WinSeparator',     { fg = colors.gray,         bg = colors.bg          }),
        hl( 0,  'ColorColumn',      { fg = colors.bg,           bg = colors.bg_alt      }),
        hl( 0,  'Conceal',          { fg = colors.gray,         bg = colors.bg          }),
        hl( 0,  'Visual',           { fg = 'NONE',              bg = colors.lightgray   }),
        hl( 0,  'DiffAdd',          { fg = colors.bg,           bg = colors.lime        }),
        hl( 0,  'DiffChange',       { fg = colors.bg,           bg = colors.blue        }),
        hl( 0,  'DiffDelete',       { fg = colors.bg,           bg = colors.red         }),
        hl( 0,  'DiffText',         { fg = colors.bg,           bg = colors.purple      }),
        hl( 0,  'Search',           { fg = 'NONE',              bg = colors.lightgray   }),
        hl( 0,  'CurSearch',        { fg = 'NONE',              bg = colors.lightgray   }),
        hl( 0,  'WarningMsg',       { fg = colors.orange,       bg = 'NONE'             }),
        hl( 0,  'ErrorMsg',         { fg = colors.red,          bg = 'NONE'             }),
        hl( 0,  'Question',         { fg = colors.green,        bg = 'NONE'             }),
        hl( 0,  'ModeMsg',          { fg = colors.bg,           bg = 'NONE'             }),
        hl( 0,  'MoreMsg',          { fg = colors.gray,         bg = 'NONE'             }),
        hl( 0,  'Pmenu',            { fg = colors.green,        bg = colors.bg_alt      }),
        hl( 0,  'PmenuSel',         { fg = colors.bg_alt,       bg = colors.green       }),
        hl( 0,  'PmenuThumb',       { fg = 'NONE',              bg = colors.bg          }),
        hl( 0,  'PmenuSbar',        { fg = 'NONE',              bg = colors.lightgray   }),
        hl( 0,  'Directory',        { fg = colors.green,        bg = 'NONE',            bold = true     }),
        hl( 0,  'Comment',          { fg = colors.comment,      bg = 'NONE',            italic = true   }),
        hl( 0,  'String',           { fg = colors.string,       bg = 'NONE'             }),
        hl( 0,  'Character',        { fg = colors.string,       bg = 'NONE'             }),
        hl( 0,  'Boolean',          { fg = colors.blue,         bg = 'NONE'             }),
        hl( 0,  'Number',           { fg = colors.purple,       bg = 'NONE'             }),
}
-- djsoaidjaoijdoaijdajiodjaoij
