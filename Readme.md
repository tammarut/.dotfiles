# Keep configuration
> vimrc
```
" ============== vim-go ============== "
filetype plugin indent on

" Allow backspace to delete indentation and inserted text
" i.e. how it works in most programs
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.
set backspace=indent,eol,start

" go-vim plugin specific commands
" Also run `goimports` on your current file on every save
" Might be be slow on large codebases, if so, just comment it out
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1  " Automatically get signature/type info for object under cursor
let g:go_highlight_types = 1  " beautify highlight 'type'
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1  " highlight my function and method
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1  " highlight function and method invocations
let g:go_highlight_operators = 1  " highlight operators
let g:go_auto_sameids = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_fmt_experimental = 1
let g:go_metalinter_autosave=1
let g:go_metalinter_autosave_enabled=['golint', 'govet']

" Autocomplete prompt to appear automatically when press .(dot)
"au filetype go inoremap <buffer> . .<C-x><C-o>

" ============== Rainbow brackets Configuration ============== "
let g:rainbow_active = 1 " Enable
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']]  ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']]  ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']]  ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']]  ],
    \ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick'] " determine the colors
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']


" ============== Git Gutter ============== "
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
let g:gitgutter_enabled = 1

" ============== Vim airline ============== "
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" ============== Normal setting ============== "
set number relativenumber  " turn hybrid line number on
set showcmd "show command in bottom bar
set tabstop=4   " number of visual spaces per TAB
set expandtab   "tabs are spaces
set cursorline  "highlight current line
set wildmenu   "visual autocomplete for command menu
set lazyredraw  "redraw only when we need to
set showmatch  "highlight matching [{()}]
set autowrite
" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8


" ============== New movement keymap ============== "
inoremap hh <ESC>
noremap ; l
noremap l k
noremap k j
noremap j h

" ============== Terminal ============== "
set splitbelow
noremap <Leader>t :ter ++rows=13<CR>

" ============== Skin ============== "
syntax enable
set background=dark
colorscheme gruvbox

" ================ Search ================= "
set incsearch  " Highlight as you search
set hlsearch   " Highlight the current search
set ignorecase " Make search case insensitive...
set smartcase  " ... except when we use uppercase letters

" Search down into subdirectories
" Provides tab-completion for all file-related tasks
set path+=**

" ================ WSL yank support  ================= "
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system('cat |' . s:clip, @0) | endif
    augroup END
endif
set clipboard=unnamedplus  " Copy to clipboard "+y


" ================ Netrw magic  ================= "
let g:netrw_banner = 0 "hide netrw top banner
let g:netrw_list_hide = '.*\.swap$'  " Hide vim.swp files
let g:netrw_liststyle = 3  " Change the directory view in netrw
let g:netrw_browse_split = 4 " Open file on same windows vim
"let g:netrw_altv = 1   " Open files in vertical
let g:netrw_winsize = 20 " size of left window


" ========== Open to Right========== "
function! OpenToRight()
        :normal v
        let g:path=expand('%:p')
        :q!
        execute 'belowright vnew' g:path
        :normal <C-l>
endfunction

" ========== Open to Below ========== "
function! OpenToBelow()
        :normal v
        let g:path=expand('%:p')
        :q!
        execute 'belowright new' g:path
        :normal <C-l>
endfunction

" =========== Mapping key OpenRight/OpenBelow ========== "
function! NetrwMappings()
        " Hack fix to make ctrl-l work properly
        "noremap <buffer> <C-l> <C-w>l
        noremap <silent> <C-b> :call ToggleNetrw()<CR>
        noremap <buffer> V :call OpenToRight()<cr>
        noremap <buffer> H :call OpenToBelow()<cr>
endfunction

" =========== Run Mapping function automatically ========== "
augroup netrw_mappings
        autocmd!
        autocmd filetype netrw call NetrwMappings()
augroup END

" ======== Allow for netrw to be toggled explorer ========
let g:NetrwIsOpen=0  " Make sure that netrw is open variable
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" Close Netrw if it's the only buffer open
"autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif

" ========== Open netrw automatically like a project Draw ========== "
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :call ToggleNetrw()
augroup END



" ==================== Buffers  ===================== "
" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
autocmd FileType netrw setl bufhidden=delete
" ———————— Remapping key ————————— "
nnoremap  <silent> <tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>  
nnoremap  <silent> <s-tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
nnoremap  <Leader>d :bd<CR>

```
> .vimrc
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
> .bashrc
```
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias winhome='cd /mnt/c/Users/perm_/'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#Set PATH golang
export GOROOT=/usr/local/goroot
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

#Activate .dir_colors
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

#Customize bash prompt
#Get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}
#Active bash prompt
export PS1="\[\e[36m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[35m\]\h\[\e[m\]:\[\e[33m\]\w\[\e[m\]\[\e[32m\]\`parse_git_branch\`\[\e[m\] \n$ "

#Docker
#Export port for the docker daemon(Docker desktop)
export DOCKER_HOST=tcp://localhost:2375
alias docker="docker.exe"
alias docker-compose="docker-compose.exe"
```
