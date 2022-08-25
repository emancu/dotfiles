" Show/Hide menu items. Perfect for GVim
" noremap <silent> <F1> :if &guioptions =~# 'm' <Bar> set guioptions-=m <bar> else <Bar> set guioptions+=m <Bar> endif<CR>
noremap <F1> :TagbarOpenAutoClose<CR>

" Source current file
noremap <F2> :tabnew<CR>:MRU <CR>
noremap <S-F2> :MRU <CR>

" Open Tree
noremap <F3> :Vex <CR>3i

" Execute tests
noremap <F4> <ESC>:TestNearest<CR>
noremap <S-F4> <ESC>:TestFile<CR>

" Create a gist with the selection
"noremap <F5> <ESC>:'<,'>Gist -p<CR>
"noremap <S-F5> <ESC>:Gist -p<CR>

" Execute files with Ruby 1.9
map <F6> <ESC>Odeb--<ESC>j:w<CR>
map <S-F6> <ESC>Olog--<ESC>j:w<CR>

" F7 is mapped to open snippets
" noremap <F7>

" Auto indent
noremap <F8> :!bundle exec rubocop -a %<CR>:e!<CR>
noremap <S-F8> gg=G``zz

" Select word and find next occurrence
noremap <F9> <ESC>*

" Toggle search highlight
noremap <F10> :set hlsearch!<CR>
inoremap <F10> <ESC>:set hlsearch!<CR>a
noremap <S-F10> :call HighlightOverlength() <CR>

" Handle trailing whitespaces and tabs.
noremap <F11> <ESC>:%s/\s*$//g<CR>:%s/\t/  /<CR>
noremap <S-F11> :IndentGuidesToggle<CR>

" Start and stop the webserver
"noremap <Leader>start <ESC>:!thin start -R config.ru -d<CR>
"noremap <Leader>stop  <ESC>:!thin stop<CR>

" Add magic comment for encoding
"nnoremap <Leader>enc :set paste<CR>ggi# encoding: UTF-8<CR><CR><ESC>:set nopaste<CR>

" Open file under the cursor in new tab
"noremap gf :tabe! <cfile><CR>
"noremap gF :w! /tmp/spec.results<CR><C-W>gF<CR>
"noremap gb :e# <CR>

" Go to mark at the colum where the mark was set
" noremap ' `

" Mimic command line editing
"noremap <C-K> <ESC>d$
"noremap <C-U> <ESC>d0
inoremap <C-A> <ESC>0i
inoremap <C-E> <ESC>$a

" Move between tabs
noremap <C-H> :tabp<CR>
noremap <C-L> :tabn<CR>
noremap <A-Left> :tabp <CR>
noremap <A-Right> :tabn <CR>


" Deactivate middle click
noremap <MiddleMouse> <Nop>
noremap <2-MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>

" Same as J but staying a line below
noremap K <ESC>kJ

" After a repeat operation, go back to the first character of the previously changed or yanked text
nnoremap . .`[

" Movement mappings
"nnoremap j gj
"nnoremap k gk
"nnoremap gm g$

" Break the undo chain on every Space
inoremap <Space> <Space><C-g>u

" Insert a blank line above the current line
inoremap <C-K> <ESC>O

" Move left and right in insert mode
"inoremap <C-L> <ESC>la
"inoremap <C-H> <ESC>ha

" Open file in new tab
nnoremap <C-O> :tab drop 
nnoremap <C-e> :tab drop <C-R>=expand("%:p:h") . "/"<CR>
" macm Edit.Find.Use\ Selection\ for\ Find key=<nop>
nnoremap <D-e> :e <C-R>=expand("%:p:h") . "/"<CR>

" Run git blame in the current file and display results in the preview window.
noremap <C-G> :call PreviewResults("cd " . expand("%:p:h") . " && git blame --date=short " . expand("%:p"))<CR>

noremap <C-n> :CtrlP<CR>
noremap <C-b> :CtrlPBuffer<CR>

" Undo & Redo cross-branch for a better solution watch vimcasts episode 30
" or try plugin: http://sjl.bitbucket.org/gundo.vim/
noremap u g-
noremap <C-r> g+

" Tipically copy/paste usage
vnoremap <C-x> "+x
vnoremap <C-c> "+y
inoremap <C-v> <ESC>"+gP i

noremap <C-m> <C-w>\|<C-w>_
" restores with <C-w>= or pressing enter

command! W w

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep selected text selected when fixing indentation
vnoremap < <gv
vnoremap > >gv

" Show quick-window or errors
nnoremap <Leader>e :copen<CR>
