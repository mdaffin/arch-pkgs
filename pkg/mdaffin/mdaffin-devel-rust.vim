autocmd BufReadPost *.rs setlocal filetype=rust

" rustup component add rls-preview rust-analysis rust-src
let g:LanguageClient_serverCommands.rust = ['rustup', 'run', 'stable', 'rls']

let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1
