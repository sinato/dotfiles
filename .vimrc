set number
set noswapfile
set cursorline
set hlsearch
set hidden

" set laststatus=2
set encoding=UTF-8

" indent options
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set splitbelow
set splitright
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" folding
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview

" key mappings
inoremap jk <esc>
let mapleader = "\<Space>"
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>- :split<CR>
nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>b :%!xxd<CR>
nnoremap <Leader>br :%!xxd -r<CR>
inoremap <C-f> <right>
nnoremap <esc><esc> :noh<CR>
nnoremap <Leader>o za

" vim-plug settings
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
" Automatically install missing plugins on startup
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall | q
endif
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'cespare/vim-toml'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'w0rp/ale'
Plug 'thinca/vim-quickrun'
" Plug 'majutsushi/tagbar'
Plug 'terryma/vim-expand-region'
Plug 'cohama/lexima.vim'
Plug 'simeji/winresizer'
Plug 'w0ng/vim-hybrid'
" Plug 'itchyny/lightline.vim'
" Plug 'itchyny/vim-gitbranch'
" Plug 'edkolev/tmuxline.vim'
call plug#end()

" for rust-lang
let g:rustfmt_autosave = 1
let g:rustfmt_command = "$HOME/.cargo/bin/rustfmt"
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
" let g:racer_experimental_completer = 1
" au FileType rust nmap gd <Plug>(rust-def)
" au FileType rust nmap gs <Plug>(rust-def-split)
" au FileType rust nmap gx <Plug>(rust-def-vertical)
" au FileType rust nmap <leader>gd <Plug>(rust-doc)
let g:rust_fold = 1
" autocmd BufNewFile,BufRead *.rs  let g:quickrun_config = {'rust': {'exec' : 'cat input.txt | cargo run', 'runner': 'job'}}
" for 'w0rp/ale'
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1
let g:ale_echo_cursor = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" for 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
" for 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" for 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" for 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" set cursor shape
"
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

set background=dark
colorscheme hybrid

" let g:tagbar_type_rust = {
"     \ 'ctagstype' : 'rust',
"     \ 'kinds' : [
"         \'T:types,type definitions',
"         \'f:functions,function definitions',
"         \'g:enum,enumeration names',
"         \'s:structure names',
"         \'m:modules,module names',
"         \'c:consts,static constants',
"         \'t:traits,traits',
"         \'i:impls,trait implementations',
"     \ ]
"  \ }

" set lightline
" let g:lightline = {
"     \ 'colorscheme': 'jellybeans'
"     \}
" " set tmuxline
" let g:tmuxline_preset = {
"   \'a'  : '#S',
"   \'c'    : ['#(whoami)', '#(uptime | cud -d " " -f 1,2,3)'],
"   \'win'  : ['#I', '#W'],
"   \'cwin' : ['#I', '#W', '#F'],
"   \'x'    : '#(date)',
"   \}
" 
