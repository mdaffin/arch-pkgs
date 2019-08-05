" To install the rls run `rustup component add rls-preview rust-analysis rust-src`
let g:ale_rust_rls_executable = 'rls'
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_linters['rust'] = ['rls']
let g:ale_fixers['rust'] = ['rustfmt']
