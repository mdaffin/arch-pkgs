" Required for operations modifying multiple buffers like rename.
set hidden

set expandtab
"TODO set these per filetype
"set shiftwidth=2
"set tabstop=2
"set softtabstop=2

set wildmenu
set wildmode=longest:full,full
set spelllang=en_gb

let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {}

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>

" Working with buffers
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader><Right> :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader><Left> :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
