" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" Navigate through headers
nnoremap <leader>cx :call PreviousHeader()<cr>
nnoremap <leader>cv :call NextHeader()<cr>

function! PreviousHeader()
   ?^#\+
   execute "normal! w"
endfunction

function! NextHeader()
   /^#\+ 
   execute "normal! w"
endfunction

""""""""""""""""""""""""""""""
" Separate two paragraphs and and delete de last one
" This mapping works by itself:
"                          
"                inoremap jk <cr><esc>jdapzzO
"
" But the function is the base for the Augroup which
" will apply the mapping only when editing markdown
"
"

function! NextParagraph(...)
   if a:1 == "i"
    execute "normal! jdapzzO"
   elseif a:1 == "n"
    execute "normal! jdapzz"
   else
    echom "Ooooops"
   endif
endfunction


inoremap jk <cr><esc>:call NextParagraph("i")<cr>

inoremap kj <cr><esc>:call NextParagraph("n")<cr>
""""""""""""""""""""""""""""""


" Insert markdown's link structure and move to the []

inoremap <C-f>f []()<esc>F[a

" Move to inside the next parenthesis with <C-r> waiting
inoremap qq <esc>f(a<C-r>

" Manually make a visual selection with `b`, like `v3b`, then
" <C-f>v will surround the text with [] and place the cursor
" inside the () with <C-r> waiting for the register
vnoremap <C-f>v <esc>i[<esc>gvo<esc>a]()<esc>i<C-r>
