" epita-cpp.vim
" Configuration for EPITA C++ coding style

function Epita_cpp_insert_guards()
    let basename=substitute(@%, "[^/]*/", "", "g")
    let underscored=substitute(basename, "[^a-zA-Z_]", "_", "g")
    let const=substitute(underscored, ".*", "\\U\\0", "")."_"
    exe "normal i#ifndef ".const."\n\e"
    exe "normal i# define ".const."\n\n\n\n\e"
    exe "normal i#endif // !".const."\e"
    exe "normal 4G"
endfunction

au Bufnewfile,Bufread *.hh set ft=cpp
au Bufnewfile *.hh call Epita_cpp_insert_guards()
