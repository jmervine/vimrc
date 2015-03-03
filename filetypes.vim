" Custom File Type Actions

" Automatically detect file types.
" filetype plugin on
filetype plugin indent on

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!

  " Default - tab=(Space as 2xSpace) {
      " default
      autocmd FileType * set ai sw=2 sts=2 et
  " }

  " Wide - tab=(Space as 4xSpace) {
      " Splitting up by lang for readability.

      " javascript'y
      autocmd FileType javascript,json set ai sw=4 sts=4 et

      " python
      autocmd FileType python set ai sw=4 sts=4 et
      " python linters prefer lines to be short!
      autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
      autocmd FileType python match Excess /\%120v.*/
      autocmd FileType python set nowrap

      " markup(down)
      autocmd FileType html,xml,xsl,markdown set ai sw=4 sts=4 et

      " Golang
      autocmd FileType golang,go set ai sw=4 sts=4 et
      autocmd FileType golang,go set nolist
  " }

  " Tab - tab=(Tab as 4xSpace) {
    " make
    autocmd FileType make set ai sw=4 sts=4 ts=4 noexpandtab
  " }

  " Filetype Workarounds {
      " Temporary workaround to Better-CSS-Syntax-for-Vim
      " See https://github.com/ChrisYip/Better-CSS-Syntax-for-Vim/issues/9
      " for more information
      autocmd BufNewFile,BufRead *.scss set filetype=css
      autocmd BufNewFile,BufRead *.sass set filetype=css
  " }
augroup END
