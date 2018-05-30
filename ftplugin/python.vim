
let g:minpy_style_pep8 = "'{based_on_style: pep8, spaces_before_comment: 4, split_before_logical_operator: true, indent_width: 4}'"


if !exists("g:minpy_color_column")
  let g:minpy_color_column = 1
endif

if g:minpy_color_column!=0 || g:minpy_color_column!=""
  set colorcolumn=+1        " highlight column after 'textwidth'
  " set colorcolumn=+1,+2,+3  " highlight three columns after 'textwidth'
  highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
  " set colorcolumn=g:minpy_color_column
endif
