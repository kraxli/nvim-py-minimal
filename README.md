# nvimipdb
a simple and minimalistic ipython (ipdb debugger) interface for neovim

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

## Default Key maps
* (terminal) gt: \<Plug\>GoToDebugLine
* (normal) \<leader\>bp: \<Plug\>SetBreakPoint
* (normal) \<leader\>Bp: \<Plug\>SetBreakPointBelow
* (normal) \<c-s\>: \<Plug\>PySendLine2Repl
* (visual) \<c-s\>: \<Plug\>PySendSelection2Repl
* (normal) \<c-s\>\<c-s\>: \<Plug\>PySendFile2Repl
* \<F5\>: \<Plug\>Ipdb

## Variables
* let g:nvimipdb_default_keys = 1
* let g:py_style_pep8 = "'{based_on_style: pep8, spaces_before_comment: 4, split_before_logical_operator: true, indent_width: 4}'"
* setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ] (used for PyRun)


## To Do's / To come

