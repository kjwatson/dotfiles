" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'nanotech/jellybeans.vim', { 'tag': 'v1.6' }
Plug 'dracula/vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'w0rp/ale'
"Plug 'ssh://gerrit.lab.local:29418/scbuild', { 'do': './install.sh' }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Separate source for a.vim
source ~/.vim/bundle/a.vim

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

" Clang format
map <C-K> :pyf /usr/local/Cellar/llvm/6.0.0/share/clang/clang-format.py<CR>
imap <C-K> <c-o>:pyf /usr/local/Cellar/llvm/6.0.0/share/clang/clang-format.py<CR>

" Switches between source and header file
" Assumes a.vim is in use for switching
nnoremap <Space>, :A<CR>

" Switches to previous buffer
nnoremap <Space><Tab> <C-^>

" FZF
nnoremap <Space>f :FZF<CR>

" The Silver Searcher
nnoremap <Space>g :Ag<CR>

" coc.nvim Tab Completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set background=dark
colorscheme jellybeans
syntax on
set modifiable

set listchars=tab:▸\ ,trail:•
set list

autocmd FileType apache setlocal commentstring=#\ %s

" coc-pairs
autocmd FileType cpp let b:coc_paris_disabled = ['<']

" coc.nvim highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

" rscmake and gcov
let g:ale_linters = {
    \ 'cpp' : ['rscmake', 'cppcheck', 'clangtidy', 'gcovcheck'],
    \ }

let g:ale_echo_msg_format = '%code: %%s %linter%'
let g:ale_sign_info = 'X'
highlight link ALEInfoSign ALEInfo

" function! SetupEnvironment()
"   let l:path = expand('%:p')
"   if l:path =~# $HOME.'/devel/scale-product'
"     let b:dispatch = 'rscmake'
"   elseif l:path =~# $HOME.'/git/notjobless'
"     let b:dispatch = './make.sh'
"   elseif !empty(glob('./CMakeLists.txt')) && !empty(glob('./build'))
"       let b:dispatch = 'make -C build/'
"   endif
" endfunction
" autocmd FileType cpp call SetupEnvironment()
" autocmd FileType rust let b:dispatch = 'cargo build'
" autocmd FileType go let b:dispatch = 'go build %'

" use ripgrep as :grep in vim
if executable('rg')
    set grepprg=rg\ --vimgrep\ --color=never
endif
