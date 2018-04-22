# nvim-py-minimal
a simple and minimalistic python pugin for neovim

## Prerequisites
* neovim
* ipdb (install for example by pip install ipdb)
* yapf
* async (later on neomake)

## Commands
* ReplSendPyLine
* ReplSendPyFile
* ReplSendPySelecton
* ReplSendPy2IPy
* Yapf (yapf required - python package)
* ClearBps
* PyRun (Async required - vim package)
* IPython2
* Ipython3
* IPdb / Debug
* CloseBuf

## Key maps
There are no default keys. Put the following or similar to your init.vim.

> * (terminal) gd: \<Plug\>GoToDebugLine
> * (normal) \<leader\>bp: \<Plug\>SetBreakPoint
> * (normal) \<leader\>Bp: \<Plug\>SetBreakPointBelow
> * (normal) \<c-s\>: \<Plug\>PySendLine2Repl
> * (visual) \<c-s\>: \<Plug\>PySendSelection2Repl
> * (normal) \<c-s\>\<c-s\>: \<Plug\>PySendFile2Repl
> * \<F5\>: \<Plug\>Ipdb

```viml
au FileType python map  <leader>bp <Plug>SetBreakPoint
au FileType python map  <leader>Bp <Plug>SetBreakPointBelow
nnoremap <leader>bd :call nvimipdb#DelBreakPoints() " DelBreakPoints
au TermOpen * nmap <buffer> gd <Plug>GoToDebugLine
au FileType python map <F5> <Plug>Ipdb
autocmd Filetype python nmap <silent> <c-s> "+yy :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
autocmd Filetype python vmap <silent> <c-s> "+y :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
autocmd Filetype python nnoremap <silent> <c-s><c-s> :%y+<cr> :call nvimipdb#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
```

## Variables
* let g:nvimipdb_default_keys = 1
* let g:py_style_pep8 = "'{based_on_style: pep8, spaces_before_comment: 4, split_before_logical_operator: true, indent_width: 4}'"
* setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ] (used for PyRun)


## To Do's / To come

