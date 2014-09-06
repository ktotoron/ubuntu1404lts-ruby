"Vim------------------------------------
set nocompatible
filetype plugin indent off 
"/Vim------------------------------------



"NeoBundle------------------------------------
if has('vim_starting')
  set nocompatible " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

" neocomplete.vimのgitアドレス
NeoBundle 'Shougo/neocomplete.vim'

" vimproc用
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }


" unite.vim
NeoBundle 'Shougo/unite.vim'

" vim-niji(lisp用括弧)
NeoBundle 'amdt/vim-niji'


    "ruby--------------------------------------------------
    NeoBundle 'Shougo/neosnippet', {
          \ 'autoload' : {
          \   'commands' : ['NeoSnippetEdit', 'NeoSnippetSource'],
          \   'filetypes' : 'snippet',
          \   'insert' : 1,
          \   'unite_sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
          \ }}
     
    NeoBundle 'tpope/vim-rails', { 'autoload' : {
          \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}
     
    NeoBundle 'alpaca-tc/vim-endwise.git', {
          \ 'autoload' : {
          \   'insert' : 1,
          \ }}
     
    NeoBundle 'edsono/vim-matchit', { 'autoload' : {
          \ 'filetypes': 'ruby',
          \ 'mappings' : ['nx', '%'] }}
     
    NeoBundle 'basyura/unite-rails', {
          \ 'depends' : 'Shougo/unite.vim',
          \ 'autoload' : {
          \   'unite_sources' : [
          \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
          \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
          \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
          \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
          \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
          \     'rails/stylesheet', 'rails/view'
          \   ]
          \ }}
     
    NeoBundle 'alpaca-tc/neorspec.vim', {
          \ 'depends' : ['alpaca-tc/vim-rails', 'tpope/vim-dispatch'],
          \ 'autoload' : {
          \   'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
          \ }}
     
    NeoBundle 'alpaca-tc/alpaca_tags', {
           \ 'rev' : 'v2.0',
           \ 'depends': ['Shougo/vimproc.vim'],
           \ 'autoload' : {
           \   'commands' : ['AlpacaTagsSet', 'AlpacaTagsBundle', 'AlpacaTagsCleanCache', 'AlpacaTagsUpdate'],
           \ }}

        "alpaca-tc/alpaca_tags--------------------------------------------------
        let g:alpaca_tags#config = {
                \ '_' : '-R --sort=yes --languages=+Ruby --languages=-js,JavaScript',
                \ 'default' : '--languages=-css,scss,html,js,JavaScript',
                \ 'js' : '--languages=+js',
                \ '-js' : '--languages=-js,JavaScript',
                \ 'vim' : '--languages=+Vim,vim',
                \ 'php' : '--languages=+php',
                \ '-vim' : '--languages=-Vim,vim',
                \ '-style': '--languages=-css,scss,js,JavaScript,html',
                \ 'scss' : '--languages=+scss --languages=-css',
                \ 'css' : '--languages=+css',
                \ 'java' : '--languages=+java $JAVA_HOME/src',
                \ 'ruby': '--languages=+Ruby',
                \ 'coffee': '--languages=+coffee',
                \ '-coffee': '--languages=-coffee',
                \ 'bundle': '--languages=+Ruby',
                \ }
        "/alpaca-tc/alpaca_tags--------------------------------------------------
 
    NeoBundle 'tsukkee/unite-tag', {
          \ 'depends' : ['Shougo/unite.vim'],
          \ 'autoload' : {
          \   'unite_sources' : ['tag', 'tag/file', 'tag/include']
          \ }}
    
    "/ruby--------------------------------------------------





"/NeoBundle-------------------------------------



"Vim--------------------------------------------
filetype on
filetype plugin on
filetype indent on
syntax on
set nu

set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2
"連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"/Vim--------------------------------------------



"NeoComplete-------------------------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" set omni heavy
let g:neocomplete#sources#omni#input_patterns = 1

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
  " neocomplete for ruby
  let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
  let g:neocomplete#omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


"/NeoComplete-------------------------------------



