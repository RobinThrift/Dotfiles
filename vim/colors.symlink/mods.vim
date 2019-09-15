
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

" MISC
" call s:hi ("NonText", 08, "")
" call s:hi ("Ignore", 08, "")
" call s:hi ("SpecialKey", 08, "")
" call s:hi ("LineNr", 08, "")

" GitGutter
" call s:hi ("GitGutterAdd",  02, 00)
" call s:hi ("GitGutterChange", 04, 00)
" call s:hi ("GitGutterDelete", 01, 00)
" call s:hi ("GitGutterChangeDelete", 02, 00)

" STATUS LINE
" call s:hi ("WarningMsg", 01, "")
" call s:hi ("StatusLine", 07, "NONE")
" call s:hi ("StatusLineNC", 08, "NONE")

" javascript
" call s:hi ("jsFuncCall", 05, 00)
" call s:hi ("jsVariableDef", 10, 00)

" xml (but really only for jsx)
" call s:hi ("xmlTagName", 06, 00)
" call s:hi ("xmlEndTag", 06, 00)
" call s:hi ("xmlAttrib", 06, 00)

" TypeScript
highlight! typescriptStatementKeyword guifg=#008097 gui=italic
highlight typescriptImport guifg=#8c98a7 gui=italic
highlight link typescriptFuncName Function
highlight link typescriptExport typescriptImport
highlight link typescriptFuncKeyword typescriptImport


" Go
highlight goConditional guifg=#8c98a7 gui=italic
highlight goLabel guifg=#8c98a7 gui=italic
highlight goRepeat guifg=#8c98a7 gui=italic
highlight goStatement guifg=#8c98a7 gui=italic
highlight goFormatSpecifier guifg=#c1c9d4


" for testing colourschemes/highlighting
map <Leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
