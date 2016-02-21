function! s:DetectK3rFile()
    if getline(1) =~ '^\d\{8}T\d\{6}\.\d\{6}\|'
         setfiletype k3r
         set syntax=k3r
    endif
endfunction

augroup filetypedetect
    au BufNewFile,BufRead *.log call s:DetectK3rFile()
augroup END

