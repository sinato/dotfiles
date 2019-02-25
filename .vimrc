set number
set noswapfile
set cursorline
set hlsearch

" indent options
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" key mappings
inoremap jk <esc>
let mapleader = "\<Space>"
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
inoremap <C-f> <right>
nnoremap <esc><esc> :noh<CR>

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
Plug 'scrooloose/nerdtree'
Plug 'cespare/vim-toml'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'terryma/vim-expand-region'
Plug 'cohama/lexima.vim'
Plug 'w0ng/vim-hybrid'
call plug#end()

" for rust-lang
let g:rustfmt_autosave = 1
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
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
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

set background=dark
colorscheme hybrid
