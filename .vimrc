syntax on

" Basic
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap

" Search settings
set ignorecase
set smartcase

let mapleader = " "

"========="
" Plugins "
"========="

call plug#begin('~/.config/nvim/bundle')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
" Highlight White Spaces
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
call plug#end()

"=================="
" Basic Remappings "
"=================="

" Remap Escape
inoremap jk <ESC>

" Disable Arrow Keys
nmap <Up> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>
nmap <Right> <Nop>

"================"
" Customizations "
"================"

" Trim trailing whitespace when saving a file
autocmd BufWritePre * %s/\s\+$//e
" Toggle NerdTree
map <C-n> :NERDTreeToggle<CR>
" Pretty Print JSON
nmap <leader>pp :%!python -m json.tool<cr>
" Parse JSON
" 1. Remove double quotes from keys
" 2. Change values to use single quote instead of double quotes
nmap <Leader>jp :%s/\"\(.*\)\":/\1:/g <bar> :%s/\"/'/g<CR>
" Switch between two files easier by pressing the leader key 2x
nmap <leader><leader> <c-^>
" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Ripgrep and File Searching
nmap <C-f> :Rg <Space>
nmap <silent> <C-p> :Files<CR>
nmap <silent> <C-g> :GFiles<CR>
nmap <silent> <C-o> :Buffers<CR>
" Better tabbing
map <Tab> >gv
map <S-Tab> <gv

" Default to NerdTree closed when opening a project/file
let g:NERDTreeHijackNetrw=0
