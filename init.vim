set ru
set number
set syntax
set hidden
set ruler
set wildmenu
set mouse=a
set tabstop=2
set expandtab
set smarttab
set splitright
set splitbelow
set autoindent
set shiftwidth=2
set encoding=utf-8
set relativenumber
set clipboard=unnamedplus

syntax enable

let mapleader=','

if &compatible
  set nocompatible
endif

" Plugins
call plug#begin()

" Themes
Plug 'morhetz/gruvbox' "https://github.com/morhetz/gruvbox
Plug 'folke/tokyonight.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'rose-pine/neovim'
"
Plug 'APZelos/blamer.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'ryanoasis/vim-devicons'
Plug 'onsails/lspkind-nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvimdev/guard.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'kylechui/nvim-surround'
Plug 'nvim-lua/popup.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/which-key.nvim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'rgroli/other.nvim'
Plug 'otavioschwanck/ruby-toolkit.nvim'
Plug 'otavioschwanck/telescope-alternate'
Plug 'farmergreg/vim-lastplace'
Plug 'ray-x/lsp_signature.nvim'
Plug 'alvan/vim-closetag'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-buftabline'
Plug 'rafamadriz/friendly-snippets'
Plug 'mrjones2014/dash.nvim', { 'do': 'make install' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'stevearc/dressing.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'weizheheng/ror.nvim'
Plug 'kdheepak/lazygit.nvim'
Plug 'mfussenegger/nvim-lint'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'Shatur/neovim-ayu'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

call plug#end()
" End of plugins

set termguicolors
set background=dark
colorscheme rose-pine

" Git Blame
let g:blamer_enabled = 1
let g:blamer_delay = 1500
let g:blamer_show_in_insert_modes = 0
let g:blamer_show_in_visual_modes = 0

nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>fix :RuboCop<CR>

" copy relative path of current file
nnoremap <leader>cp :let @*=expand('%')<CR>

" Navegação
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
nnoremap <leader>q :bd<cr>

nnoremap <leader>git <cmd>LazyGit<cr>

noremap <leader>sh :split term://zsh<cr>

" Editar configuração do NeoVim
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim <cr>

nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>doc <cmd>DashWord<cr>

so ~/.config/nvim/plug_config.vim

" NOTE: You can use other key to expand snippet.

" Expand
imap <expr> <C-l>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-l>'
smap <expr> <C-l>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-l>'

" Expand or jump
imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>'
smap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'


" Start interactive EasyAlign in visual mode (e.g. vipga)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

nnoremap <leader>goto <cmd>Telescope telescope-alternate alternate_file<cr>

autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

" rails test
nnoremap <leader>rl <cmd>RorTestRun Line<cr>
nnoremap <leader>rf <cmd>RorTestRun<cr>

