
let g:py_style_pep8 = "'{based_on_style: pep8, spaces_before_comment: 4, split_before_logical_operator: true, indent_width: 4}'"


" COMMANDS:
command! ReplSendPyLine call nvimipdb#send2repl([getline('.')])
command! -range=% ReplSendPyFile silent call nvimipdb#send2repl(getline(<line1>,<line2>))
command! -range ReplSendPySelection silent call nvimipdb#send2repl(getline(<line1>,<line2>))
" send visual selection to ipython terminal:
command! -range ReplSendPy2IPy silent call nvimipdb#send2repl(["\%paste"])

command!  -range=%  Yapf <line1>,<line2>call yapf#yapf(g:py_style_pep8)
" map <C-Y> :call yapf#YAPF()<cr>
" imap <C-Y> <c-o>:call yapf#YAPF()<cr>

" autocmd! BufNewFile,BufRead *.py,*.python :command! -nargs=1 InclBp  :call InclBreakPoint(<f-args>)<cr>
command! ClearBps :call nvimipdb#ClearBpsFct()<cr>

" the follwoing errorformat works for AsyncRun python %:p
setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]
command! PyRun AsyncRun python3 %:p
" setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m


augroup nvimipdbGroup
    autocmd BufRead,BufEnter,BufNewFile *.py,*.python :command! IPython2 
      \ :vsp term://ipython | let g:last_ipy_terminal_job_id = b:terminal_job_id
    autocmd BufRead,BufEnter,BufNewFile *.py,*.python :command! IPython3 
      \ :vsp term://ipython3 | let g:last_ipy_terminal_job_id = b:terminal_job_id
augroup END


" command! Ipdb :vsp term://python3 expand("%:p")
command! Ipdb
    \ :let current_file = expand("%:p")
    \ | vsp +term
    \ | silent call nvimipdb#send2repl(["python3 ".current_file])
    " \ | let g:last_ipy_terminal_job_id = b:terminal_job_id
    " \ | let g:last_ipdb_terminal_job_id = b:terminal_job_id

command! Debug :Ipdb
command! CloseBuf :bd!




