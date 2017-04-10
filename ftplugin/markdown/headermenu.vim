function! s:FindHeader()
    let saved_unnamed_register = @@
    let pattern = '/\v^#+/'

    execute 'lvimgrep ' . pattern . '%'
    execute 'vert lopen 35'

    execute 'setlocal modifiable'
    execute '%normal! dt#'

    nnoremap <script> <buffer> <silent> q :lclose<cr>
endfunction

nnoremap <script> <buffer> <silent> <leader>cx 
	    \ :call <SID>FindHeader()<cr>


