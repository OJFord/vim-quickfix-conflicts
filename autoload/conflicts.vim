function! conflicts#PopulateConflicts()
    let lines=split(system('git --no-pager diff --no-color --check --relative'), '\n')
    call setqflist([])

    for line in lines
        let fname=split(line, ':')[0]
        let lnum=split(line, ':')[1]
        if split(system('head -n'.lnum.' '.fname.' | tail -n1'))[0] != '<<<<<<<'
            continue
        endif

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
