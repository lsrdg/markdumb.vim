function! s:FindHeader()
    let saved_unnamed_register = @@
    let pattern = '/\v^#+/'

    execute 'vimgrep ' . pattern . '%'
    execute 'vert copen'
    nnoremap <script> <buffer> <silent> q :q<cr>
endfunction

nnoremap <script> <buffer> <silent> <leader>cx 
	    \ :call <SID>FindHeader()<cr>


