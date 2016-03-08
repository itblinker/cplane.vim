

function cplane#CompileTestcase()
    echomsg 'compilation call index'
    echomsg cplane#GetComponentName()
endfunction

function cplane#GetComponentName()
    let l:splittedPath = maktaba#path#Split(expand('%:p:h'))
    echo l:splittedPath
    echo string(g:cplane_component_database)

    for item in g:cplane_component_database
        if(index(l:splittedPath, item.sct_top_dir) >= 0)
            return item.name
        endif
    endfor
endfunction
