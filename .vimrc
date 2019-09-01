" let mapleader = "\<Space>"
"nnoremap <F3> :!sh -xc 'rsync -avzh -e ssh --include='.git' --exclude='*.swp' ~/devel/scale-product/* buildvm:/local/scale-product'

set nocompatible              " be iMproved, required
filetype off                  " required

set tabstop=4       " The width of a TAB is set to 4.
set shiftwidth=4
set softtabstop=4
set expandtab

set autoread

set relativenumber
set number
set hlsearch

" backspace will continue over the current line
set backspace=indent,eol,start

" Moving between splits
nnoremap <Space>j <C-W><C-J>
nnoremap <Space>k <C-W><C-K>
nnoremap <Space>l <C-W><C-L>
nnoremap <Space>h <C-W><C-H>
nnoremap <Space>= <C-W>=

" Move splits left and right
nnoremap <Space>H <C-W>H
nnoremap <Space>L <C-W>L

map <C-K> :pyf <path-to-this-file>/clang-format.py<cr>
imap <C-K> <c-o>:pyf <path-to-this-file>/clang-format.py<cr>

" Switches between source and header file
" A<CR> assumes a.vim is in use for switching
source ~/.vim/bundle/a.vim
nnoremap <Space>, :A<CR>
" Switches to previous buffer
nnoremap <Space><Tab> <C-^>


" autocmd FileType cpp ClangFormatAutoEnable

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" To install new plugins, open vim and run :PluginInstall
Plugin 'scrooloose/nerdtree'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'rhysd/vim-clang-format'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'valloric/youcompleteme'
"Plugin 'bfrg/vim-cpp-modern'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-commentary'
Plugin 'dracula/vim'
Plugin 'nanotech/jellybeans.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" CtrlP hotkey mappings and settings
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_switch_buffer = 'et' " If a file is already open, switch to that window
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" clang_format_vim settings
" let g:clang_format#auto_format = 1 " Auto formats a file when saved

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Ignore specified files and directories

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Syntastic mappines and settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_c_include_dirs = ['/Users/jeremywatson/devel/scale-product/thirdparty/forte/forte-2.0.0']
"let g:syntastic_error_symbol = "✗"

set background=dark
colorscheme jellybeans
syntax on
set modifiable

set listchars=tab:▸\ ,trail:•
set list

autocmd FileType apache setlocal commentstring=#\ %s
