set nocompatible
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/dein')
  call dein#begin(expand('~/.config/nvim/dein'))

  call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('scrooloose/nerdtree')
  call dein#add('jistr/vim-nerdtree-tabs')
  call dein#add('kien/ctrlp.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('mhinz/vim-grepper')
  call dein#add('neomake/neomake')

  " Haskell
  call dein#add('parsonsmatt/intero-neovim')
  call dein#add('neovimhaskell/haskell-vim')
  call dein#add('dracula/vim')

  " Python
  call dein#add('vim-scripts/indentpython.vim')
  call dein#add('nvie/vim-flake8')
  call dein#add('powerline/powerline')
  call dein#add('davidhalter/jedi')
  call dein#add('neovim/python-client')
  call dein#add('zchee/deoplete-jedi')

  call dein#end()
  call dein#save_state()
endif

" Enable deoplete
call deoplete#enable()
let g:deoplete#enable_at_startup = 1

" Noeomake setup
call neomake#configure#automake('rw', 1000)
let g:neomake_open_list = 2
let g:neomake_python_enabled_makers = ['python']

" execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible
set number
set showmode
set smartcase
set smarttab
set smartindent
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set laststatus=0
set clipboard=unnamed

colorscheme dracula

"haskell-vim settings
let g:haskell_indent_if = 2
let g:haskell_indent_before_where = 2
let g:haskell_indent_case_alternative = 1
let g:haskell_indent_let_no_in = 0

"NERDTREE Settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

"Intero-neovim Settings
augroup interoMaps
  au!
  " Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  " Open intero/GHCi split vertically
  au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Reloading (pick one)
  " Automatically reload on save
  au BufWritePost *.hs InteroReload
  " Manually save and reload
  au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  " Heads up! These next two differ from the rest.
  au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
  au FileType haskell map <silent> <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

" Python settings
let python_highlight_all=1
let g:python_host_prog = '/Users/dan/Envs/neovim2/bin/python'
let g:python3_host_prog = '/Users/dan/Envs/neovim3/bin/python'
let g:deoplete#sources#jedi#show_docstring = 1

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=79
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix

" JS Settings
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2

