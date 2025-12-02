" Syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

" Use gopls for all LSP features (single instance)
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_referrers_mode = 'gopls'

" Let gopls handle formatting (faster than external goimports)
" Default is 'gopls' when g:go_gopls_enabled = 1, so we remove the override

" Disable auto type info on cursor hold (reduces LSP traffic)
" Use K to manually get type info when needed
let g:go_auto_type_info = 0

" Disable vim-go completion (use gopls omnifunc directly)
let g:go_code_completion_enabled = 0
