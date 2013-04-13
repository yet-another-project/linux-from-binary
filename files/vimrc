""" Introduction {{{
""" Please read carefully
"""
""" A .vimrc is something extremely personal. There is no 'well-written' .vimrc.
""" There are only well-written ones for a particular person.
""" The aim of this .vimrc is not primarily to be used as-is, but instead to
""" provide you with a good starting point for documenting yourself about vim.
""" Let me emphasize the implications of the previous sentence: You MUST read
""" this file line-by-line, and type in `:help <keyword>` for each of them, and
""" learn from the documentation what it does.
""" These settings are good settings for beginner to intermediate vimmers, so
""" stick with them until you're confident in your usage with vim.
"""
""" Getting confident
""" -----------------
""" Vim is not your usual text editor, it's extremely powerful. But for this
""" power to be unleashed to you, you have to invest some time in it, depending
""" on your already existing vim skills.
""" You should first be able to touch type properly. If you're looking at the
""" keyboard to locate the symbol you want to type, then you're not ready for
""" being an average vimmer. Look on the web for 'touch typing for programmers'.
"""
""" The next step consists of getting fluent at using the most common features:
""" text-objects, cursor-motions, folds, marks, buffers, windows.
""" Just type in `:help ` along with one of the keywords above, and read the
""" help throughly.
"""
""" While you're doing this reading on a daily basis, for a few weeks, start
""" to observ inefficiencies in your editing habits, and try to find shortcuts
""" for them. Usually, there are more ways of doing the same thing, but there
""" are a few which may lead to less finger movement.
""" A good way of finding shortcuts to such inefficiencies is to hang on IRC,
""" on the #vim channel on freenode. You can learn a lot even by listening to
""" other people's problems, or you can ask yourself.
"""
""" Whatever you do, until you are (very) good at the features mentioned above,
""" DO NOT alter this .vimrc. Stick with it for a while, DO NOT install scripts,
""" plugins, bundles, or whatever.
""" Usually, this takes at least 2 months, if done properly, consciously, at
""" least 60 minutes a day.
"""
""" Once you're there, I would say you're at an intermediate level. Feel free
""" to follow the steps in the 'Bundles' section below.
"""
""" Happy vimming!
""" }}}
" Bootstrap {{{
    function! SourceVimDirectory(path)
        let l:dir = $HOME . '/.vim/' . a:path
        if isdirectory(l:dir)
            for myf in split(glob(l:dir . '/*.vim'), '\n')
                let l:cmd = 'source ' . fnameescape(myf)
                execute l:cmd
            endfor
        endif
    endfunction
" }}}
" Environment {{{
    call SourceVimDirectory('vimrc/environment-pre')
    set nocompatible
    scriptencoding utf-8
    set termencoding=utf-8
    set encoding=utf-8
    set autochdir
    set shell=/bin/zsh
    " Directories {
        let s:localscriptsdir = expand($HOME . '/.vim')
        silent execute '!mkdir -p ' . s:localscriptsdir . '/tmp/{backup,swap,view,undo}'
        set backupdir=$HOME/.vim/tmp/backup/
        set backup
        set directory=$HOME/.vim/tmp/swap/
        set viewdir=$HOME/.vim/tmp/view/
        set undodir=$HOME/.vim/tmp/undo/
        " store undo files, undo edits after deleting a buffer
        set undofile
        set viminfo='50,n$HOME/.vim/tmp/viminfo
    " }
    " For a more responsive TrapMovementKeys (see below) - learn proper vim
    " Also for Bundle vim-showmarks
    set updatetime=500
    call SourceVimDirectory('vimrc/environment-post')
" }}}
" Bundles {{{
    if isdirectory(expand($HOME . '/.vim/bundle/vundle'))
        call SourceVimDirectory('vimrc/bundles-pre')
        filetype off
        set runtimepath+=$HOME/.vim/bundle/vundle
        call vundle#rc()
        Bundle 'gmarik/vundle'
        if filereadable($HOME . '/.vim/bundles.vim')
            source expand($HOME . '/.vim/bundles.vim')
        endif
        filetype plugin indent on
        call SourceVimDirectory('vimrc/bundles-post')
    endif
" }}}
" vimrc/Editing {{{
    call SourceVimDirectory('vimrc/editing-pre')
    set tabstop=8
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set autoindent
    set fileencodings=utf-8
    set nojoinspaces
    call SourceVimDirectory('vimrc/editing-post')
