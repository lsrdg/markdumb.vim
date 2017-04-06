" From https://gist.github.com/sjl/1038710
func! Foldexpr_markdown(lnum)
    let l1 = getline(a:lnum)

    if l1 =~ '^\s*$'
        " ignore empty lines
        return '='
    endif

    let l2 = getline(a:lnum+1)

    if  l2 =~ '^==\+\s*'
        " next line is underlined (level 1)
        return '>1'
    elseif l2 =~ '^--\+\s*'
        " next line is underlined (level 2)
        return '>2'
    elseif l1 =~ '^#'
        " current line starts with hashes
        return '>'.matchend(l1, '^#\+')
    elseif a:lnum == 1
        " fold any 'preamble'
        return '>1'
    else
        " keep previous foldlevel
        return '='
    endif
endfunc

setlocal foldexpr=Foldexpr_markdown(v:lnum)
setlocal foldmethod=expr

"---------- everything after this is optional -----------------------
" change the following fold options to your liking
" see ':help fold-options' for more
setlocal foldenable
setlocal foldlevel=0
setlocal foldcolumn=0"function! MarkdownFoldHeaders()

"---=======----------------==========----------=====
" Adapted from https://gist.github.com/anonymous/4149842
"    let thisline = getline(v:lnum)
"
"    if match(thisline, '^######') >= 0
"	return ">6"
"    elseif match(thisline, '^#####') >= 0
"	return ">5"
"    elseif match(thisline, '^####') >= 0
"        return ">4"
"    elseif match(thisline, '^###') >= 0
"	return ">3"
"    elseif match(thisline, '^##') >= 0
"	return ">2"
"    elseif match(thisline, '^#') >= 0
"	return ">1"
"    else
"	return "="
"endfunction
"
"setlocal foldmethod=expr
"setlocal foldexpr=MarkdownFoldHeaders()
"
"
"function! MarkdownFoldText()
"    let foldsize = (v:foldend-v:foldstart)
"    return getline(v:foldstart).' ('.foldsize.' lines)'
"endfunction
"
"
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My unexpressive foldexpr
"
"
" function! MarkdownFoldParagraphs()
"     setlocal foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
" endfunction
" 
" function! SetMarkdownFolds(kind)
" 
"     let 
" 
"     
"     elseif a:1 == \"headers"
" 	setlocal foldmethod=expr
" 	setlocal foldtext=MarkdownFoldText()
" 	setlocal foldexpr=MarkdownFoldHeaders()
"     elseif a:1 == \"paragraphs"
" 	setlocal foldmethod=expr
" 	setlocal foldtext=MarkdownFoldText()
" 	setlocal foldexpr=MarkdownFoldParagraphs()
"     endif
" endfunction
