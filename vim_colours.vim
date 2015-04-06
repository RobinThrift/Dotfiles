
hi clear
syntax reset
let g:colors_name = "my-default"
if &background == "light"
    hi Boolean gui=NONE guifg=#787878 guibg=NONE
    hi ColorColumn gui=NONE guifg=NONE guibg=#f7f7f7
    hi Comment gui=NONE guifg=#a1a1a1 guibg=NONE
    hi Conceal gui=NONE guifg=#787878 guibg=NONE
    hi Conditional gui=NONE guifg=#4f4f4f guibg=NONE
    hi Constant gui=NONE guifg=#787878 guibg=NONE
    hi Cursor gui=reverse guifg=NONE guibg=NONE
    hi CursorColumn gui=NONE guifg=NONE guibg=#f7f7f7
    hi CursorLine gui=NONE guifg=NONE guibg=#f7f7f7
    hi CursorLineNr gui=NONE guifg=#a1a1a1 guibg=NONE
    hi DiffAdd gui=NONE guifg=NONE guibg=#f0fff0
    hi DiffChange gui=NONE guifg=NONE guibg=#f7f7f7
    hi DiffDelete gui=NONE guifg=NONE guibg=#fff0f0
    hi DiffText gui=NONE guifg=NONE guibg=#e8e8e8
    hi Directory gui=NONE guifg=#4f4f4f guibg=NONE
    hi Error gui=NONE guifg=NONE guibg=#fff0f0
    hi ErrorMsg gui=NONE guifg=NONE guibg=#fff0f0
    hi FoldColumn gui=NONE guifg=#c7c7c7 guibg=NONE
    hi Folded gui=NONE guifg=#a1a1a1 guibg=NONE
    hi Ignore gui=NONE guifg=NONE guibg=NONE
    hi IncSearch gui=NONE guifg=NONE guibg=#e8e8e8
    hi LineNr gui=NONE guifg=#c7c7c7 guibg=NONE
    hi MatchParen gui=NONE guifg=NONE guibg=#e8e8e8
    hi ModeMsg gui=NONE guifg=NONE guibg=NONE
    hi MoreMsg gui=NONE guifg=NONE guibg=NONE
    hi NonText gui=NONE guifg=#c7c7c7 guibg=NONE
    hi Normal gui=NONE guifg=#000000 guibg=#ffffff
    hi Number gui=NONE guifg=#787878 guibg=NONE
    hi Pmenu gui=NONE guifg=NONE guibg=#f7f7f7
    hi PmenuSbar gui=NONE guifg=NONE guibg=#f0f0f0
    hi PmenuSel gui=NONE guifg=NONE guibg=#e8e8e8
    hi PmenuThumb gui=NONE guifg=NONE guibg=#e0e0e0
    hi Question gui=NONE guifg=NONE guibg=NONE
    hi Search gui=NONE guifg=NONE guibg=#f0f0f0
    hi SignColumn gui=NONE guifg=#c7c7c7 guibg=NONE
    hi Special gui=NONE guifg=#787878 guibg=NONE
    hi SpecialKey gui=NONE guifg=#c7c7c7 guibg=NONE
    hi SpellBad gui=undercurl guisp=NONE guifg=NONE guibg=#fff0f0
    hi SpellCap gui=undercurl guisp=NONE guifg=NONE guibg=NONE
    hi SpellLocal gui=undercurl guisp=NONE guifg=NONE guibg=#f0fff0
    hi SpellRare gui=undercurl guisp=NONE guifg=NONE guibg=#f0f0f0
    hi Statement gui=NONE guifg=#4f4f4f guibg=NONE
    hi StatusLine gui=NONE guifg=#292929 guibg=#f0f0f0
    hi StatusLineNC gui=NONE guifg=#a1a1a1 guibg=#f0f0f0
    hi StorageClass gui=bold guifg=#4f4f4f guibg=NONE ctermfg=03 ctermbg=NONE
    hi String gui=NONE guifg=#787878 guibg=NONE
    hi TabLine gui=NONE guifg=#a1a1a1 guibg=#f0f0f0
    hi TabLineFill gui=NONE guifg=NONE guibg=#f0f0f0
    hi TabLineSel gui=NONE guifg=#292929 guibg=#f0f0f0
    hi Title gui=NONE guifg=#787878 guibg=NONE
    hi Todo gui=standout guifg=NONE guibg=NONE
    hi Type gui=NONE guifg=#4f4f4f guibg=NONE
    hi Underlined gui=NONE guifg=NONE guibg=NONE
    hi VertSplit gui=NONE guifg=#e8e8e8 guibg=NONE
    hi Visual gui=NONE guifg=NONE guibg=#e8e8e8
    hi VisualNOS gui=NONE guifg=NONE guibg=NONE
    hi WarningMsg gui=NONE guifg=NONE guibg=#fff0f0
    hi WildMenu gui=NONE guifg=NONE guibg=#d9d9d9
    hi lCursor gui=NONE guifg=NONE guibg=NONE
    hi Identifier gui=NONE guifg=NONE guibg=NONE
    hi PreProc gui=NONE guifg=NONE guibg=NONE
