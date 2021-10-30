if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
 " Delete any old autocommands with
  au!

  " Makefile
  au BufNewFile,BufRead Makefile,makefile setf make

  " C language
  au BufNewFile,BufRead *.c setf c

  " C++ language
  au BufNewFile,BufRead *.h,*.cpp setf cpp

  " Haml xHTML Abstraction Markup Language
  au BufNewFile,BufRead *.haml setf haml

  " Haskell
  au BufNewFile,BufRead *.hs setf haskell

  " Mote
  au BufNewFile,BufRead *.mote setf mote

  " HTML with Ruby - eRuby
  au BufNewFile,BufRead *.erb,*.rhtml setf eruby

  " Markdown files
  au BufNewFile,BufRead *.markdown,*.md setf markdown

  " Ruby
  au BufNewFile,BufRead *.rb,*.rbw,*.gem,*.ru,*.thor,Thorfile,Rakefile,*.rabl setf ruby

  " Sass files
  au BufNewFile,BufRead *.sass setf sass

  " Go files
  au BufNewFile,BufRead *.go setf go

  " AsciiDoc
  au FileType markdown,asciidoc setlocal spell
  au BufNewFile,BufRead *.txt setf asciidoc

  " JSON
  au BufNewFile,BufRead *.js,*.json setf javascript
  " set all `es6` extensions to javascript
  au BufRead,BufNewFile *.{es6,es6.js} setf javascript

  " Citrus
  au BufNewFile,BufRead *.citrus setf citrus

  " Toml
  au BufNewFile,BufRead *.toml setf toml

  " Scripts and Bash files
  au BufNewFile,BufRead *.bash*, ~/.config/dotfiles/shell/* setf sh

  " Elixir
  au BufNewFile,BufRead *.ex,*.exs setf elixir
  au BufNewFile,BufRead *.eex,*.exs setf eelixir

  " Rust
  au BufNewFile,BufRead *.rs setf rust

  " julia
  au BufNewFile,BufRead *.jl setf julia

  " clojure
  au BufNewFile,BufRead *.clj setf clojure

  " crystal
  au BufNewFile,BufRead *.cr, Projectfile setf crystal
  au BufNewFile,BufRead *.ecr setf html

  " Swift
  au BufNewFile,BufRead *.swift setf swift

  au BufNewFile,BufRead *.pony setf pony

  au BufNewFile,BufRead *.elm setf elm
augroup END
