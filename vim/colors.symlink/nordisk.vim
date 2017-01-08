" ----------------------------------------------------------------- "
" name          nordisk (edited)                                    "
" description   A colour scheme closely modelled on                 "
"               Arctic Ice Studio’s Nord palette                    "
"               https://github.com/arcticicestudio/nord             "
" author        kamil.stachowski@gmail.com, edited by Robin Thrift  "
" version       0.5 (2016.11.22)                                    "
" license       GPLv3+                                              "
" ----------------------------------------------------------------- "

" - preamble ---------------------------------------------------------------------------------- <<< -

let colors_name = "nordisk"
set background=dark

if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
if version > 800
    set termguicolors
endif

function! s:hi(group, fg, bg)
    let l:res = "hi " . a:group
    if a:fg != ""
        let l:res = l:res . " ctermfg=" . a:fg
    endif
    if a:bg != ""
        let l:res = l:res . " ctermbg=" . a:bg
    endif
    execute l:res
endfunction

" --------------------------------------------------------------------------------------------- >>> -
" special
" foreground:   #d7dbe2
" background:   #252a33
" cursorColor:  #d7dbe2
"
" black
" color0:       #252a33
" color8:       #38404d
"
" red
" color1:       #bf6971
" color9:       #d18a75
"
" green
" color2:       #a3be8c
" color10:      #88c0d0
"
" yellow
" color3:       #eccf95
" color11:      #8fbcbb
"
" blue
" color4:       #5e81ac
" color12:      #b48ead
"
" magenta
" color5:       #6f7e98
" color13:      #d7dbe2
"
" cyan
" color6:       #81a1c1
" color14:      #ffffff
"
" white
" color7:       #4a5466
" color15:      #5e6b81
" - palette ----------------------------------------------------------------------------------- <<< -

" call s:hi ("CursorLine",    "",         01)

" SYNTAX
call s:hi ("Normal",        04,    00)
call s:hi ("Special",       06,    00)
call s:hi ("Operator",      06,    00)
call s:hi ("Identifier",    10,    00)
call s:hi ("PreProc",       09,    00)
call s:hi ("Constant",      04,    00)
call s:hi ("Statement",     03,    00)
call s:hi ("Type",          12,    00)
call s:hi ("Comment",       04,    00)
call s:hi ("DiffAdd",       02,    00)
call s:hi ("DiffChange",    04,    00)
call s:hi ("DiffDelete",    02,    00)


" UI
call s:hi ("Error",         01,    00)
call s:hi ("ModeMsg",       01,    00)
call s:hi ("Pmenu",         13,    15)


" SPECIAL
call s:hi ("Todo",          13,    15)
call s:hi ("Search",        13,    15)
call s:hi ("Visual",        07,    01)
call s:hi ("Ignore",        15,    00)
call s:hi ("LineNr",        07,    00)
call s:hi ("SignColumn",    05,    00)
call s:hi ("NonText",       15,    00)
call s:hi ("SpecialKey",    14,    00)
call s:hi ("VertSplit",     05,    00)
call s:hi ("Underlined",    05,    00)

" GitGutter
call s:hi ("GitGutterAdd",  02,    00)
call s:hi ("GitGutterChange", 04,  00)
call s:hi ("GitGutterDelete", 01,  00)
call s:hi ("GitGutterChangeDelete", 02, 00)

" STATUS LINE
call s:hi ("WarningMsg",    01,    00)
call s:hi ("StatusLine",    08,    06)
call s:hi ("StatusLineNC",  08,    00)



" LINKS
hi! link Boolean        Constant
hi! link Character      Constant
hi! link ColorColumn    CursorColumn
hi! link Conceal        Special
hi! link Conditional    Statement
hi! link CursorColumn   CursorLine
hi! link CursorIM       Cursor
hi! link CursorLineNr   CursorLine
hi! link Debug          Special
hi! link Define         PreProc
hi! link Delimiter      Special
hi! link DiffText       Special
hi! link Directory      Type
hi! link EndOfBuffer    Ignore
hi! link ErrorMsg       Error
hi! link Exception      Statement
hi! link Float          Constant
hi! link FoldColumn     Normal
hi! link Folded         Comment
hi! link Function       Identifier
hi! link IncSearch      Search
hi! link Include        PreProc
hi! link Keyword        Statement
hi! link Label          Statement
hi! link LineNr         Ignore
hi! link Macro          PreProc
hi! link MatchParen     Search
hi! link MoreMsg        ModeMsg
hi! link NonText        Ignore
hi! link Number         Constant
hi! link PmenuSbar      StatusLineNC
hi! link PmenuSel       Visual
hi! link PmenuThumb     StatusLine
hi! link PreCondit      PreProc
hi! link Question       ModeMsg
hi! link Repeat         Statement
hi! link SignColumn     FoldColumn
hi! link SpecialChar    Special
hi! link SpecialComment Special
hi! link SpecialKey     Special
hi! link SpellBad       Error
hi! link SpellCap       Error
hi! link SpellLocal     Constant
hi! link SpellRare      Special
hi! link StorageClass   Type
hi! link String         Constant
hi! link Structure      Type
hi! link TabLine        StatusLineNC
hi! link TabLineFill    StatusLineNC
hi! link TabLineSel     StatusLine
hi! link Tag            Special
hi! link Title          Statement
hi! link Typedef        Type
hi! link VertSplit      StatusLineNC
hi! link VisualNOS      Visual
hi! link WildMenu       StatusLineNC

" ----------------------
"  LANGUAGES
" ----------------------

" c++
hi! link cppAccess      Type
hi! link cppStatement   Special

" html
hi! link htmlArg        Statement
hi! link htmlTag        Operator
hi! link htmlTagName    Type
hi! link htmlTitle      Type

" java
hi! link javaTypeDef    Special
call s:hi("javaScopeDecl", 07, 00)
call s:hi("javaType", 12, 00)
call s:hi("javaTypeDef", 12, 00)
call s:hi("javaFuncDef", 06, 00)

" markdown
hi! link markdownH1     Type

" nerdtree
hi! link NERDTreeCWD    WarningMsg
hi! link NERDTreeExecFile   PreProc
hi! link NERDTreeLinkDir    Type
hi! link NERDTreeLinkFile   Special
hi! link NERDTreeLinkTarget Normal

" netrw
hi! link netrwSymLink   Special

" pascal
hi! link pascalStatement    Type

" python
hi! link pythonStatement    Type

" ruby
hi! link rubyConstant   Special
hi! link rubyDefine     Type

" sh
hi! link shDerefVar     Special
hi! link shFunction     Type
hi! link shLoop         Statement
hi! link shStatement    Special

" vim
hi! link vimCommand     Statement
hi! link vimEnvVar      Special
hi! link vimFuncKey     Type
hi! link vimOption      Special
hi! link vimSyntax      Special
hi! link vimSynType     Special

" javascript
call s:hi ("jsObjectKey", 06, 00)
call s:hi ("jsFunction", 05, 00)
call s:hi ("jsStorageClass", 02, 00)
call s:hi ("jsString", 11, 00)
call s:hi ("jsFuncCall", 05, 00)
call s:hi ("jsFlowArgumentDef", 12, 00)
call s:hi ("jsFlowGroup", 12, 00)
call s:hi ("jsFlowType", 12, 00)
call s:hi ("jsFlowTypeCustom", 12, 00)
call s:hi ("jsVariableDef", 10, 00)

" xml (but really only for jsx)
call s:hi ("xmlTagName", 06, 00)
call s:hi ("xmlAttrib", 06, 00)
