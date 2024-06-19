call plug#begin()

Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Dimercel/todo-vim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'numToStr/Comment.nvim'
Plug 'windwp/nvim-autopairs'

call plug#end()

" LSP config
lua require("mason").setup{}
lua require("mason-lspconfig").setup{}
lua require("lspconfig").clangd.setup{}
lua require("lspconfig").pylsp.setup{}

lua require("nvim-autopairs").setup{}

autocmd VimEnter * if argc() == 0 | execute 'lua require("telescope.builtin").find_files()' | endif

" Comment config
lua require('Comment').setup()

" Transparent vim
highlight Normal guibg=NONE ctermbg=NONE

" Statusline config
highlight StatusLine ctermfg=white ctermbg=NONE guifg=#ffffff guibg=NONE
highlight StatusLineNC ctermfg=grey ctermbg=NONE guifg=#808080 guibg=NONE

" Customize the status line content
set statusline=
set statusline+=%f       " File name
set statusline+=%h       " Help file flag
set statusline+=%m       " Modified flag
set statusline+=%r       " Readonly flag
set statusline+=%=       " Right align the remaining items
set statusline+=\ %p%%   " File position percentage
set statusline+=\ %l:%c  " Line and column number
set laststatus=2

set cursorline
set clipboard=unnamedplus
set number
set scrolloff=10
set tabstop=4
set shiftwidth=4
set expandtab
set wrap
set linebreak
set breakindent
set undofile

let mapleader = " "

" general mappings
map j gj
map k gk
vmap <C-c> "+y
nmap <C-c> "+yy
map <leader>e :Explore<CR>
map <leader>s :buffers<CR>
map <Tab> :bn<CR>
map <S-Tab> :bp<CR>
map <leader>d :bd<CR>
nmap <leader>O O<Esc>
nmap <leader>o o<Esc>
map <Esc> :noh <CR>
map <S-Up> :m-2 <CR>
map <S-Down> :m+1 <CR>
map <leader>D <C-d>
map <leader>U <C-u>
vmap p "_dP

" Misc plugin mappings
nmap <leader>t :TODOToggle<CR>
nmap <leader>/ :lua require('Comment.api').toggle.linewise.current()<CR>
vmap <leader>/ <ESC>:lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>

" Telescope mappings
nmap <leader>ff :Telescope find_files<CR>
nmap <leader>fw :Telescope live_grep<CR>
nmap <leader>fb :Telescope buffers<CR>
nmap <leader>fh :Telescope help_tags<CR>

" harpoon mappings
nmap <leader>h :lua require("harpoon.ui").toggle_quick_menu()<CR>
nmap <leader>a :lua require("harpoon.mark").add_file()<CR>
nmap <leader>! :lua require("harpoon.ui").nav_file(1)<CR>
nmap <leader>@ :lua require("harpoon.ui").nav_file(2)<CR>
nmap <leader># :lua require("harpoon.ui").nav_file(3)<CR>
nmap <leader>$ :lua require("harpoon.ui").nav_file(4)<CR>
nmap <leader>% :lua require("harpoon.ui").nav_file(5)<CR>
nmap <leader>^ :lua require("harpoon.ui").nav_file(6)<CR>
nmap <leader>& :lua require("harpoon.ui").nav_file(7)<CR>
nmap <leader>* :lua require("harpoon.ui").nav_file(8)<CR>
nmap <leader>( :lua require("harpoon.ui").nav_file(9)<CR>
nmap <leader>) :lua require("harpoon.ui").nav_file(10)<CR>

" lua require('statusline')
lua require('treesitter')
