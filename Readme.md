# Keep my .vimrc configuration
.vimrc
```
" Vundle Plugins configure
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
Plugin 'davidhalter/jedi-vim'
Plugin 'tell-k/vim-autopep8' 

" jedi-vim setting
" jedi-vim close popup during completion
autocmd FileType python setlocal completeopt-=preview

" Normal setting
set number  "show line numbers
set showcmd "show command in bottom bar
set cursorline  "highlight current line
set wildmenu   "visual autocomplete for command menu
set lazyredraw  "redraw only when we need to
set showmatch  "highlight matching [{()}]

"New movement keymap
inoremap hh <ESC>
noremap ; l
noremap l k
noremap k j
noremap j h

" Theme
syntax enable
set background=dark
colorscheme solarized

set tabstop=4   " number of visual spaces per TAB
set softtabstop=4  "number of spaces in tab when editing
set expandtab   "tabs are spaces
set incsearch  "search as characters are enterd
set hlsearch  "highlight matches

" Search down into subdirectories
" Provides tab-completion for all file-related tasks
set path+=**

set clipboard=unnamedplus  " Copy to clipboard "+y

" netrw magic
let g:netrw_banner = 0 "hide netrw top banner
let g:netrw_list_hide = '.*\.swap$'  " Hide vim.swp files
let g:netrw_liststyle = 3  " Change the directory view in netrw
let g:netrw_browse_split = 4 " Open on previous vim
let g:netrw_altv = 1
let g:netrw_winsize = 25 " size of left window
" Open Vexplor automatically
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

" Toggle Vexplore with Ctrl-E
"function! ToggleVExplorer()
"  if exists("t:expl_buf_num")
"      let expl_win_num = bufwinnr(t:expl_buf_num)
"      if expl_win_num != -1
"          let cur_win_nr = winnr()
"          exec expl_win_num . 'wincmd w'
"          close
"          exec cur_win_nr . 'wincmd w'
"          unlet t:expl_buf_num
"      else
"          unlet t:expl_buf_num
"      endif
"  else
"      exec '1wincmd w'
"      Vexplore
"      let t:expl_buf_num = bufnr("%")
"  endif
"endfunction
"map <silent> <C-E> :call ToggleVExplorer()<CR>

" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
autocmd FileType netrw setl bufhidden=delete
```
