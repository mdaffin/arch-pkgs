" Required for operations modifying multiple buffers like rename.
set hidden

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set wildmenu
set wildmode=longest:full,full
set spelllang=en_gb

let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {}

noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>

" Working with buffers
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader><Right> :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader><Left> :bnext<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
