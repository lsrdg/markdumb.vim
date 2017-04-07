function! s:NextSection(type, backwards)
    if a:type == 1
	let pattern = '\v^#+'
    elseif a:type == 2
	let pattern = '\v(\[.+\]\(.+\))'
    endif
    if a:backwards
	let dir = '?'
    else
	let dir = '/'
    endif

    execute 'silent normal! ' . dir . pattern . "\r"
endfunction

noremap <script> <buffer> <silent> ]]
    \ :call <sid>NextSection(1, 0)<cr>

noremap <script> <buffer> <silent> [[
        \ :call <sid>NextSection(1, 1)<cr>

noremap <script> <buffer> <silent> ][
        \ :call <sid>NextSection(2, 0)<cr>

noremap <script> <buffer> <silent> []
        \ :call <sid>NextSection(2, 1)<cr>
