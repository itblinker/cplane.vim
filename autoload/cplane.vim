function cplane#CompileTestcase()
    let l:splittedCurrentLine = split(getline('.'))

    if(len(l:splittedCurrentLine) >= 2)
        if(l:splittedCurrentLine[0] == 'testcase')
            echomsg 'yeah its testcase: '.cplane#StripBracesFromCursorWord(l:splittedCurrentLine[1])
            echomsg cplane#GetBin()
        else
            call cplane#InfoAboutNotValidLine()
        endif
    else
        call cplane#InfoAboutNotValidLine()
    endif
endfunction

function cplane#GetBin()
    return getcwd().g:cplane_local_sct_script_relative_top_path.cplane#GetLocalScriptName()
endfunction

function cplane#GetLocalScriptName()
    let l:splittedPath = maktaba#path#Split(expand('%:p:h'))
    for l:item in g:cplane_component_database
        if(index(l:splittedPath, l:item.sct_top_dir) >= 0)
            return l:item.sct_script
        endif
    endfor
endfunction

function cplane#InfoAboutNotValidLine()
    echomsg 'TTCN Compilation cann''t be started - move cursor on testcase name'
endfunction

function cplane#StripBracesFromCursorWord(p_name)
    return strpart(a:p_name, 0, len(a:p_name) - 2)
endfunction
