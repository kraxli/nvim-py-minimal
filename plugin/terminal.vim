

command! OpenDebugFile :call minpy#OpenDebugFile()
command! OpenLeftDebugFile :call minpy#OpenLeftDebugFile()

augroup minpyTerminal
    au!
    au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
augroup END
