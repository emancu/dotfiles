let g:ctrlp_root_markers          = ['.git']
let g:ctrlp_working_path_mode     = 'rw'
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_match_window_bottom   = 0
let g:ctrlp_max_depth             = 40
let g:ctrlp_max_height            = 20
let g:ctrlp_max_files             = 20000
let g:ctrlp_max_history           = 0
let g:ctrlp_custom_ignore         = '\v[\/](\.git|\.svn|log|tmp|_build|deps|node_modules|elm-stuff|logs|\.pyc|dbt_packages|target)$'

" Enable this in case I want to use a different command to list files
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-cr>'],
  \ 'AcceptSelection("h")': ['<c-h>', '<c-s>'],
  \ 'AcceptSelection("t")': ['<cr>'],
  \ 'AcceptSelection("v")': ['<c-v>'],
  \ }

let g:ctrlp_status_func = { 'main': 'CtrlP_Statusline' }

function! CtrlP_Statusline(...)
  return 'Searching in: %#StatusLine#' .getcwd(). '%*'
endf
