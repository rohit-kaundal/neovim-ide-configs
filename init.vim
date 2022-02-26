"Plug 'neoclide/coc.nvim'
set encoding=UTF-8
let mapleader = ","
syntax on
filetype plugin on
set wildmenu
set path+=**
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set relativenumber
set guicursor=
set nohlsearch
set hidden
set noerrorbells
set nowrap
set nu
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set signcolumn=yes
set cmdheight=2
set updatetime=50
set colorcolumn=100

call plug#begin('~/vim/plugged')

" Auto close paranthesis
Plug 'cohama/lexima.vim'

" Airline status bar
Plug 'vim-airline/vim-airline'

" Telescope popup browser
Plug 'nvim-telescope/telescope.nvim'

" gruvbox font
Plug 'gruvbox-community/gruvbox'

" git wrapper
Plug 'tpope/vim-fugitive'

" Configuring language servers
Plug 'neovim/nvim-lspconfig'

" Install language servers with ease
Plug 'kabouzeid/nvim-lspinstall'

" provide popu definations and references
Plug 'glepnir/lspsaga.nvim'

" Auto-completion plugins
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'nvim-lua/completion-nvim'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" For luasnip users.
 Plug 'L3MON4D3/LuaSnip'
 Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
 Plug 'SirVer/ultisnips'
 Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
 Plug 'dcampos/nvim-snippy'
 Plug 'dcampos/cmp-snippy'

" Treesitter completion - dependent on nvim-completion
Plug 'nvim-treesitter/nvim-treesitter' , {'do':':TSUpdate'}
Plug 'nvim-treesitter/completion-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" NERD-Tree windows manager
Plug 'preservim/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'rafi/awesome-vim-colorschemes'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none
highlight ColorColumn ctermbg=0 guibg=grey

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <Tab> %
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<cr>
nnoremap K <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap gD <cmd>lua vim.lsp.buf.declaration()<cr>
nnoremap gr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <c-k> <cmd> lua vim.lsp.buf.signature_help()<cr>
nnoremap <leader>af <cmd> lua vim.lsp.buf.code_action()<cr>

lua require('rohitkaundal.telescope')
lua require('rohitkaundal.lsp')
lua require('rohitkaundal.lspsaga')
lua vim.opt.foldmethod = "expr"
lua vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
" Auto completion
imap <silent> <c-p> <Plug>(completion_trigger)
let g:completion_chain_complete_list = {
			\'default' : {
			\	'default' : [
			\		{'complete_items' : ['lsp', 'snippet']},
			\		{'mode' : 'file'}
			\	],
            \},
            \}

autocmd BufEnter * lua require('completion').on_attach()

lua require('rohitkaundal.cmp')
