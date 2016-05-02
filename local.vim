" Overide anything already set here.

if has('gui_running')
  if has('gui_macvim')
    " macvim only configs here

  else
    " gvim only configs here

  endif

  " gvim and macvim configs here

else
  " vim only configs here

endif

" vim, gvim and macvim configs here.
let g:without_python = 1

autocmd BufEnter *.md exe 'noremap <F5> :!/usr/bin/chromium-browser %:p<CR>'