" }}}
" Visuals {{{
    call SourceVimDirectory('vimrc/visuals-pre')
    set visualbell
    set title
    syntax on
    set relativenumber
    set modeline
    set showmode
    set showcmd
    set showmatch
    set incsearch
    set hlsearch
    set wildmenu
    set wildmode=list:longest,full
    if has('multi_byte')
        set list
        if $TERM == "linux"
            set nolist
        endif
    endif
    set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«
    set showbreak=↪
    set ttyfast
    set lazyredraw
    set ruler
    set textwidth=79
    set wrapmargin=80
    set formatoptions=qrn1
    set colorcolumn=80
    set splitright splitbelow
    set shortmess+=afilmnrxoOtT
    set viewoptions=folds,options,cursor,unix,slash
    " Coloring {
        colors elflord
        highlight Folded term=standout ctermfg=0 ctermbg=7 guifg=Black guibg=ivory3
        highlight WhitespaceEOL ctermbg=Red guibg=Red
        match WhitespaceEOL /\s\+$/
    " }
    " Diff {
        set diffopt+=iwhite,vertical
    " }
    " GUI {
        if has('gui_running')
            set guioptions-=T " no toolbars
            set guioptions+=LlRrb guioptions-=LlRrb " no scrollbars
        endif
    " }
    " Cursor {
        autocmd VimLeave * silent !echo -ne "\033]112\007"
    "    let &t_SI = "\<Esc>]12;green\x7\<Esc>[5 q" " cursor color in insert mode
    "    let &t_EI = "\<Esc>]12;white\x7"   " cursor color in normal mode
    " }
    call SourceVimDirectory('vimrc/visuals-post')
" }}}
" Maps {{{
    call SourceVimDirectory('vimrc/maps-pre')
    " Use <Leader> in maps, so it's easier to share them, yet still allow
    " anyone to use them in their own, personalized way. Remember, not all
    " keyboards have US layout.
    "
    " Always use the non-recursive map commands (nore)
    let mapleader=','
    " Use <LocalLeader> for maps which (logistically) map to operations on
    " the local buffer only.
    let maplocaleader='\\'
    call SourceVimDirectory('vimrc/maps-post')
" }}}
" Automatizations {{{
    call SourceVimDirectory('vimrc/automatizations-pre')
    call SourceVimDirectory('vimrc/automatizations-post')
" }}}
" Abbreviations {{{
    call SourceVimDirectory('vimrc/abbreviations-pre')
    " Use abbreviations for common text you find yourself typing over and over
    " again.
    " Typos {
    " }
    call SourceVimDirectory('vimrc/abbreviations-post')
" }}}
" vimrc/Force yourself to learn proper vim {{{
    set mouse=""
    " PageDown and PageUp {
        " there are other vim ways of moving around learn how to use those
        " instead, like:
        " marks, C-u, C-d
        nnoremap <PageUp>       <NOP>
        nnoremap <PageDown>     <NOP>
        inoremap <PageUp>       <NOP>
        inoremap <PageDown>     <NOP>
        vnoremap <PageUp>       <NOP>
        vnoremap <PageDown>     <NOP>
    " }
    " Mouse movement {
        " reaching out to the mouse also means more finger movement than
        " necessary
        noremap <MiddleMouse>   <NOP>
        noremap <MouseUp>       <NOP>
        noremap <MouseDown>     <NOP>
    " }
    " Arrow keys {
        " needless to say, but: moving your fingers away from your home row
        " (and you ARE touch typing, right?) also leads to more finger
        " movement than it ought to be
        nnoremap <UP>           <NOP>
        nnoremap <DOWN>         <NOP>
        nnoremap <LEFT>         <NOP>
        nnoremap <RIGHT>        <NOP>
        inoremap <UP>           <NOP>
        inoremap <DOWN>         <NOP>
        inoremap <LEFT>         <NOP>
        inoremap <RIGHT>        <NOP>
        vnoremap <UP>           <NOP>
        vnoremap <DOWN>         <NOP>
        vnoremap <LEFT>         <NOP>
        vnoremap <RIGHT>        <NOP>
    " }
    " No repetitive HJKL {
        " repeatedly pressing keys like j instead of using a number like 42j
        " also leads to more finger movement than necessary
        let g:cursor_moving = 0
        let g:in_recording = 0
        let g:trap_keys = "hjklwWeE"

        function! TrapMovementKeys(key)
            augroup CursorMoving
                autocmd!
                autocmd CursorMoved * let g:cursor_moving += 1
            augroup END
            if g:cursor_moving <= 2
                return a:key
            else
                return ''
            endif
        endfunction

        function! SuspendDuringRecording()
            if g:in_recording == 0
                let l:code = getchar()
                "let l:mode = getcharmod()
                let g:in_recording = 1
                let l:char = nr2char(l:code)
                call UninstallTraps(g:trap_keys)
                return 'q'.l:char
            else
                let g:in_recording = 0
                call InstallTraps(g:trap_keys)
                return 'q'
            endif
        endfunction

        function! SuspendDuringPlayback()
            call UninstallTraps(g:trap_keys)
            let l:code = getchar()
            let l:char = nr2char(l:code)
            return "@".l:char.":call InstallTraps(g:trap_keys)\<CR>"
        endfunction

        function! InstallTraps(keys)
            for l:key in split(a:keys, '\zs')
                execute printf('nnoremap <expr> %s TrapMovementKeys("%s")', l:key, l:key)
            endfor
        endfunction

        function! UninstallTraps(keys)
            for l:key in split(a:keys, '\zs')
                execute printf('nunmap %s', l:key)
            endfor
       endfunction

        call InstallTraps(g:trap_keys)
        nnoremap <expr> q SuspendDuringRecording()
        nnoremap <silent> <expr> @ SuspendDuringPlayback()

        augroup CursorMovingOff
            autocmd!
            autocmd CursorHold * let g:cursor_moving = 0
        augroup END
    " }
" }}}
" vim:set foldmarker={{{,}}} foldlevel=0 foldmethod=marker:
