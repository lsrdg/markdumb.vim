" Open file with opened folds
execute "normal! zR"

set textwidth=80

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

""""""""""""""""""""""""""""""
" Translation/Review maps

if !exists('g:NextParagraphI')
    let g:NextParagraphI = '<c-f>j'
endif

if !exists('g:NextParagraphN')
    let g:NextParagraphN = '<c-f>k'
endif
    
function! NextParagraph(...)
   if a:1 == "i"
    execute "normal! jdapzzO"
   elseif a:1 == "n"
    execute "normal! jdapzz"
   else
    echom "Ooooops"
   endif
endfunction

execute "inoremap" g:NextParagraphI '<cr><esc>:call NextParagraph("i")<cr>'

execute "inoremap" g:NextParagraphN '<cr><esc>:call NextParagraph("n")<cr>'
""""""""""""""""""""""""""""""


" Insert markdown's link structure and move to the []

if !exists('g:InsertLinkMap')
    let g:InsertLinkMap = "<C-f>f"
endif

function! InsertMarkdownLink()
    execute "normal! i[]()"
    execute "normal! F]" 
    startinsert
endfunction

execute "inoremap" g:InsertLinkMap '<esc>:call InsertMarkdownLink()<cr>'

" Move to inside the next parenthesis with <C-r> waiting
inoremap qq <esc>f(a<C-r>
" <C-f>v will surround the text with [] and place the cursor
" inside the () with <C-r> waiting for the register
vnoremap <C-f>v <esc>i[<esc>gvo<esc>ea]()<esc>i<C-r>

