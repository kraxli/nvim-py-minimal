

command! OpenDebugFile :call nvimipdb#OpenDebugFile()
command! OpenLeftDebugFile :call nvimipdb#OpenLeftDebugFile()

augroup nvimipdbTerminal
    au!
    au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
augroup END
