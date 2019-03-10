" Required for operations modifying multiple buffers like rename.
set hidden

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set wildmenu
set wildmode=longest:full,full
set spelllang=en_gb

" Working with buffers
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader><Right> :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader><Left> :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

" ALE
let g:ale_completion_enabled = 1
let g:ale_linters = {}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1

nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>
