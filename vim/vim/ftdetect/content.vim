function! IsFileTypeShell()
   if getline(1) =~ '##shellscript'
     setfiletype sh
   endif
endfunction

augroup filetypedetect
  au BufRead,BufNewFile * call IsFileTypeShell()
augroup END