elseif &background == "dark"
    hi Boolean guifg=#260808 guibg=NONE ctermfg=1 ctermbg=NONE
    hi ColorColumn gui=NONE guifg=NONE guibg=#171717
    hi Comment gui=NONE guifg=#545454 guibg=NONE ctermfg=08 ctermbg=NONE
    hi Conceal gui=NONE guifg=#878787 guibg=NONE
    hi Conditional gui=NONE guifg=#aa27aa guibg=NONE ctermfg=05 ctermbg=NONE
    hi Constant gui=NONE guifg=#878787 guibg=NONE
    hi Cursor gui=reverse guifg=NONE guibg=NONE ctermfg=08 ctermbg=07
    hi CursorColumn gui=NONE guifg=NONE guibg=#171717
    hi CursorLine gui=NONE guifg=NONE guibg=#171717
    hi CursorLineNr gui=NONE guifg=#787878 guibg=NONE
    hi DiffAdd gui=NONE guifg=NONE guibg=#082608
    hi DiffChange gui=NONE guifg=NONE guibg=#171717
    hi DiffDelete gui=NONE guifg=NONE guibg=#260808
    hi DiffText gui=NONE guifg=NONE guibg=#383838
    hi Directory gui=NONE guifg=#388cd6 guibg=NONE ctermfg=04 ctermbg=NONE
    hi Error gui=NONE guifg=NONE guibg=#260808 ctermbg=01 ctermfg=15
    hi ErrorMsg gui=NONE guifg=#ffffff guibg=#d64b38 ctermbg=01 ctermfg=15
    hi FoldColumn gui=NONE guifg=#696969 guibg=NONE
    hi Folded gui=NONE guifg=#787878 guibg=NONE
    hi Ignore gui=NONE guifg=NONE guibg=NONE
    hi IncSearch gui=NONE guifg=NONE guibg=#383838 ctermbg=11 ctermfg=08
    hi LineNr gui=NONE guifg=#545454 guibg=#2e2e2e ctermfg=08 ctermbg=NONE
    hi MatchParen gui=NONE guifg=NONE guibg=#383838
    hi ModeMsg gui=NONE guifg=#d69a38 guibg=NONE ctermfg=03 ctermbg=NONE
    hi MoreMsg gui=NONE guifg=#ffffff guibg=NONE ctermfg=07 ctermbg=NONE
    hi NonText gui=NONE guifg=#696969 guibg=NONE ctermfg=08
    hi Normal gui=NONE guifg=#dedede guibg=#2e2e2e ctermfg=7 ctermbg=NONE
    hi Number gui=NONE guifg=#388cd6 guibg=NONE ctermfg=04 ctermbg=NONE
    hi Pmenu gui=NONE guifg=#ffffff guibg=#545454 ctermfg=15 ctermbg=08
    hi PmenuSbar gui=NONE guifg=NONE guibg=#dedede ctermbg=07
    hi PmenuSel gui=NONE guifg=#d69a38 guibg=#000000 ctermfg=03 ctermbg=00
    hi PmenuThumb gui=NONE guifg=NONE guibg=#000000 ctermbg=00
    hi Question gui=NONE guifg=NONE guibg=NONE
    hi Search gui=NONE guifg=NONE guibg=#292929 ctermbg=11 ctermfg=08
    hi SignColumn gui=NONE guifg=#696969 guibg=NONE
    hi Special gui=NONE guifg=#d64b38 guibg=NONE ctermfg=01 ctermbg=NONE
    hi SpecialKey gui=NONE guifg=#696969 guibg=NONE
    hi SpellBad gui=undercurl guisp=NONE guifg=NONE guibg=#260808
    hi SpellCap gui=undercurl guisp=NONE guifg=NONE guibg=NONE
    hi SpellLocal gui=undercurl guisp=NONE guifg=NONE guibg=#082608
    hi SpellRare gui=undercurl guisp=NONE guifg=NONE guibg=#292929
    hi Statement gui=NONE guifg=#38c4d6 guibg=NONE ctermfg=01 ctermbg=NONE
    hi StatusLine gui=NONE guifg=#dedede guibg=#545454 ctermfg=07 ctermbg=08
    hi StatusLineNC gui=NONE guifg=#dedede guibg=#545454 ctermfg=07 ctermbg=08
    hi StorageClass gui=bold guifg=#d69a38 guibg=NONE ctermfg=03 ctermbg=NONE
    hi String gui=NONE guifg=#e5e600 guibg=NONE ctermfg=02 ctermbg=NONE
    hi TabLine gui=NONE guifg=#545454 guibg=#292929 ctermfg=08 ctermbg=NONE
    hi TabLineFill gui=NONE guifg=#dedede guibg=#292929 ctermfg=08 ctermbg=NONE
    hi TabLineSel gui=NONE guifg=#dedede guibg=#292929 ctermfg=15 ctermbg=NONE
    hi Title gui=NONE guifg=#388cd6 guibg=#2e2e2e ctermfg=07 ctermbg=NONE
    hi Todo gui=standout guifg=NONE guibg=NONE
    hi Type gui=NONE guifg=#d69a38 guibg=NONE ctermfg=03 ctermbg=NONE
    hi Underlined gui=NONE guifg=NONE guibg=NONE
    hi VertSplit gui=NONE guifg=#383838 guibg=NONE ctermfg=08 ctermbg=NONE
    hi Visual gui=NONE guifg=NONE guibg=#383838 ctermbg=01 ctermfg=15
    hi VisualNOS gui=NONE guifg=NONE guibg=NONE
    hi WarningMsg gui=NONE guifg=#545454 guibg=#e5e600 ctermfg=08 ctermbg=11
    hi WildMenu gui=bold guifg=#ff5757 guibg=#545454 ctermfg=01 ctermbg=NONE
    hi lCursor gui=NONE guifg=NONE guibg=NONE
    hi Identifier gui=NONE guifg=NONE guibg=NONE
    hi PreProc gui=NONE guifg=NONE guibg=NONE

    " Git
    hi gitCommitOverflow ctermfg=01 ctermbg=NONE
    hi gitCommitSummary ctermfg=03 ctermbg=NONE

    " GitGutter Highlighting
    hi GitGutterAdd ctermbg=08 ctermfg=02
    hi GitGutterChange ctermbg=08 ctermfg=11
    hi GitGutterDelete ctermbg=08 ctermfg=01
    hi GitGutterChangeDelete ctermbg=08 ctermfg=05

    " JavaScript Specific
    hi jsStorageClass ctermfg=03 ctermbg=NONE
    hi jsOperator ctermfg=03 ctermbg=NONE
    hi jsModules ctermfg=04 ctermbg=NONE
    hi jsModuleWords ctermfg=04 ctermbg=NONE
    hi jsFuncName ctermfg=04 ctermbg=NONE gui=NONE
    hi jsArrowFunction ctermfg=04 ctermbg=NONE
    hi jsFuncCall ctermfg=15 ctermbg=NONE
    hi jsRegexpString ctermfg=01 ctermbg=NONE
    hi jsRegexpGroup ctermfg=09 ctermbg=NONE
    hi jsParen ctermfg=10 ctermbg=NONE

    " Markdown Specific
    hi markdownCode ctermfg=04 ctermbg=NONE
    hi markdownError ctermfg=09 ctermbg=NONE
    hi markdownCodeBlock ctermfg=03 ctermbg=NONE
    hi markdownHeadingDelimiter ctermfg=04 ctermbg=NONE

    " CSS/SASS Specific
    hi cssBraces ctermfg=04 ctermbg=NONE
    hi cssTagName ctermfg=12 ctermbg=NONE
    hi sassidChar ctermfg=12 ctermbg=NONE
    hi sassId ctermfg=10 ctermbg=NONE cterm=NONE
    hi sassClassChar ctermfg=03 ctermbg=NONE
    hi sassInclude ctermfg=05 ctermbg=NONE
    hi sassMixing ctermfg=02 ctermbg=NONE
    hi sassExtend ctermfg=02 ctermbg=NONE
    hi sassMixinName ctermfg=10 ctermbg=NONE
    hi sassVariable ctermfg=01 ctermbg=NONE cterm=NONE

    " VimL Specific
    hi vimVar cterm=NONE ctermfg=07 ctermbg=NONE
    hi vimFuncName cterm=NONE ctermfg=04 ctermbg=NONE
    hi vimOption ctermfg=13 ctermbg=NONE

    " HTML Specific
    hi htmlTag ctermfg=04 ctermbg=NONE
    hi htmlEndTag ctermfg=04 ctermbg=NONE
    hi htmlTagName ctermfg=09 ctermbg=NONE
endif
