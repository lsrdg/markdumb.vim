function! s:ModfiableCheck()
    let modifiable_state = execute('set modifiable?')
    execute 'normal! dt#'
endfunction
	
function! s:FindHeader()
    let saved_unnamed_register = @@
    let pattern = '/\v^#+/'

    execute 'vimgrep ' . pattern . '%'
    execute 'vert copen'


    execute 'setlocal modifiable'
    execute '%normal! dt#'

    nnoremap <script> <buffer> <silent> q :cclose<cr>
endfunction

nnoremap <script> <buffer> <silent> <leader>cx 
	    \ :call <SID>FindHeader()<cr>


