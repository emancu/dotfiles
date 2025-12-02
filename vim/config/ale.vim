" ALE Configuration

" Disable ALE's LSP features to avoid conflicts with language-specific plugins
" (vim-go handles gopls for Go)
let g:ale_disable_lsp = 1

" Exclude slow linters from running on save
" golangci-lint is powerful but too slow for real-time feedback
let g:ale_linters_ignore = {
\   'go': ['golangci-lint'],
\}
