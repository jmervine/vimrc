" Largly built from spf13-vim (http://spf13.com)
"
" Local - aka Overides{
"   loading before and after everything, hence this existing in two places
    if filereadable(expand("~/.vim/local.vim"))
      source ~/.vim/local.vim
    endif
" }

" Environment {
    " Basics {
        set nocompatible        " must be first line

        let g:spf13_no_autochdir = 1

        " Bundles {
        "   " Bundles include must be second!
            if filereadable(expand("~/.vim/bundles.vim"))
                source ~/.vim/bundles.vim
            endif
        " }

        " Immediately following Bundles include.
        filetype plugin indent on    " required

        let mapleader = '\'

        if has ("unix") && "Darwin" != system("echo -n \"$(uname)\"")
          " on Linux use + register for copy-paste
          set clipboard=unnamedplus
        else
          " one mac and windows, use * register for copy-paste
          set clipboard=unnamed
        endif
    " }
" }

" Includes {
    " Functions / Code {
        if filereadable(expand("~/.vim/functions.vim"))
            source ~/.vim/functions.vim
        endif
    " }

    " Custom Bindings {
        if filereadable(expand("~/.vim/bindings.vim"))
            source ~/.vim/bindings.vim
        endif
    " }

    " Custom File Type Actions {
        if filereadable(expand("~/.vim/filetypes.vim"))
            source ~/.vim/filetypes.vim
        endif
    " }
" }

" General {
    " Display {
        " Assume a dark background
        set background=dark

        syntax on " syntax highlighting

        " Theme {
            " color scheme
            " see: http://vimcolorschemetest.googlecode.com/svn/html/index-java.html
            if has('gui_running')
                "colorscheme solarized
                "colorscheme atom
                colorscheme 1989
            else
                colorscheme default
            endif
        " }

        " disable autofolding
        set nofoldenable
        silent! set colorcolumn=80 " ignore on error
        set tabpagemax=15               " only show 15 tabs
        set showmode                    " display the current mode
        set cursorline                  " highlight current line

        if has('cmdline_info')
            set ruler                   " show the ruler
            set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
            set showcmd                 " show partial commands in status line and
                                        " selected characters/lines in visual mode
        endif

        if has('statusline')
            set laststatus=2

            " Broken down into easily includeable segments
            set statusline=%<%f\    " Filename
            set statusline+=%w%h%m%r " Options
            "set statusline+=%{fugitive#statusline()} "  Git Hotness
            set statusline+=\ [%{&ff}/%Y]            " filetype
            set statusline+=\ [%{getcwd()}]          " current dir
            set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
        endif

        set backspace=indent,eol,start  " backspace for dummies
        set linespace=0                 " No extra spaces between rows
        set nu                          " Line numbers on
        set showmatch                   " show matching brackets/parenthesis
        set incsearch                   " find as you type search
        set hlsearch                    " highlight search terms
        set winminheight=0              " windows can be 0 line high
        set ignorecase                  " case insensitive search
        set smartcase                   " case sensitive when uc present
        set wildmenu                    " show list instead of just completing
        set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
        set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
        set scrolljump=5                " lines to scroll when cursor leaves screen
        set scrolloff=3                 " minimum lines to keep above and below cursor
        set list
        set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

        if has('gui_running')
          " gvim and macvim configs here
          set shell=bash
          set guioptions-=T

          " Sets height to be higher then max window with, will auto adjust
          set lines=100
          set columns=200

          " Set no wrap
          set nowrap

          " change cul color
          hi CursorLine guibg=#000000

          " enable mouse
          set mouse=a

          if has('gui_macvim')
            " macvim only configs here
            set clipboard=unnamed
            set transparency=0
            set guifont=Menlo\ Regular:h15

            " vim-gist
            let g:gist_clip_command = 'pbcopy'

          else
            " gvim only configs here

            set guifont=Monospace\ 11
          endif

        endif

    " }

    " Formatting {
        set nowrap                      " wrap long lines
        set autoindent                  " indent at the same level of the previous line
        set shiftwidth=4                " use indents of 4 spaces
        set expandtab                   " tabs are spaces, not tabs
        set tabstop=4                   " an indentation every four columns
        set softtabstop=4               " let backspace delete indent

        " Whitspace {
            "highlight ExtraWhitespace ctermbg=red guibg=red
            "autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
            "match ExtraWhitespace /\s\+\%#\@<!$/

            " See functions.vim for Striptrailingwhitespace definition.
            autocmd BufWritePre * call StripTrailingWhitespace()
            autocmd FileType jade let b:noStripWhitespace=1
            autocmd FileType pug let b:noStripWhitespace=1
            autocmd FileType vim let b:noStripWhitespace=1
            autocmd FileType yaml let b:noStripWhitespace=1
            autocmd FileType sls let b:noStripWhitespace=1
        " }
    " }

    " turn off autochdir
    set noautochdir

    " turn off spell checking by default
    set nospell

    " turn off backups
    set nobackup

    " Make arrow and other keys work
    " if !has('gui')
    "     set term=$TERM
    " endif

    scriptencoding utf-8

    " Uncomment to enable auto 'chdir' on file on via NERDTree
    "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

    " Uncomment to anable auto write when leaving a modified buffer
    "set autowrite

    set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
    set virtualedit=onemore         " allow for cursor beyond last character
    set history=1000                " Store a ton of history (default is 20)
    set hidden                      " allow buffer switching without saving

    if has('persistent_undo')
        set undofile                "so is persistent undo ...
        set undolevels=1000         "maximum number of changes that can be undone
        set undoreload=10000        "maximum number lines to save for undo on a buffer reload
    endif

    " Could use * rather than *.*, but I prefer to leave .files unsaved
    au BufWinLeave *.* silent! mkview   "make vim save view (state) (folds, cursor, etc)
    au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)
" }

" Local - aka Overides{
    if filereadable(expand("~/.vim/local.vim"))
        let g:local_after = 1
        source ~/.vim/local.vim
    endif
" }

