" -------------------
" override setting
" -------------------
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
set virtualedit=all
set nostartofline
set showmode 
set history=1000
set undolevels=1000
set mousehide
set mouse=a
set listchars=tab:>-,trail:.,eol:$
set grepprg=ack
set grepformat=%f:%l:%m

" -- plugin setting
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
let NERDSpaceDelims = 1
let Tlist_GainFocus_On_ToggleOpen = 1

" -- vundle setting
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

au BufRead,BufNewFile *.thor set filetype=ruby
" set hlsearch
" set cursorline
" set nocursorline
" set cursorcolumn
" set t_Co=256

" -------------------
" Keyboard
" -------------------
let mapleader = ","

map <leader>w <C-W>
map <leader>e :e <C-R>=expand("%:h") . "/"<CR>
map <leader>d :execute 'NERDTreeToggle'<CR>
map <leader>g :execute 'NERDTreeFind'<CR>
map <leader>c :TlistToggle<CR>

nmap <silent> <leader>s :set nolist!<CR>
nmap <silent> <leader>n :set number!<CR>
nmap <silent> <tab>   :bn<CR>
nmap <silent> <s-tab> :bp<CR>
nmap ]]] i@@@<esc>hhkyWjl?@@@<cr>P/\@\@\@<cr>3s
nmap <leader>y :YRShow<cr>

imap ,,, <esc>bdwa<<esc>pa><cr></<esc>pa><esc>kJcw
imap ]]] @@@<esc>hhkyWjl?@@@<cr>P/\@\@\@<cr>3s
imap ,,. <esc>dla<<esc>pa><cr></<esc>pa><esc>kJcw

" nnoremap ; :
" nnoremap : ;
nnoremap ' `
nnoremap ` '
nnoremap j gj
nnoremap k gk
nnoremap / /\v
nnoremap <f5> :GundoToggle<cr>
nnoremap <leader>l :buffers<CR>:buffer<Space>
" from godwin (20140128)
nnoremap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
nnoremap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
nnoremap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
nnoremap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

inoremap jj <Esc>
inoremap jk <Esc>
inoremap [d <C-R>=strftime("%Y%m%d")<CR>
inoremap ]d <C-R>=strftime("%Y-%m-%d")<CR>

vnoremap / /\v

cabbrev q qa
cabbrev dt diffthis

" -------------------
" Move Line
" -------------------
nmap <leader><Up>   mz:m-2<cr>`z
nmap <leader><Down> mz:m+<cr>`z
vmap <leader><Up>   :m'<-2<cr>`>my`<mzgv`yo`z
vmap <leader><Down> :m'>+<cr>`<my`>mzgv`yo`z

" -------------------
" vim-easy-align
" -------------------
" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)

" -------------------
" Slimux
" -------------------
nmap <Leader>rb :SlimuxShellRun ruby -Itest <C-R>=expand("%:f")<CR><CR>
nmap <Leader>rl :SlimuxShellLast<CR>
nmap <Leader>rc :SlimuxShellConfigure<CR>

" -------------------
" cursor position
" -------------------
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

" -------------------
" Pathogen
" -------------------
" pathogen must be invoke before filetype plugin indent on
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" -------------------
" Text color
" -------------------
syntax enable
colorscheme kolor
set background=light
" set background=dark
" colorscheme solarized
" colorscheme dark-ruby
" colorscheme vibrantink
" colorscheme molokai
" colorscheme vividchalk
"colorscheme mustang
" colorscheme ir_black
" colorscheme fred_ir_black   " newly added by Fred (20110906)
" colorscheme jellybeans
" set background=dark
" " let g:solarized_termcolors=256
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" let g:solarized_termtrans = 1
" colorscheme solarized   " newly added by Fred (20120311)
" let g:zenburn_alternate_Include = 1
" let g:zenburn_high_Contrast = 1
" let g:zenburn_alternate_Visual = 1
" let g:zenburn_alternate_Error = 1
" colorscheme zenburn

" -------------------
" Vundle Plugins
" -------------------
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/YankRing.vim'

" --- tpope + code editing
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'junegunn/vim-easy-align'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'square/maximum-awesome'
Bundle 'tmhedberg/matchit'

" --- status
Bundle 'bling/vim-airline'

" --- navigation
Bundle 'git://github.com/vim-scripts/taglist.vim.git'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'wincent/Command-T'
Bundle 'scrooloose/nerdtree'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'epeli/slimux'

" --- syntax highlight
Bundle 'git://github.com/flazz/vim-colorschemes.git'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'slim-template/vim-slim'

" Bundle 'benmills/vimux'
" Bundle 'pgr0ss/vimux-ruby-test'
" Bundle 'tpope/vim-unimpaired'
" Bundle 'vim-scripts/Gundo'
" Bundle 'Lokaltog/vim-powerline'
" Bundle 'altercation/vim-colors-solarized'
" Bundle 'nathanaelkane/vim-indent-guides'

" -------------------
" For Pair session
" -------------------
" share vim settings
if $TMUX =~ "/tmp/pair"
  source /home/share/vimrc.share
endif

" -------------------
" tmux (Vimux)
" -------------------
" let g:VimuxUseNearestPane = 0
" let g:VimuxOrientation = 'v'
" let g:VimuxHeight = '30'
" let g:VimuxResetSequence = 'q C-u'

" Run the current file with rspec
" map <Leader>rb :call RunVimTmuxCommand("clear; rspec " . bufname("%"))<CR>

" Prompt for a command to run
" map <Leader>rp :PromptVimTmuxCommand<CR>

" Run last command executed by RunVimTmuxCommand
" map <Leader>rl :RunLastVimTmuxCommand<CR>

" Inspect runner pane
" map <Leader>ri :InspectVimTmuxRunner<CR>

" Close all other tmux panes in current window
" map <Leader>rx :CloseVimTmuxPanes<CR>

" Close vim tmux runner opened by RunVimTmuxCommand
" map <Leader>rq :CloseVimTmuxRunner<CR>

" Interrupt any command running in the runner pane
" map <Leader>rs :InterruptVimTmuxRunner<CR>


" let g:Tb_MaxSize = 0
" let g:Tb_ModSelTarget = 1

"let g:yankring_history_dir = '~/.vim'
"let g:yankring_map_dot = 0

" map <leader>b :TMiniBufExplorer<CR>
" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1

" !!! === unknown buy commented ( 20140204 )
" set guifont=DejaVu\ Sans\ Mono\ 9
" if has("gui_running")
"   set lines=48 columns=120
"   winpos 150 60
" endif
 
" Protect large files from sourcing and other overhead.
" Files become read only
" if !exists("my_auto_commands_loaded")
"   let my_auto_commands_loaded = 1
"   " Large files are > 10M
"   " Set options:
"   " eventignore+=FileType (no syntax highlighting etc
"   " assumes FileType always on)
"   " noswapfile (save copy of file)
"   " bufhidden=unload (save memory when other file is viewed)
"   " buftype=nowritefile (is read-only)
"   " undolevels=-1 (no undo possible)
"   let g:LargeFile = 1024 * 1024 * 2
"   augroup LargeFile
"     autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
"   augroup END
" endif
" !!! == end of comment

" newly added by Fred (20110914) - moving line ( from: http://amix.dk/vim/vimrc.html )
" :map <F2> :echo 'test'<CR>

" newly added by Fred (20130516)
"autocmd VimEnter * IndentGuidesToggle
"let g:indent_guides_auto_colors = 0
"let g:indent_guides_guide_size  = 1
"let g:indent_guides_start_level = 2
"hi IndentGuidesOdd  ctermbg=none
"hi IndentGuidesEven ctermbg=17

