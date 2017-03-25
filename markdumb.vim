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

inoremap jk <cr><esc>:call NextParagraph()<cr>

function! NextParagraph()
   execute "normal! jdapzzO"
endfunction

""""""""""""""""""""""""""""""

" Insert markdown's link structure and move to the []
inoremap <C-f>f []()<esc>F[a

" Move to inside the next parenthesis with <C-r> waiting
inoremap qq <esc>f(a<C-r>


" Manually make a visual selection with `b`, like `v3b`, then
" <C-f>v will surround the text with [] and place the cursor
" inside the () with <C-r> waiting for the register
vnoremap <C-f>v <esc>i[<esc>gvo<esc>a]()<esc>i<C-r>
