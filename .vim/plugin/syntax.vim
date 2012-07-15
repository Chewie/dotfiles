" syntax.vim
" Sets syntax highlighting parameters if available.

if has('syntax')
    syntax on
    set background=dark

    colorscheme evening

    " Python specific options
    let python_highlight_builtins = 1
    let python_highlight_exceptions = 1
    let python_highlight_space_errors = 1
endif
