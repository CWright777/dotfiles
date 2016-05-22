set nocompatible
filetype off    " Required

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 
Plugin 'scrooloose/nerdtree'
Plugin 'VundleVim/Vundle.vim'
Plugin 'gmarik/vundle'    " Required
Plugin 'easymotion/vim-easymotion'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'raimondi/delimitmate'
Plugin 'docunext/closetag.vim'
Plugin 'The-NERD-Commenter'
Plugin 'ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'burnettk/vim-angular'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-surround'
Plugin 'matthewsimo/angular-vim-snippets'

filetype plugin indent on " Required
:set noswapfile
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Map control-p to ctrlp
let g:ctrlp_map = '<c-p>'

" General appearance and behaviour
filetype plugin indent on
syntax on
set visualbell t_vb=
set noerrorbells
set ruler
set showcmd
set showmatch
set wildmenu
set wildmode=list:longest,full
set backspace=indent,eol,start
set nowrap
set listchars=eol:$,nbsp:%
set pastetoggle=<F2>
set number
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif
set linebreak    "Wrap lines at convenient points
let mapleader = ","
nnoremap <leader>e :buffer NERD_tree_1<CR>
nmap <leader>ne :NERDTree<cr>

" treat ejs files as html
if has("autocmd")
    au BufRead,BufNewFile *.ejs setfiletype html
endif

" close nerdtree on open
"let NERDTreeQuitOnOpen=1

"ctrl-p: add line searching
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

"Enable Molokai theme
":colorscheme molokai
"Add Molokai background color
"let g:molokai_original = 1
Bundle 'https://github.com/freeo/vim-kalisi'

colorscheme kalisi
set background=dark

set t_Co=256

" Enable vim-airline
let g:airline#extensions#tabline#enabled = 2

 " Highlight searched phrases
set hlsearch
" search as characters are entered
set incsearch

" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=/home/yourname/.vimundo/

"Clone Paragraph with cp
noremap cp yap<S-}>p

"Save File with Leader + s
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

"Apply Macros with Q
nnoremap Q @q
vnoremap Q :norm @q<cr>

"Quit Files with Leader + q
noremap <leader>q :q<cr>

"Align Current Paragraph with Leader + a
noremap <leader>a =ip
