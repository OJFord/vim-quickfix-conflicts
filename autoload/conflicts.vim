if !exists('&conflicts#grep_cmd')
    let conflicts#grep_cmd='rg --no-heading --line-number'
endif

if !exists('&conflicts#grep_cmd_fname_extract_fn')
    function conflicts#grep_cmd_fname_extract_fn(line)
        return split(a:line, ':')[0]
    endfunction
endif

if !exists('&conflicts#grep_cmd_lnum_extract_fn')
    function conflicts#grep_cmd_lnum_extract_fn(line)
        return split(a:line, ':')[1]
    endfunction
endif

function! conflicts#PopulateConflicts()
    let lines=split(system(g:conflicts#grep_cmd.' "<<<<<<< HEAD"'), '\n')
    call setqflist([])

    for line in lines
        let fname=conflicts#grep_cmd_fname_extract_fn(line)
        let lnum=conflicts#grep_cmd_lnum_extract_fn(line)

        exec 'badd +'.lnum.' '.fname
        let bufnr=bufnr(fname)

        call setqflist(getqflist() + [{'lnum': lnum, 'bufnr': bufnr, 'col': 1}])
    endfor

    return len(lines)
endfunction

function! conflicts#GotoNextConflict()
    if conflicts#PopulateConflicts()
        cnext
        normal zv
    else
        echo 'No conflicts!'
    endif
endfunction
