set nocompatible
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nobackup
set nowritebackup
set showmatch
set number
set expandtab
set smarttab
set nowrap
set backspace=2
set incsearch
set nohlsearch
set ignorecase
set smartcase
set ruler
set laststatus=2
set hidden
set title
set scrolloff=2
set smartindent
set nocursorline
" set cursorcolumn
set virtualedit=all
set nostartofline
set showmode 
" set hlsearch

" pathogen must be invoke before filetype plugin indent on
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

set t_Co=256
syntax enable
" let g:solarized_termcolors=256
" set background=dark
" colorscheme solarized
" colorscheme dark-ruby
" colorscheme vibrantink
" colorscheme molokai
" colorscheme vividchalk
"colorscheme mustang
" colorscheme ir_black
colorscheme fred_ir_black   " newly added by Fred (20110906)
" colorscheme jellybeans

" let g:solarized_termcolors=256
" set background=dark
" colorscheme solarized   " newly added by Fred (20120311)

" let g:zenburn_alternate_Include = 1
" let g:zenburn_high_Contrast = 1
" let g:zenburn_alternate_Visual = 1
" let g:zenburn_alternate_Error = 1
" colorscheme zenburn

let mapleader = ","

set listchars=tab:>-,trail:.,eol:$
nmap <silent> <leader>s :set nolist!<CR>
nmap <silent> <leader>n :set number!<CR>

nnoremap <leader>l :buffers<CR>:buffer<Space>

set history=1000
set undolevels=1000

set mousehide
set mouse=a

nnoremap ; :
nnoremap ' `
nnoremap ` '
nnoremap j gj
nnoremap k gk
nnoremap / /\v
vnoremap / /\v
inoremap jj <Esc>

nmap <silent> <tab>   :bn<CR>
nmap <silent> <s-tab> :bp<CR>

imap ,,, <esc>bdwa<<esc>pa><cr></<esc>pa><esc>kJcw
imap ]]] @@@<esc>hhkyWjl?@@@<cr>P/\@\@\@<cr>3s
nmap ]]] i@@@<esc>hhkyWjl?@@@<cr>P/\@\@\@<cr>3s

set grepprg=ack
set grepformat=%f:%l:%m
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

map <leader>w <C-W>
map <leader>e :e <C-R>=expand("%:h") . "/"<CR>

" newly added at 20120510
" ===========================================================================
" init variable (20120515)
let g:VimuxUseNearestPane = 0
let g:VimuxOrientation = 'v'
let g:VimuxHeight = '30'
let g:VimuxResetSequence = 'q C-u'

" Run the current file with rspec
map <Leader>rb :call RunVimTmuxCommand("clear; rspec " . bufname("%"))<CR>

" Prompt for a command to run
map <Leader>rp :PromptVimTmuxCommand<CR>

" Run last command executed by RunVimTmuxCommand
map <Leader>rl :RunLastVimTmuxCommand<CR>

" Inspect runner pane
map <Leader>ri :InspectVimTmuxRunner<CR>

" Close all other tmux panes in current window
map <Leader>rx :CloseVimTmuxPanes<CR>

" Close vim tmux runner opened by RunVimTmuxCommand
map <Leader>rq :CloseVimTmuxRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>rs :InterruptVimTmuxRunner<CR>
" ===========================================================================


:cabbrev q qa
:cabbrev dt diffthis

" let g:Tb_MaxSize = 0
" let g:Tb_ModSelTarget = 1

let g:yankring_history_dir = '~/.vim'
let g:yankring_map_dot = 0
nmap <leader>y :YRShow<cr>

let NERDSpaceDelims = 1
map <leader>d :execute 'NERDTreeToggle'<CR>
map <leader>g :execute 'NERDTreeFind'<CR>

let Tlist_GainFocus_On_ToggleOpen = 1
map <leader>c :TlistToggle<CR>

" map <leader>b :TMiniBufExplorer<CR>
" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1

set guifont=DejaVu\ Sans\ Mono\ 9
if has("gui_running")
  set lines=48 columns=120
  winpos 150 60
endif

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if (b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END
 
" autocmd BufWritePre *.ruby,*.js,*.haml :%s/\s\+$//e

" Protect large files from sourcing and other overhead.
" Files become read only
if !exists("my_auto_commands_loaded")
  let my_auto_commands_loaded = 1
  " Large files are > 10M
  " Set options:
  " eventignore+=FileType (no syntax highlighting etc
  " assumes FileType always on)
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " buftype=nowritefile (is read-only)
  " undolevels=-1 (no undo possible)
  let g:LargeFile = 1024 * 1024 * 2
  augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
  augroup END
endif

au BufRead,BufNewFile *.thor set filetype=ruby

" newly added by Fred (20110901)
:inoremap [d <C-R>=strftime("%Y%m%d")<CR>
:inoremap ]d <C-R>=strftime(strftime"%Y-%m-%d")<CR>

" newly added by Fred (20110905)
imap ,,. <esc>dla<<esc>pa><cr></<esc>pa><esc>kJcw

" newly added by Fred (20110914) - moving line ( from: http://amix.dk/vim/vimrc.html )
nmap <leader><Up>   mz:m-2<cr>`z
nmap <leader><Down> mz:m+<cr>`z
vmap <leader><Up>   :m'<-2<cr>`>my`<mzgv`yo`z
vmap <leader><Down> :m'>+<cr>`<my`>mzgv`yo`z
" :map <F2> :echo 'test'<CR>

nnoremap <f5> :GundoToggle<cr>

" newly added by Fred (20111010)
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-scripts/Gundo'
Bundle 'wincent/Command-T'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
Bundle 'git://github.com/flazz/vim-colorschemes.git'
Bundle 'git://github.com/chrismetcalf/vim-yankring.git'
Bundle 'kchmck/vim-coffee-script'
Bundle 'git://github.com/vim-scripts/taglist.vim.git'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-commentary'
Bundle 'altercation/vim-colors-solarized'
Bundle 'groenewege/vim-less'
Bundle 'benmills/vimux'
Bundle 'pgr0ss/vimux-ruby-test'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'tpope/vim-fugitive'
