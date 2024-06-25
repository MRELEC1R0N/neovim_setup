set number
set nocompatible
filetype off

let mapleader = "," 




call plug#begin('~/.config/nvim/plugged')

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'olimorris/onedarkpro.nvim'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'lewis6991/gitsigns.nvim'
call plug#end()


nnoremap <silent> <S-Enter> :<C-u>normal! ft<CR>


lua require('gitsigns').setup()
"Color theme "
colorscheme onedark

"Ale setup"
let g:ale_linters = {
\ 'python': { 'executable': '/home/mrelectron/.local/pyright', 'args': ['--lsp'] },
\ 'cpp': { 'executable': '/usr/bin/clang', 'args': ['-Wall', '-Wextra'] }
\}

let g:ale_lint_on_enter = 1


"Nerd Tree setup"
nnoremap <C-b> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Airline setup"

let g:airline_themes = 'darcula' " Choose your preferred theme
let g:airline_powerline_fonts = 1   " Enable powerline symbols (optional)


"Terminal Setup"
nnoremap <silent> <C-j> :term<CR>

"toggletermsetup"

lua << EOF
require("toggleterm").setup {
  open_mapping = {"<C-j>"},  -- Open terminal with Ctrl+j
  side = {
    direction = "bottom",
    persistent = true,
  },
  width = 0.3,  -- Approximate width (optional)
  transparency = 0.3,  -- Transparency (optional)
}

require('telescope').setup {
  mappings = {
    -- File browser (similar to VSCode's "Go to File" functionality)
    finder = { key = '<leader>ff' },
    -- Buffer navigation (similar to VSCode's "Go to Buffer" functionality)
    buffers = { key = '<leader>bb' },
    -- Quickfix list (similar to VSCode's integrated terminal error messages)
    quickfix = { key = '<leader>qf' },
  },
}

EOF
