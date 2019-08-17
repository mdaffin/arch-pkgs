" Rust
" To install the rls run `rustup component add rls rust-analysis rust-src`
let g:ale_rust_rls_executable = 'rls'
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_linters['rust'] = ['rls']
let g:ale_fixers['rust'] = ['rustfmt']

" Go
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:ale_fixers['go'] = ['golangserver']

" Python
let g:ale_linters['python'] = ['flake8', 'pylint', 'pycodestyle']
let g:ale_fixers['python'] = ['black']

" Web
let g:ale_linters['typescript'] = ['tsserver']
let g:ale_linters['vue'] = ['vls']
let g:ale_linters['markdown'] = ['vale']
let g:ale_linters['json'] = ['jsonlint']
let g:ale_linters['yaml'] = ['yamllint']

let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']
let g:ale_fixers['html'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['vue'] = ['prettier']
let g:ale_fixers['markdown'] = ['prettier']
let g:ale_fixers['graphql'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['yaml'] = ['prettier']
let g:ale_fixers['less'] = ['prettier']

" Do not lint or fix minified files.
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}
" If you configure g:ale_pattern_options outside of vimrc, you need this.
let g:ale_pattern_options_enabled = 1
