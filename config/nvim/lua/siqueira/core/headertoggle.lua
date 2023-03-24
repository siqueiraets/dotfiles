vim.cmd([[
" Toggle between header and source files
function! HeaderToggle()
let file_path = expand("%")
let file_name = expand("%<")
let extension = split(file_path, '\.')[-1]

if extension == "cpp" || extension == "c"
    let next_file = substitute(join([file_name, ".h"], ""), "src/", "include/", "")
    let next_file2 = substitute(join([file_name, ".h"], ""), "src/", "inc/", "")
    let next_file3 = join([file_name, ".h"], "")

    if filereadable(next_file)
        :execute 'edit ' next_file
    elseif filereadable(next_file2)
        :execute 'edit ' next_file2
    elseif filereadable(next_file3)
        :execute 'edit ' next_file3
    else
        :Ouroboros
    endif
elseif extension == "h"
    let next_file = join([file_name, ".cpp"], "")
    let next_file2 = join([file_name, ".c"], "")
    let next_file3 = substitute(join([file_name, ".cpp"], ""), "include/", "src/", "")
    let next_file4 = substitute(join([file_name, ".c"], ""), "include/", "src/", "")
    let next_file5 = substitute(join([file_name, ".cpp"], ""), "inc/", "src/", "")
    let next_file6 = substitute(join([file_name, ".c"], ""), "inc/", "src/", "")

    if filereadable(next_file)
        :execute 'edit ' next_file
    elseif filereadable(next_file2)
        :execute 'edit ' next_file2
    elseif filereadable(next_file3)
        :execute 'edit ' next_file3
    elseif filereadable(next_file4)
        :execute 'edit ' next_file4
    elseif filereadable(next_file5)
        :execute 'edit ' next_file5
    elseif filereadable(next_file6)
        :execute 'edit ' next_file6
    else
        :Ouroboros
    endif
endif
endfunction
]])
