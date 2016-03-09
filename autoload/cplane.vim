function cplane#CompileTestcase()
    let l:splittedCurrentLine = split(getline('.'))

    if(len(l:splittedCurrentLine) >= 2)
        if(l:splittedCurrentLine[0] == 'testcase')

            echomsg 'compilation: '.cplane#GetCompilationCommand()
            echomsg 'run: '.cplane#GetRunCommand()
        else
            call cplane#InfoAboutNotValidLine()
        endif
    else
        call cplane#InfoAboutNotValidLine()
    endif
endfunction

function cplane#GetTestCaseName()
    return expand('<cword>')
endfunction

function cplane#GetTtcnBin()
    return getcwd().g:cplane_local_sct_script_relative_top_path.cplane#GetComponentSpecificScriptName()
endfunction

function cplane#GetLogsDir()
    return getcwd().'/logs/SCTs/'.g:cplane_sct_current_variant
endfunction

function cplane#GetTestCaseLogsDir()
    return cplane#GetLogsDir.'/'.cplane#GetTestCaseName()
endfunction

function cplane#GetComponentSpecificScriptName()
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

function cplane#GetCompilationCommand()
    return 'Dispatch '.cplane#GetTtcnBin().' -tcs '.cplane#GetTestCaseName().' -basket ALL -k3conly -variant '.g:cplane_sct_current_variant
endfunction

function cplane#GetRunCommand()
    return 'Dispatch '.cplane#GetTtcnBin().' -tcs '.cplane#GetTestCaseName().' -basket ALL -keeplogs -keepk3log -variant '.g:cplane_sct_current_variant.' -logdir '.cplane#GetLogsDir()
endfunction

function cplane#CompileLastTestCase()
    if(len(g:cplane_last_compilation_command))
        execute g:cplane_last_compilation_command
    else
        echomsg 'there isn''t any valid last compilation command'
    endif
endfunction

function cplane#RunLastTestCase()
    if(len(g:cplane_last_run_command))
        execute g:cplane_last_run_command
    else
        echomsg 'there isn''t any valid last run command'
    endif
endfunction

function cplane#CheckCommand()
    try
        call maktaba#error#TryCommand('echomsg ''msg''', ['WrongType'])
    catch
        echomsg 'non try'
    endtry
endfunction
