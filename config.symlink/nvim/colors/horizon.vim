" horizon.vim -- Vim color scheme.
" Author:       ()
" Webpage:     
" Description: Ported from https://horizontheme.com/

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "horizon"

if ($TERM =~ '256color' || $TERM =~ '256' || &t_Co >= 256) || has("gui_running")
    hi Normal ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE

    set background=dark

    hi NonText ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#3e4047 gui=NONE
    hi Comment ctermbg=NONE ctermfg=7 cterm=italic guibg=NONE guifg=#3e4047 gui=italic
    hi Constant ctermbg=NONE ctermfg=12 cterm=NONE guibg=NONE guifg=#3fc6de gui=NONE
    hi Error ctermbg=NONE ctermfg=9 cterm=NONE guibg=NONE guifg=#ec6a88 gui=NONE guisp=underline
    hi Identifier ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#e95678 gui=NONE
    hi Ignore ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#3e4047 gui=NONE
    hi PreProc ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#3e4047 gui=NONE
    hi Special ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#b877db gui=NONE
    hi Keyword ctermbg=NONE ctermfg=5 cterm=italic guibg=NONE guifg=#b877db gui=italic
    hi Statement ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#b877db gui=NONE
    hi String ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#fab795 gui=NONE
    hi Todo ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi Type ctermbg=NONE ctermfg=3 cterm=NONE guibg=NONE guifg=#fab795 gui=NONE
    hi Underlined ctermbg=NONE ctermfg=NONE cterm=underline guibg=NONE guifg=NONE gui=underline
    hi StatusLine ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#e95678 gui=NONE
    hi StatusLineNC ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi VertSplit ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi TabLine ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi TabLineFill ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi TabLineSel ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi Title ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi CursorLine ctermbg=8 ctermfg=NONE cterm=NONE guibg=#22232e guifg=NONE gui=NONE
    hi LineNr ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#3e4047 gui=NONE
    hi helpLeadBlank ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi helpNormal ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi Visual ctermbg=13 ctermfg=0 cterm=NONE guibg=#f65b82 guifg=#1d212a gui=NONE
    hi VisualNOS ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi Pmenu ctermbg=0 ctermfg=15 cterm=NONE guibg=#1d212a guifg=#ebebeb gui=NONE
    hi PmenuSbar ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi PmenuSel ctermbg=0 ctermfg=13 cterm=NONE guibg=#1d212a guifg=#f65b82 gui=NONE
    hi PmenuThumb ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi FoldColumn ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi Folded ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi WildMenu ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi SpecialKey ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi DiffAdd ctermbg=NONE ctermfg=10 cterm=NONE guibg=NONE guifg=#3fdaa4 gui=NONE
    hi DiffChange ctermbg=NONE ctermfg=12 cterm=NONE guibg=NONE guifg=#3fc6de gui=NONE
    hi DiffDelete ctermbg=NONE ctermfg=9 cterm=NONE guibg=NONE guifg=#ec6a88 gui=NONE
    hi DiffText ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi IncSearch ctermbg=9 ctermfg=0 cterm=NONE guibg=#ec6a88 guifg=#1d212a gui=NONE
    hi Search ctermbg=11 ctermfg=0 cterm=NONE guibg=#fbc3a7 guifg=#1d212a gui=NONE
    hi Directory ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi MatchParen ctermbg=NONE ctermfg=9 cterm=NONE guibg=NONE guifg=#ec6a88 gui=NONE
    hi SpellBad ctermbg=NONE ctermfg=9 cterm=NONE guibg=NONE guifg=#ec6a88 gui=NONE guisp=#ec6a88
    hi SpellCap ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE guisp=#3fc6de
    hi SpellLocal ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE guisp=#f65b82
    hi SpellRare ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE guisp=#6be6e6
    hi ColorColumn ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi SignColumn ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi ErrorMsg ctermbg=NONE ctermfg=9 cterm=NONE guibg=NONE guifg=#ec6a88 gui=NONE
    hi ModeMsg ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi MoreMsg ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi Question ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi Cursor ctermbg=9 ctermfg=13 cterm=NONE guibg=#ec6a88 guifg=#f65b82 gui=NONE
    hi iCursor ctermbg=9 ctermfg=13 cterm=NONE guibg=#ec6a88 guifg=#f65b82 gui=NONE
    hi nCursor ctermbg=9 ctermfg=13 cterm=NONE guibg=#ec6a88 guifg=#f65b82 gui=NONE
    hi QuickFixLine ctermbg=NONE ctermfg=9 cterm=underline guibg=NONE guifg=#ec6a88 gui=underline
    hi Conceal ctermbg=NONE ctermfg=7 cterm=NONE guibg=NONE guifg=#3e4047 gui=NONE
    hi ToolbarLine ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi ToolbarButton ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi debugPC ctermbg=NONE ctermfg=4 cterm=NONE guibg=NONE guifg=#252834 gui=NONE
    hi debugBreakpoint ctermbg=NONE ctermfg=12 cterm=NONE guibg=NONE guifg=#3fc6de gui=NONE
    hi typescriptImport ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#b877db gui=NONE
    hi typescriptIdentifierName ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#e95678 gui=NONE
    hi typescriptArrowFuncArg ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#e95678 gui=NONE
    hi typescriptCall ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#e95678 gui=NONE
    hi typescriptMember ctermbg=NONE ctermfg=6 cterm=NONE guibg=NONE guifg=#25b2bc gui=NONE
    hi typescriptTypeReference ctermbg=NONE ctermfg=11 cterm=NONE guibg=NONE guifg=#fbc3a7 gui=NONE
    hi typescriptBraces ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ebebeb gui=NONE
    hi typescriptParenExp ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi typescriptBlock ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi typescriptMathStaticMethod ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#b877db gui=NONE
    hi typescriptDateStaticMethod ctermbg=NONE ctermfg=5 cterm=NONE guibg=NONE guifg=#b877db gui=NONE
    hi typescriptTemplateSubstitution ctermbg=NONE ctermfg=NONE cterm=italic guibg=NONE guifg=NONE gui=italic
    hi typescriptTemplateSB ctermbg=NONE ctermfg=5 cterm=italic guibg=NONE guifg=#b877db gui=italic
    hi typescriptCastKeyword ctermbg=NONE ctermfg=5 cterm=italic guibg=NONE guifg=#b877db gui=italic
    hi goBlock ctermbg=NONE ctermfg=1 cterm=NONE guibg=NONE guifg=#e95678 gui=NONE
    hi goVarDefs ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi goVarAssign ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi goOperator ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi goFunctionCall ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE

elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
    set t_Co=16

    hi Normal ctermbg=NONE ctermfg=white cterm=NONE

    set background=dark

    hi NonText ctermbg=NONE ctermfg=gray cterm=NONE
    hi Comment ctermbg=NONE ctermfg=gray cterm=italic
    hi Constant ctermbg=NONE ctermfg=blue cterm=NONE
    hi Error ctermbg=NONE ctermfg=red cterm=NONE
    hi Identifier ctermbg=NONE ctermfg=darkred cterm=NONE
    hi Ignore ctermbg=NONE ctermfg=gray cterm=NONE
    hi PreProc ctermbg=NONE ctermfg=gray cterm=NONE
    hi Special ctermbg=NONE ctermfg=darkmagenta cterm=NONE
    hi Keyword ctermbg=NONE ctermfg=darkmagenta cterm=italic
    hi Statement ctermbg=NONE ctermfg=darkmagenta cterm=NONE
    hi String ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi Todo ctermbg=NONE ctermfg=white cterm=NONE
    hi Type ctermbg=NONE ctermfg=darkyellow cterm=NONE
    hi Underlined ctermbg=NONE ctermfg=NONE cterm=underline
    hi StatusLine ctermbg=NONE ctermfg=darkred cterm=NONE
    hi StatusLineNC ctermbg=NONE ctermfg=white cterm=NONE
    hi VertSplit ctermbg=NONE ctermfg=white cterm=NONE
    hi TabLine ctermbg=NONE ctermfg=white cterm=NONE
    hi TabLineFill ctermbg=NONE ctermfg=white cterm=NONE
    hi TabLineSel ctermbg=NONE ctermfg=white cterm=NONE
    hi Title ctermbg=NONE ctermfg=white cterm=NONE
    hi CursorLine ctermbg=darkgray ctermfg=NONE cterm=NONE
    hi LineNr ctermbg=NONE ctermfg=gray cterm=NONE
    hi helpLeadBlank ctermbg=NONE ctermfg=white cterm=NONE
    hi helpNormal ctermbg=NONE ctermfg=white cterm=NONE
    hi Visual ctermbg=magenta ctermfg=black cterm=NONE
    hi VisualNOS ctermbg=NONE ctermfg=white cterm=NONE
    hi Pmenu ctermbg=black ctermfg=white cterm=NONE
    hi PmenuSbar ctermbg=NONE ctermfg=white cterm=NONE
    hi PmenuSel ctermbg=black ctermfg=magenta cterm=NONE
    hi PmenuThumb ctermbg=NONE ctermfg=white cterm=NONE
    hi FoldColumn ctermbg=NONE ctermfg=white cterm=NONE
    hi Folded ctermbg=NONE ctermfg=white cterm=NONE
    hi WildMenu ctermbg=NONE ctermfg=white cterm=NONE
    hi SpecialKey ctermbg=NONE ctermfg=white cterm=NONE
    hi DiffAdd ctermbg=NONE ctermfg=green cterm=NONE
    hi DiffChange ctermbg=NONE ctermfg=blue cterm=NONE
    hi DiffDelete ctermbg=NONE ctermfg=red cterm=NONE
    hi DiffText ctermbg=NONE ctermfg=white cterm=NONE
    hi IncSearch ctermbg=red ctermfg=black cterm=NONE
    hi Search ctermbg=yellow ctermfg=black cterm=NONE
    hi Directory ctermbg=NONE ctermfg=white cterm=NONE
    hi MatchParen ctermbg=NONE ctermfg=red cterm=NONE
    hi SpellBad ctermbg=NONE ctermfg=red cterm=NONE
    hi SpellCap ctermbg=NONE ctermfg=white cterm=NONE
    hi SpellLocal ctermbg=NONE ctermfg=white cterm=NONE
    hi SpellRare ctermbg=NONE ctermfg=white cterm=NONE
    hi ColorColumn ctermbg=NONE ctermfg=white cterm=NONE
    hi SignColumn ctermbg=NONE ctermfg=white cterm=NONE
    hi ErrorMsg ctermbg=NONE ctermfg=red cterm=NONE
    hi ModeMsg ctermbg=NONE ctermfg=white cterm=NONE
    hi MoreMsg ctermbg=NONE ctermfg=white cterm=NONE
    hi Question ctermbg=NONE ctermfg=white cterm=NONE
    hi Cursor ctermbg=red ctermfg=magenta cterm=NONE
    hi iCursor ctermbg=red ctermfg=magenta cterm=NONE
    hi nCursor ctermbg=red ctermfg=magenta cterm=NONE
    hi QuickFixLine ctermbg=NONE ctermfg=red cterm=underline
    hi Conceal ctermbg=NONE ctermfg=gray cterm=NONE
    hi ToolbarLine ctermbg=NONE ctermfg=white cterm=NONE
    hi ToolbarButton ctermbg=NONE ctermfg=white cterm=NONE
    hi debugPC ctermbg=NONE ctermfg=darkblue cterm=NONE
    hi debugBreakpoint ctermbg=NONE ctermfg=blue cterm=NONE
    hi typescriptImport ctermbg=NONE ctermfg=darkmagenta cterm=NONE
    hi typescriptIdentifierName ctermbg=NONE ctermfg=darkred cterm=NONE
    hi typescriptArrowFuncArg ctermbg=NONE ctermfg=darkred cterm=NONE
    hi typescriptCall ctermbg=NONE ctermfg=darkred cterm=NONE
    hi typescriptMember ctermbg=NONE ctermfg=darkcyan cterm=NONE
    hi typescriptTypeReference ctermbg=NONE ctermfg=yellow cterm=NONE
    hi typescriptBraces ctermbg=NONE ctermfg=white cterm=NONE
    hi typescriptParenExp ctermbg=NONE ctermfg=NONE cterm=NONE
    hi typescriptBlock ctermbg=NONE ctermfg=NONE cterm=NONE
    hi typescriptMathStaticMethod ctermbg=NONE ctermfg=darkmagenta cterm=NONE
    hi typescriptDateStaticMethod ctermbg=NONE ctermfg=darkmagenta cterm=NONE
    hi typescriptTemplateSubstitution ctermbg=NONE ctermfg=NONE cterm=italic
    hi typescriptTemplateSB ctermbg=NONE ctermfg=darkmagenta cterm=italic
    hi typescriptCastKeyword ctermbg=NONE ctermfg=darkmagenta cterm=italic
    hi goBlock ctermbg=NONE ctermfg=darkred cterm=NONE
    hi goVarDefs ctermbg=NONE ctermfg=NONE cterm=NONE
    hi goVarAssign ctermbg=NONE ctermfg=NONE cterm=NONE
    hi goOperator ctermbg=NONE ctermfg=NONE cterm=NONE
    hi goFunctionCall ctermbg=NONE ctermfg=NONE cterm=NONE
endif

hi link EndOfBuffer NonText
hi link Number Constant
hi link StatusLineTerm StatusLine
hi link StatusLineTermNC StatusLineNC
hi link CursorLineNr CursorLine
hi link WarningMsg Error
hi link CursorIM Cursor
hi link CursorColumn CursorLine
hi link Terminal Normal
hi link typescriptIdentifierName Identifier
hi link typescriptFuncCallArg Identifier
hi link typescriptBlock typescriptMember
hi link typescriptClassName Type
hi link typescriptClassHeritage typescriptClassName
hi link typescriptObjectLabel Identifier
hi link goComment Comment
hi link vimOption Normal

let g:terminal_ansi_colors = [
        \ '#1d212a',
        \ '#e95678',
        \ '#29d398',
        \ '#fab795',
        \ '#252834',
        \ '#b877db',
        \ '#25b2bc',
        \ '#3e4047',
        \ '#22232e',
        \ '#ec6a88',
        \ '#3fdaa4',
        \ '#fbc3a7',
        \ '#3fc6de',
        \ '#f65b82',
        \ '#6be6e6',
        \ '#ebebeb',
        \ ]

" Generated with RNB (https://github.com/romainl/vim-rnb)
