set number relativenumber
syntax on

" I think this is where temp files are automatically saved?? Not sure.
set directory^=$HOME/.vim/tmp//

" Maps jumping across split Vim panes.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Sets up nice tabbing.
set expandtab
set shiftwidth=2
set softtabstop=2

"copy paste remap
vnoremap <C-c> "*y :let @+=@*<CR>
"map <C-v> "+p

" PLUGINs - I think I use vim-plug as my plugin manager?
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'valloric/youcompleteme'
Plug 'tomtom/tcomment_vim'
Plug 'gko/vim-coloresque'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'scrooloose/syntastic'
call plug#end()

colorscheme dracula
let mapleader=','

map <leader>d :NERDTreeToggle<CR>

" If you press enter on a word, all identical words will be highlighted.
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <CR> Highlighting()

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256
let g:powerline_pycmd = 'py3'

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

set timeoutlen=50
set ttimeoutlen=0
set autoindent
set showmatch 

filetype on         " Peek into files to find their types.
filetype plugin on
filetype indent on

" Text wrapping and formatting
" ============================

set wrap            " Turn on text wrapping.
set textwidth=79    " Hard wrap at 80 characters.
set colorcolumn=80  " Display the 80-character margin.

autocmd BufWrite * :call DeleteTrailingWS()
                    " Automatically delete trailing whitespace on saving.
" Syntastic
" =========

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_haskell_checkers=['hdevtools']
