" ---------------------------
" PLUGIN MANAGER
" ---------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'alepez/vim-gtest'
Plugin 'YCM-Generator'
" All of your Plugins must be added before the following line
call vundle#end()            " required

Plugin 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer' }

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ---------------------------
" PREFERENCES
" ---------------------------

" general tweaks for niceness
set noerrorbells visualbell t_vb=   " get rid of that annoying bell
set number                          " display line numbers
set colorcolumn=80                  " show a colored column at the desired row length
set nocompatible                    " be iMproved, required

" syntax highlighting
filetype plugin indent on           " detect what type of file is being edited
set encoding=utf-8
" set omnifunc=syntaxcomplete#Complete
syntax enable                       " enable syntax highlighting
colo ron                            " colour scheme

" Indentation
set tabstop=4                       " tab spacing
set shiftwidth=4                    " tab spacing
set expandtab                       " expand tabs to spaces

" enable folding and automatic detection of foldable sections
set foldmethod=syntax
set foldenable
set foldlevel=100

" enable local folder level vimrc fo specific projects
set exrc                            " allow local vim project settings
set secure                          " limit commands from local vim project settings

" ---------------------------
" CUSTOM KEYMAPPINGS
" ---------------------------
" This keymapping is a shortcut for keeping a split buffer open when closing
" the buffer file
nnoremap <F2> :bp\|bd #<cr>


" ---------------------------
" LANGUAGE SPECIFIC
" ---------------------------
augroup filetype_tex
    autocmd!
    autocmd FileType tex setlocal textwidth=80
    autocmd FileType tex setlocal spell spelllang=en_gb
    autocmd FileType tex setlocal foldmethod=manual
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent loadview
augroup END

" Doxygen include files
augroup filetypedetect
    autocmd! BufEnter *.dox :setlocal filetype=cpp
augroup END

augroup filetype_cpp
    autocmd!
    autocmd FileType cpp,hpp,c,h packadd termdebug
    autocmd FileType cpp,hpp,c,h let g:termdebug_wide=1
augroup END

augroup GTest
    autocmd FileType cpp nnoremap <silent> <leader>tt :GTestRun<CR>
    autocmd FileType cpp nnoremap <silent> <leader>tu :GTestRunUnderCursor<CR>
    autocmd FileType cpp nnoremap          <leader>tc :GTestCase<space>
    autocmd FileType cpp nnoremap          <leader>tn :GTestName<space>
    autocmd FileType cpp nnoremap <silent> <leader>te :GTestToggleEnabled<CR>
    autocmd FileType cpp nnoremap <silent> ]T :GTestNext<CR>
    autocmd FileType cpp nnoremap <silent> [T :GTestPrev<CR>
    autocmd FileType cpp nnoremap <silent> <leader>tf :CtrlPGTest<CR>
    autocmd FileType cpp nnoremap <silent> <leader>tj :GTestJump<CR>
    autocmd FileType cpp nnoremap <leader>ti :GTestNewTest<CR>i
augroup END
