if !executable('ctags')
    finish
elseif globpath(&runtimepath, 'plugin/tagbar.vim') ==? ''
    finish
endif

function! s:SetTagbar()
    if !exists('g:tagbar_type_elm')
        let g:tagbar_type_elm = {
            \ 'ctagstype' : 'elm'
            \ , 'sro':'&&&'
            \ , 'kind2scope':{ 'f':'function', 't':'type'}
            \ , 'scope2kind':{ 'function':'f', 'type':'t', 'type aliases':'a' }
            \ ,'kinds':[
                \ 't:types:0:0',
                \ 'a:type aliases:0:0',
                \ 'c:type constructors:0:0',
                \ 'f:function:1:0',
                \ 'i:imports:1:0',
                \ 'p:ports:1:0',
                \ 's:functions:0:0',
            \]
          \ , 'sort':0
        \}
    endif
endfunction

call s:SetTagbar()
