filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins {
    " Deps
        " let Vundle manage Vundle, required
        Plugin 'gmarik/Vundle.vim'
        "Plugin 'MarcWeber/vim-addon-mw-utils'
        "Plugin 'tomtom/tlib_vim'

        if executable('ack-grep')
            let g:ackprg="ack-grep -H --nocolor --nogroup --column"
            Plugin 'mileszs/ack.vim'
        elseif executable('ack')
            Plugin 'mileszs/ack.vim'
        endif

    " General Tools
        Plugin 'vim-scripts/sudo.vim'
        Plugin 'spf13/vim-colors'
        Plugin 'matchit.zip'
        Plugin 'flazz/vim-colorschemes'
        Plugin 'bling/vim-airline'

    " General Development
        Plugin 'scrooloose/syntastic'     " Syntax checking / error highlighting.
        Plugin 'scrooloose/nerdcommenter' " We love simple commenting.
        Plugin 'godlygeek/tabular'        " We love simple tabbing.

    " Navigation
        Plugin 'scrooloose/nerdtree'
        Plugin 'corntrace/bufexplorer'
        Plugin 'kien/ctrlp.vim'

    " Git / Gist
        Plugin 'tpope/vim-fugitive'

        Plugin 'mattn/webapi-vim' " 'gist-vim' dep
        Plugin 'mattn/gist-vim'

    " Ansible
        Plugin 'chase/vim-ansible-yaml'

    " Scala
        Plugin 'derekwyatt/vim-scala'

    " Python
        Plugin 'klen/python-mode'

        " Overide 'python-mode' autocomplete
        Plugin 'davidhalter/jedi-vim'

    " Ruby
        Plugin 'sunaku/vim-ruby-minitest'
        Plugin 'tpope/vim-haml'

    " Nginx
        Plugin 'evanmiller/nginx-vim-syntax'

    " Javascript / etc.
        Plugin 'kchmck/vim-coffee-script'
        Plugin 'digitaltoad/vim-jade'
        Plugin 'leshill/vim-json'
        Plugin 'groenewege/vim-less'
        Plugin 'pangloss/vim-javascript'
        Plugin 'briancollins/vim-jst'

    " Markup(down)
        Plugin 'ChrisYip/Better-CSS-Syntax-for-Vim'
        Plugin 'tpope/vim-markdown'

    " PHP
        Plugin 'spf13/PIV'

    " Docker
        Plugin 'ekalinin/Dockerfile.vim'

    " Golang
        Plugin 'nsf/gocode', {'rtp': 'vim/'}
        Plugin 'fatih/vim-go'
" }
call vundle#end()

" Configuration {

    " nerdtree {
        nm <C-N> :NERDTreeToggle<CR>
        map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>
        map <leader>bm :Bookmark<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=0
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
        let g:NERDShutUp=1

        if v:version < 730
            let g:NERDTreeDirArrows=0
        endif
    " }

    " Buffer Explorer {
        nm <C-E> :BufExplorer<CR>
        nmap <leader>b :BufExplorer<CR>
    " }

    " Fugitive {
        nnoremap <silent> <leader>gc :Gcommit -a<CR>
        nnoremap <silent> <leader>gu :Git push<CR>
        nnoremap <silent> <leader>gp :Git pull<CR>
        nnoremap <silent> <leader>gs :Git status<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
    " }

    " Tabularize {
        nmap <Leader>a= :Tabularize /=<CR>
        vmap <Leader>a= :Tabularize /=<CR>
        nmap <Leader>a: :Tabularize /:<CR>
        vmap <Leader>a: :Tabularize /:<CR>
        nmap <Leader>a:: :Tabularize /:\zs<CR>
        vmap <Leader>a:: :Tabularize /:\zs<CR>
        nmap <Leader>a, :Tabularize /,<CR>
        vmap <Leader>a, :Tabularize /,<CR>
        nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    " }

    " vim-gist {
        let g:gist_show_privates = 1
        let g:gist_detect_filetype = 1
        let g:gist_get_multiplefile = 1
    " }

    " JSON {
        nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
    " }

    " PyMode {
        let g:pymode_lint_checker = "pyflakes"
    " }

    " ctrlp {
        let g:ctrlp_working_path_mode = 2
        nnoremap <silent> <D-t> :CtrlP<CR>
        nnoremap <silent> <D-r> :CtrlPMRU<CR>
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$' }
    "}


    " airline {
        let g:airline_theme='dark'
        "let g:airline_left_sep = ''
        "let g:airline_left_alt_sep = ''
        let g:airline_section_b = '%{getcwd()}'
        let g:airline_section_c = '%t'
        "let g:airline_right_sep = ''
        "let g:airline_right_alt_sep = ''
        "let g:airline_fugitive_prefix = ' '
        "let g:airline_readonly_symbol = ''
        "let g:airline_linecolumn_prefix = ' '
        let g:airline_section_b = '%{getcwd()}'
        let g:airline_section_c = '%t'
        set ambiwidth=double
        set noshowmode
        set laststatus=2
    " }

    " python-mode {
        let g:pymode_rope = 0

        " Documentation
        let g:pymode_doc = 1
        let g:pymode_doc_key = 'K'

        "Linting
        let g:pymode_lint = 1
        let g:pymode_lint_checkers = ["pep8","pyflakes"]

        " Auto check on save
        let g:pymode_lint_write = 1

        " Support virtualenv
        let g:pymode_virtualenv = 0

        " Enable breakpoints plugin
        let g:pymode_breakpoint = 1
        let g:pymode_breakpoint_bind = '<leader>b'

        " syntax highlighting
        let g:pymode_syntax = 1
        let g:pymode_syntax_all = 1
        let g:pymode_syntax_indent_errors = g:pymode_syntax_all
        let g:pymode_syntax_space_errors = g:pymode_syntax_all

        " Don't autofold code
        let g:pymode_folding = 0
    " }

    " PIV {
        let g:DisableAutoPHPFolding = 0
        let g:PIVAutoClose = 0
    " }

    " Misc {
        let g:NERDShutUp=1
        let b:match_ignorecase = 1
    " }

    " CtrlP {
        set wildignore+=*/tmp/*,*.so,*.swp,*.zip,=*,~=*     " MacOSX/Linux
        let g:ctrlp_custom_ignore = {
          \ 'dir':  '\v[\/]\.(git|hg|svn)$',
          \ 'file': '\v\.(exe|so|dll)$',
          \ 'link': 'some_bad_symbolic_links',
          \ }

        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cmd = 'CtrlP'
        let g:ctrlp_working_path_mode = 'a'
    " }

" }

