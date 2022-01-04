call plug#begin('~/.vim/plugged')

"""Plugins"""
Plug 'christoomey/vim-tmux-navigator'
" Note that you need fzf and rg already installed on your terminal to make use of the search.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Front end formatters.
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'peitalin/vim-jsx-typescript'

"  LSP stuff
Plug 'neovim/nvim-lspconfig'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

"Airline"
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

"misc"
Plug 'preservim/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'

"Colours"
Plug 'drewtempelmeyer/palenight.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

"""Enable Plugins"""
filetype plugin on
filetype indent on

" Navigate diagnostic messages with '[g' and ]g'
nmap <silent> <Leader>j :lprevious<CR>
" nmap <silent> <Leader>k :lnext<CR>

"""Emmet config"""
let g:user_emmet_leader_key=','

"""FZF"""
nmap <Leader>F :Files<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>h :History:<CR>
nmap <Leader>g :Rg<Space>
nmap <Leader>b :Buffers<CR>
let g:rg_derive_root='true'

""General Stuff""
syntax enable
set cursorline
:hi CursorLine ctermbg=darkgray term=none cterm=none
set expandtab
set hidden
set lazyredraw
set mouse+=a
set number relativenumber
set nu rnu
set showcmd
set showmatch
set splitright
set splitbelow
set tw=80
set ttyfast
set wildmenu
set wrap linebreak nolist
set clipboard=unnamedplus
set noshowmode

"Airline
let g:airline#extensions#branch#enabled=0
let g:airline_powerline_fonts = 1

"""Copy/Paste Binds"""
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+P

"""Folding Settings"""
set foldenable
set foldlevelstart=2
set foldnestmax=20
set foldmethod=indent

"""Indent Settings""
" Keep visual highlight when indenting multiple times.
vnoremap < <gv
vnoremap > >gv

"""Search Settings""""
nnoremap <CR> :noh<CR><CR>

"""Key Mapping"""
" Spacebar to open and close folds.
nnoremap <space> za
" " <leader> spacebar to open all folds.
nnoremap <leader><space> zR

""Split naaaaaav"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"""tab map""
nnoremap tc :tabclose<CR>
nnoremap tn :tabnew %<CR>

"""Quick visual term"""
tnoremap jj <C-\><C-n>

"File formatting
autocmd BufNewFile,BufRead *.html setlocal sw=2 sts=2 ts=2
autocmd BufNewFile,BufRead *.css setlocal sw=4 sts=4 ts=4
autocmd BufNewFile,BufRead *.js set sw=2 sts=2 ts=2
autocmd BufNewFile,BufRead *.ts set sw=2 sts=2 ts=2
autocmd BufNewFile,BufRead *.tsx set sw=2 sts=2 ts=2
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
autocmd FileType python set autoindent shiftwidth=4 softtabstop=4 tabstop=4 tw=100
autocmd BufNewFile,Bufread .sh setlocal autoindent shiftwidth=4 softtabstop=4 tabstop=4
autocmd BufNewFile,BufRead *.cc setlocal sw=2 sts=2 ts=2 autoindent
autocmd BufNewFile,BufRead *.vim setlocal sw=2 sts=2 ts=2 autoindent
autocmd BufNewFile,BufRead *.h setlocal sw=2 sts=2 ts=2 autoindent
autocmd BufNewFile,BufRead *.proto setlocal sw=2 sts=2 ts=2 autoindent
autocmd BufNewFile,BufRead *.pbtxt setlocal sw=2 sts=2 ts=2 autoindent
autocmd BufNewFile,BufRead *.json setlocal sw=2 sts=2 ts=2 autoindent
autocmd BufNewFile,BufRead *.yaml setlocal sw=2 sts=2 ts=2 autoindent
autocmd BufNewFile,BufRead *.sql setlocal sw=2 sts=2 ts=2

"""Highlight trailing whitespace"""
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"""Highlight line numbers"""
highlight LineNr ctermfg=yellow ctermbg=black

""Tokyo night colours""
let g:tokyonight_style="storm"

"""Colours"""
colorscheme tokyonight
set syntax
set termguicolors

"""Spell check"""
set spell
set spelllang=en
set spellfile=$HOME/vim/spell/en.utf-8.add
