set nocompatible		"required
filetype off			"required
set term=screen-256color
set shell=zsh\ -l

"set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Add Plugins Here
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scwood/vim-hybrid'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tomtom/tcomment_vim'
Plugin 'posva/vim-vue'

" All Plugins must be added before the next line
call vundle#end()		"required
filetype plugin indent on	"required

" enable folding and line numbers
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1
set nu
function! NumberToggle()
	if(&rnu == 1)
		set nu
	else
		set rnu
	endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>
au FocusLost * :set nu
au FocusGained * :set rnu
autocmd InsertEnter * :set nu
autocmd InsertLeave * :set rnu

"python with virtualenv support
let python_highlight_all=1
syntax on
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dire, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8
set background=dark
colorscheme hybrid

let mapleader = ","

imap jk <esc>

map <Leader>bb :!bundle install
nmap <Leader>bi :source ~/.vimrc<cr>:PluginInstall<cr>
nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * :Vexplore
augroup END

" Fixing Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
