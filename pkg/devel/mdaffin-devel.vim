" Required for operations modifying multiple buffers like rename.
set hidden

autocmd BufReadPost *.rs setlocal filetype=rust

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
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
let g:rustfmt_fail_silently=1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
