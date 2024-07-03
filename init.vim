call plug#begin()

Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/todo-comments.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'numToStr/Comment.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

call plug#end()

lua require('lualine').setup()

" LSP config
lua require("mason").setup{}
lua require("mason-lspconfig").setup{}
lua require("lspconfig").clangd.setup{}
lua require("lspconfig").pylsp.setup{}

" Comment config
lua require('Comment').setup()

lua require("nvim-autopairs").setup{}

lua require("todo-comments").setup{}

autocmd VimEnter * if argc() == 0 | execute 'lua require("telescope.builtin").find_files()' | endif

" Transparent vim
colorscheme default
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
map <leader>e :<C-u>Explore<CR>
map <leader>s :<C-u>buffers<CR>
map <Tab> :<C-u>bn<CR>
map <S-Tab> :<C-u>bp<CR>
map <leader>d :<C-u>bd<CR>
nmap <leader>O O<Esc>
nmap <leader>o o<Esc>
map <Esc> :<C-u>noh <CR>
map <S-Up> :m-2 <CR>
map <S-Down> :m+1 <CR>
vmap p "_dP
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h
map <leader>V :vsp<CR>
map <leader>H :sp<CR>

" Misc plugin mappings
nmap <leader>t :TodoLocList<CR>
nmap <leader>/ :lua require('Comment.api').toggle.linewise.current()<CR>
vmap <leader>/ <ESC>:<C-u>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>
map <leader>E :lua vim.diagnostic.open_float()<CR>

" Telescope mappings
nmap <leader>ff :Telescope find_files<CR>
nmap <leader>fw :Telescope live_grep<CR>
nmap <leader>fb :Telescope buffers<CR>
nmap <leader>fh :Telescope help_tags<CR>
nmap <leader>ft :TodoTelescope<CR>

" harpoon mappings
nmap <leader>h :lua require("harpoon.ui").toggle_quick_menu()<CR>
nmap <leader>a :lua require("harpoon.mark").add_file()<CR>
nmap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nmap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nmap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nmap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
nmap <leader>5 :lua require("harpoon.ui").nav_file(5)<CR>
nmap <leader>6 :lua require("harpoon.ui").nav_file(6)<CR>
nmap <leader>7 :lua require("harpoon.ui").nav_file(7)<CR>
nmap <leader>8 :lua require("harpoon.ui").nav_file(8)<CR>
nmap <leader>9 :lua require("harpoon.ui").nav_file(9)<CR>
nmap <leader>0 :lua require("harpoon.ui").nav_file(10)<CR>

" lua require('statusline')
lua require('treesitter')
