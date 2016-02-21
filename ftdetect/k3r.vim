
function! s:DetectK3rFile()
    if getline(1) =~ '^\d\{8}T\d\{6}\.\d\{6}\|'
        set filetype k3r
    endif
endfun

au BufNewFile,BufRead *.log call s:DetectK3rFile()
