packadd dracula
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula

packadd lsp-status.nvim
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif
  return ''
endfunction

set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline+=\ %{LspStatus()}`

packadd completion-nvim
let g:completion_confirm_key = "\<C-y>"
set completeopt=menuone,noinsert,noselect
set shortmess+=c
let g:completion_enable_snippet = 'UltiSnips'

packadd lsp_extensions.nvim
packadd nvim-lspconfig
lua require("lsp")

packadd fzf.vim

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set wildmode=longest:full,full
set wildignorecase
set virtualedit=block
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·,nbsp:·
set colorcolumn=+1
set number
set nocursorcolumn
set lazyredraw
set splitbelow
set splitright
autocmd FileType help wincmd L

set hidden
set mouse=a

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :Rg<CR>
vnoremap <silent> <C-c> "+y
inoremap <silent> <C-v> <ESC>"+pa

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)

set updatetime=500
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
set signcolumn=yes
