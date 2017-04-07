function! s:NextSection(type, backwards, position)
    if a:type == 1
	let pattern = '\v^#+'
    elseif a:type == 2
	let pattern = '\v(\[.+\]\(.+\))'
    elseif a:type == 3 
	let pattern = '\v^$\n^\|.+\|$'
    endif
    if a:backwards
	let dir = '?'
    else
	let dir = '/'
    endif

    if a:position 
	let word_positition = 'w'
    else
	let word_positition = ''
    endif

    execute 'silent normal! ' . dir . pattern . "\r" . word_positition 
endfunction

noremap <script> <buffer> <silent> ]]
        \ :call <sid>NextSection(1, 0, 1)<cr>

noremap <script> <buffer> <silent> [[
        \ :call <sid>NextSection(1, 1, 0)<cr>

noremap <script> <buffer> <silent> ][
        \ :call <sid>NextSection(2, 0, 1)<cr>

noremap <script> <buffer> <silent> []
        \ :call <sid>NextSection(2, 1, 0)<cr>

noremap <script> <buffer> <silent> -[
        \ :call <sid>NextSection(3, 0, 1)<cr>

noremap <script> <buffer> <silent> [-
        \ :call <sid>NextSection(3, 1, 0)<cr>
