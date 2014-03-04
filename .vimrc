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
if exists("&relativenumber") | set relativenumber | endif
set number
set expandtab
set smarttab
set nowrap
set backspace=2
set incsearch
" set nohlsearch
set ignorecase
set smartcase
" set ruler
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
set encoding=utf-8

" -- plugin setting
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
let NERDSpaceDelims = 1
let Tlist_GainFocus_On_ToggleOpen = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#fnamecollapse = 0
" let g:airline#extensions#tabline#fnamemod = ':p:t:.'
let g:airline_theme='bubblegum'

" -- override default ignore comment and string in vim-easy-align
" let g:easy_align_ignore_groups = ['Comment', 'String'] "<--- original
let g:easy_align_ignore_groups = []

" -- CtrlP searching setting
let g:ctrlp_match_window      = 'bottom,order:ttb'
let g:ctrlp_switch_buffer     = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command      = 'ag %s -l --nocolor --hidden -g ""'

" -- vundle setting
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" set hlsearch
" set cursorline
" set nocursorline
" set cursorcolumn
" set t_Co=256

" -------------------
" Pathogen
" -------------------
" pathogen must be invoke before filetype plugin indent on
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" -------------------
" autocmd
" -------------------
autocmd BufRead,BufNewFile *.thor set filetype=ruby
autocmd BufWritePre * :%s/\s\+$//e

" -------------------
" Keyboard
" -------------------
let mapleader = ","

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>w <C-W>
map <leader>e :e <C-R>=expand("%:h") . "/"<CR>
map <leader>d :execute 'NERDTreeToggle'<CR>
map <leader>g :execute 'NERDTreeFind'<CR>
map <leader>c :TlistToggle<CR>
" map <leader><space> :%s/\s\+$//e<cr>
" nmap <leader><space> :call whitespace#strip_trailing()<CR>

nmap <silent> <leader>s :set nolist!<CR>
nmap <silent> <leader>N :set nonumber!<CR>:set norelativenumber!<CR>
nmap <silent> <leader>n :call ToggleNumber()<CR>
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
" nmap <Leader>rb :SlimuxShellRun rspec <C-R>=expand("%:f")<CR><CR>
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
" Text color
" -------------------
syntax enable
colorscheme kolor "badwolf
set background=light
" set background=dark
" colorscheme solarized
" colorscheme fred_ir_black   " newly added by Fred (20110906)

" -------------------
" Special for minibufexpl
" -------------------
" hi MBEVisibleActive        guifg=#A6DB29 guibg=fg
" hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
" hi MBEVisibleChanged       guifg=#F1266F guibg=fg
" hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
" hi MBEChanged              guifg=#CD5907 guibg=fg
" hi MBENormal               guifg=#808080 guibg=fg

" -------------------
" Vundle Plugins
" -------------------
Bundle 'gmarik/vundle'
" Bundle 'vim-scripts/YankRing.vim'

" --- tpope + code editing
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'junegunn/vim-easy-align'
Bundle 'michaeljsmith/vim-indent-object'
" Bundle 'square/maximum-awesome'
Bundle 'tmhedberg/matchit'

" --- status
Bundle 'bling/vim-airline'

" --- navigation
Bundle 'git://github.com/vim-scripts/taglist.vim.git'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'epeli/slimux'
Bundle 'christoomey/vim-tmux-navigator'

" --- syntax highlight
Bundle 'git://github.com/flazz/vim-colorschemes.git'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'slim-template/vim-slim'
Bundle 'fholgado/minibufexpl.vim'

" Bundle 'chrisbra/changesPlugin'
" Bundle 'wincent/Command-T'
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
if $TMUX =~ "pair"
  source /home/share/vimrc.share
endif

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber && &relativenumber == 1)
      set norelativenumber
      set number
    else
      set relativenumber
    endif
endfunction
