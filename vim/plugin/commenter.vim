" Toggle comments with # or <!-- -->. Depending on file extension.
function! CommentAndUncomment()
  " Get the file extension only from the current buffer's file name.
  " Using expand("%:e") is more robust than stridx().
  let l:file_ext = expand("%:e")

  " Define a dictionary that maps file extensions to the names of the functions
  " that should be called.
  let l:comment_functions = {
      \ 'c':      's:CommentForC_Java',
      \ 'citrus': 's:CommentForRuby',
      \ 'coffee': 's:CommentForRuby',
      \ 'cpp':    's:CommentForC_Java',
      \ 'cr':     's:CommentForRuby',
      \ 'elm':    's:CommentForElm',
      \ 'erb':    's:CommentForHTML',
      \ 'ex':     's:CommentForRuby',
      \ 'exs':    's:CommentForRuby',
      \ 'go':     's:CommentForC_Java',
      \ 'h':      's:CommentForC_Java',
      \ 'haml':   's:CommentForHaml',
      \ 'hcl':    's:CommentForC_Java',
      \ 'hs':     's:CommentForElm',
      \ 'html':   's:CommentForHTML',
      \ 'java':   's:CommentForC_Java',
      \ 'jl':     's:CommentForRuby',
      \ 'js':     's:CommentForC_Java',
      \ 'rb':     's:CommentForRuby',
      \ 'setup':  's:CommentForRuby',
      \ 'sh':     's:CommentForRuby',
      \ 'sql':    's:CommentForElm',
      \ 'tf':     's:CommentForRuby',
      \ 'tfvars': 's:CommentForRuby',
      \ 'vim':    's:CommentForVim',
      \ 'yaml':   's:CommentForRuby',
      \ 'yml':    's:CommentForRuby',
      \ }

  " Use the get() function to safely retrieve the function name from the dictionary.
  " It returns an empty string if the file extension is not found.
  let l:comment_function = get(l:comment_functions, l:file_ext, '')

  " Check if a function name was found before calling it.
  if !empty(l:comment_function)
    " The call() function is used to execute a function by its name stored in a variable.
    " The second argument is a list of arguments for the function, which is empty here.
    call call(l:comment_function, [])
  endif
endfunction


" <!-- content -->
function s:CommentForHTML()
  let s:line = getline(".")
  if match(s:line, '^\s*<!-- ') != -1
    call setline(".", substitute(s:line, '^\s*<!-- \(.*\) -->', "\\1", ""))
  else
    call setline(".", substitute(s:line, "\\(\\s*\\)\\(.*\\)", "<!--\\1 \\2 -->", ""))
  end
endfunction

" # content
function s:CommentForRuby()
  let s:line = getline(".")
  if match(s:line, '^\s*# ') != -1
    call setline(".", substitute(s:line, "\\(\\s*\\)# ", "\\1", ""))
  elseif match(s:line, '^\s*[^#]') != -1
    call setline(".", substitute(s:line, "\\(\\s*\\)", "\\1# ", ""))
  end
endfunction

" - # content
function s:CommentForHaml()
  let s:line = getline(".")
  if match(s:line, '^\s*- # ') != -1
    call setline(".", substitute(s:line, "\\(\\s*\\)- # ", "\\1", ""))
  elseif match(s:line, '^\s*[^#]') != -1
    call setline(".", substitute(s:line, "\\(\\s*\\)", "\\1- # ", ""))
  end
endfunction

" // content
function s:CommentForC_Java()
  let s:line = getline(".")
  if match(s:line, '^\s*\/\/ ') != -1
    call setline(".", substitute(s:line, "\\(\\s*\\)\/\/ ", "\\1", ""))
  elseif match(s:line, '^\s*[^\/\/]') != -1
    call setline(".", substitute(s:line, "\\(\\s*\\)", "\\1\/\/ ", ""))
  end
endfunction

" "content
function s:CommentForVim()
  let s:line = getline(".")
  if match(s:line, '^\s*" ') != -1
    call setline(".", substitute(s:line, "\\(\\s*\\)\" ", "\\1", ""))
  elseif match(s:line, '^\s*[^"]') != -1
    call setline(".", substitute(s:line, "\\(\\s*\\)", "\\1\" ", ""))
  end
endfunction

" -- content
function s:CommentForElm()
  let s:line = getline(".")
  if match(s:line, '^\s*-- ') != -1
    call setline(".", substitute(s:line, "\\(\\s*\\)-- ", "\\1", ""))
  elseif match(s:line, '^\s*[^--]') != -1
    call setline(".", substitute(s:line, "\\(\\s*\\)", "\\1-- ", ""))
  end
endfunction

map # :call CommentAndUncomment()<CR>
