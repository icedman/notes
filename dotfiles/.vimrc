" unlet! skip_defaults_vim
" source /usr/share/vim/vim90/defaults.vim 

call plug#begin()

Plug 'ghifarit53/tokyonight-vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf.vim'
Plug 'icedman/vim-textmate'

call plug#end()

set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

syn on
" luafile ~/Developer/Projects/vim-textmate/vim-textmate.lua
" lua txmt_set_theme("Dracula")

" rubyfile ~/.vim/plugged/vim-textpow/vim-textpow.rb
luafile ~/.vim/plugged/vim-textmate/vim-textmate.lua

"command Textpow 0 %  :rubyfile ~/Developer/Projects/vim-textpow/vim-textpow.rb
"command Textmate 0 % :luafile ~/Developer/Projects/vim-textmate/vim-textmate.lua

" Textpow
" Textmate

" NERDTRee
nnoremap <F2> :NERDTreeToggle<CR>

" Enable vim-airline
let g:airline#extensions#tabline#enabled = 1

" Theme configuration (optional)
"let g:airline_theme='minimalist'

" Enable powerline symbols (optional)
let g:airline_powerline_fonts = 1

" Keybinding to open fzf file finder
nnoremap <leader>ff :Files<CR>

set noswapfile     " Disable creating swap files

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
