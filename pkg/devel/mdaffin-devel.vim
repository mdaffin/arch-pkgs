" Required for operations modifying multiple buffers like rename.
set hidden

autocmd BufReadPost *.rs setlocal filetype=rust

" rustup component add rls-preview rust-analysis rust-src
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'go': ['go-langserver'] }
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

set expandtab
set shiftwidth=4
set softtabstop=4

set clipboard=unnamedplus
set wildmenu
set wildmode=longest:full,full
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1

noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>
