local lush = require('lush')

local bg = "#3b224c"
local fg = "#a4a0e8"
local fg2 = "#9793d5"
local fg3 = "#8a86c3"
local fg4 = "#7d7ab0"
local bg2 = "#4b345a"
local bg3 = "#5a4569"
local bg4 = "#6a5777"
local keyword = "#eccdba"
local builtin = "#9ff28f"
local const =   "#ffffff"
local comment  =  "#697C81"
local func = "#ffffff"
local str = "#cccccc"
local type = "#ffffff"
local var = "#ffffff"
local warning = "#ffcd1c"
local warning2 = "#f47868"
local visualBG = "#540099"
local listChars = "#5a5977"


local theme = lush(function()
  return {
    Comment      { fg = comment, gui = 'italic' }, -- any comment
    ColorColumn  { bg = bg2 }, -- used for the columns set with 'colorcolumn'
    Cursor       { fg = bg, bg = fg }, -- character under the cursor
    CursorColumn { bg = bg2 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = bg2 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = const }, -- directory names (and other special names in listings)
    DiffAdd      { bg = '#123d0f', fg = '#fafafa', gui = 'bold' }, -- diff mode: Added line |diff.txt|
    DiffChange   { bg = '#151b3c', fg = '#fafafa' }, -- diff mode: Changed line |diff.txt|
    DiffDelete   { bg = bg2 }, -- diff mode: Deleted line |diff.txt|
    DiffText     { fg = '#ffffff', bg = '#ff0000', gui = 'bold' }, -- diff mode: Changed text within a changed line |diff.txt|
    ErrorMsg     { fg = warning, bg = bg2, gui = 'bold' }, -- error messages on the command line
    VertSplit    { fg = fg3, bg = bg3 }, -- the column separating vertically split windows
    Folded       { fg = fg4, bg = bg }, -- line used for closed folds
    SignColumn   { fg = fg, bg = bg }, -- column where |signs| are displayed
    IncSearch    { fg = bg, bg = keyword}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    LineNr       { fg = fg2, bg = bg2 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { bg = bg2 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { fg=warning2 }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    NonText      { fg = listChars }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { fg = fg, bg = bg }, -- normal text
    Pmenu        { fg = fg, bg = bg2 }, -- Popup menu: normal item.
    PmenuSel     { bg = bg3 }, -- Popup menu: selected item.
    Search       { IncSearch, gui = 'underline' }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    SpecialKey   { fg = fg2, bg = bg2 }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    StatusLine   { fg = fg2, bg = bg3 }, -- status line of current window
    Title        { fg = fg, gui = 'bold' }, -- titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = visualBG }, -- Visual mode selection
    WarningMsg   { fg = fg, bg = warning2 }, -- warning messages
    ExtraWhitespace   { fg = warning2 },
    WildMenu     { fg = str, bg = bg }, -- current match in 'wildmenu' completion

    Constant       { fg = const }, -- (preferred) any constant
    String         { fg = str }, --   a string constant: "this is a string"
    Character      { fg = const }, --  a character constant: 'c', '\n'
    Number         { fg = const }, --   a number constant: 234, 0xff
    Boolean        { fg = const }, --  a boolean constant: TRUE, false
    Float          { fg = const }, --    a floating point constant: 2.3e10

    Identifier     { fg = type, gui = 'italic'}, -- (preferred) any variable name
    Function       { fg = func }, -- function name (also: methods for classes)

    Statement      { fg = keyword }, -- (preferred) any statement
    Conditional    { fg = keyword }, --  if, then, else, endif, switch, etc.
    Label          { fg = var }, --    case, default, etc.
    Operator       { fg = keyword }, -- "sizeof", "+", "*", etc.
    Keyword        { fg = keyword, gui = 'bold' }, --  any other keyword

    PreProc        { fg = keyword }, -- (preferred) generic Preprocessor
    Define         { fg = keyword }, --   preprocessor #define

    Type           { fg = type }, -- (preferred) int, long, char, etc.
    StorageClass   { fg = type }, -- static, register, volatile, etc.

    Special        { fg = fg }, -- (preferred) any special symbol
    Tag            { fg = keyword }, --    you can use CTRL-] on this

    Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    Bold       { gui = "bold" },
    Italic     { gui = "italic" },

    Error          { bg = warning, fg = fg }, -- (preferred) any erroneous construct

    Todo           { fg = fg2, gui = 'inverse,bold' }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    goTSKeyword { Keyword, gui = 'italic' },
    goTSKeywordFunction { Keyword, gui = 'italic' },
    goTSKeywordReturn { Keyword, gui = 'italic' },
  }
end)

require('lush')(theme)

return theme

