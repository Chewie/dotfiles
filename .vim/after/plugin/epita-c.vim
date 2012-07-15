" epita-c.vim
" Configuration for EPITA C coding style
"
" After rationale: some options are reset by the C ftplugin

function Epita_c_config()
    let c_comment_strings = 0

    set noet
    set ts=8
    set sts=8
    set sw=2

    " comments format
    setlocal comments=sl:/*,mb:**,elx:*/
endfunction

au FileType c call Epita_c_config()
