# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME=$HOME
# [[ $TERM != "screen" ]] && tmux && exit  # default tmux

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="fred"   # at custom folder
#ZSH_THEME="miloshadzic"
#ZSH_THEME="nebirhos"            # have rvm list

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git ruby rails3)
plugins=(bundler debian git ruby rails thor ssh-agent)
bindkey -v

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games # :/home/fred/.rvm/bin

# RVM
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Chruby
# source /usr/local/share/chruby/chruby.sh
# source /usr/local/share/chruby/auto.sh
source ~/src/chruby/share/chruby/chruby.sh
source ~/src/chruby/share/chruby/auto.sh

# chruby 2.0.0-p247
# chruby 2.1.0
chruby 2.1.5


# ssh alias
alias work='ssh amoebaba'
alias synergy='/Applications/Synergy.app/Contents/MacOS/Synergy &; disown %1;'
alias vtask='v ~/Dropbox/01\ -\ Task.txt'
alias vmin='v ~/Dropbox/03\ -\ meeting\ minutes.txt'
alias vj='v ~/Dropbox/04\ -\ Journal.txt'


# =====================================================
# global alias
# =====================================================
alias -g M=' | more'

# =====================================================
# alias
# =====================================================
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
function p { cd ~/project/$1; }
function h { cd ~/$1; }

# project related
alias igs='p igs'
alias igshk='p igshk'
alias nerv='p nerv'
alias n='nerv'
alias nerv2='p nerv2'
alias n2='nerv2'
alias cms='p metiscms'
alias myk='p myk'
alias caas='p caas'
alias nervapi='p nerv-api'
alias igshkfront='p igshkfrontend'
alias satellite='p satellite'
alias play='p play'
alias snapshot='p snapshot_tree'
alias db='p db'
alias cam='p amoeba.cam'
alias ws='p amoeba.ws'
alias amoeba='p amoeba'
alias a='amoeba'
alias amoeba_2='p amoeba_2'
alias amoeba2='p amoeba_2'
alias a2='amoeba2'
alias uat='p amoeba_uat'
alias dotfiles='p dotfiles'
alias et='RAILS_ENV=test'
alias ep='RAILS_ENV=production'
alias rruby='rescue=1 ruby'
alias -g R='rescue=1'
alias rubo='bundle exec rubocop'
function restore_amoeba {
  ku
  psql -d postgres -c 'drop database amoeba_dev'
  psql -d postgres -c 'create database amoeba_dev'
  pg_restore -d amoeba_dev /vagrant/shared/amoeba_db.bak
  ./bin/s
}

# newly added by fred (20110915)
alias clr='clear'
function cc { wget -qO- "http://www.google.com/finance/converter?a=$1&from=$2&to=$3" | sed '/res/!d;s/<[^>]*>//g'; }

# newly added by fred (20110920)
# alias grep='ack-grep -i'
# alias gg='grep'
# alias ackri='gg'
alias ag='/usr/bin/ag'
function agp { ag "$@" app }
function agv { ag "$@" app/views }
function agm { ag "$@" app/models }
function agc { ag "$@" app/controllers }
function agt { ag "$@" test }
function ff { if [ $1 ] ; then find . -type f | ag $1 ; fi }

alias reload='source ~/.zshrc'
# alias vi='/home/fred.wong/bin/vim/src/vim'  # special override for vim7.4
# alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias v='vim'
alias vi='vim'
alias vread='vi -R'
alias vd='vi -d'
alias vzsh='v ~/.zshrc'
alias vimrc='v ~/.vimrc'
alias vimrc.local='v ~/.vimrc.local'
alias vtmx='v ~/.tmux.conf'
# alias vlog='v log/development.log'
# alias vt='v -c :CommandT'
# alias vm='v -c :Rmigration'

# newly added by fred (20111007)
function sql { psql igs_dev -c "$@" }

# from Calvin
alias cnull='cat /dev/null > '
alias cn='cnull'

# newly added (20130508)
alias cr='chruby'

# newly added by fred (20111128)
function pug  { ps xo pid,user:10,cmd | sort | grep "$@" }

# newly added by fred (20120405)
function pf  { ps xo pid,user:10,cmd | grep vagrant | grep -v zsh | grep -v grep }

alias tl='tail -f log/development.log'
alias tl10='tail log/development.log --lines=10'
alias tl20='tail log/development.log --lines=20'
alias tm='tmux attach || tmux new'
alias tmn='tmux new'
alias tml='tmux ls'
function tmk { tmux kill-session -t "$@" }
alias lc='rake log:clear'
alias cl='cn log/development.log; cn log/lograge_development.log'
alias clp='cn log/production.log'
alias clt='cn log/test.log; cn log/lograge_test.log'
alias calllog='cl && clp && clt'
alias vl='vi log/development.log'
alias vlt='vi log/test.log'
alias clt='cn log/test.log'
alias dr='rake db:reset'
alias ds='rake db:seed'
alias tp='rake test:prepare'
alias cleanup='kpu; rake db:reset && rake test:prepare && spring stop'
alias cu='cleanup'

# for pair session
# alias pair-a='tmux -S /tmp/pair a'
# alias pair-c='tmux -S /tmp/pair new'
# pair-c() {
#   if ! tmux -S /tmp/pair has-session -t pair 2> /dev/null; then
#     tmux -S /tmp/pair new -s pair -d;
#     tmux -S /tmp/pair send-keys -t pair:1.1 "chmod 1777 /tmp/pair" C-m "clear" C-m;
#   fi
#   tmux -S /tmp/pair attach -t pair;
# }
# txpair () {
#         SOCKET=/home/share/tmux-pair/default
#         if ! tmux -S $SOCKET has-session -t pair 2> /dev/null
#         then
#                 tmux -S $SOCKET new -s pair -d
#         fi
#         tmux -S $SOCKET attach -t pair
# }

alias 3620A='ssh 3620A'
alias 3620B='ssh 3620B'
alias 3620C='ssh 3620C'
alias 7945A='ssh 7945A'

alias rc='rails console'

# alias migs='bundle exec rake db:migrate:status'
# alias mig='bundle exec rake db:migrate'
# alias roll='bundle exec rake db:rollback'
alias migs='rake db:migrate:status'
alias mig='rake db:migrate'
alias roll='rake db:rollback'

alias rmg='mig'
alias rmgs='migs'

# zeus related
alias z='zeus'

#####################################################
# git related
#####################################################
alias gdh='git diff HEAD'
alias gd='git diff'
alias greset='git reset --hard'
alias grpo='git remote prune origin'
alias glr='gl && grpo'
alias gcm='gc --amend'
alias gcom='git checkout master'
# alias glog="git log --graph --pretty=\"format:%C(yellow)%h%Cblue%d%Creset %s %C(green) %an, %ar%Creset\""
alias glog="git log -p --graph --all --color --pretty=format:\"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s\""

# stash
alias gsth='git stash list'
alias gsths='git stash save'
alias gsthp='git stash pop'
alias gsthd='git stash drop'
alias gstha='git stash apply'
# custom
function gsthw  { git stash show -p }
function gsthww { git stash show  stash@\{$@\} -p }
function gsthaa { git stash apply stash@\{$@\} }
function gsthdd { git stash drop  stash@\{$@\} }
function gsthpp { git stash pop   stash@\{$@\} }

# name specific
# function tig { TERM=screen-256color /usr/bin/tig $@ }
alias tigfred='tig --author=fred.wong'
alias tigall='tig --all'
alias tiggodwin='tig --author=godwin.ko'
alias tigcalvin='tig --author=calvin.leung'
alias tigalex='tig --author=alex.au'
alias tignash='tig --author=nash.yeung'
alias tigsk='tig --author=sk.owyong'
alias tigchiao='tig --author=chiao.chuang'
alias tigazi='tig --author=azi.chen'
alias tigspring='tig --author=spring'

# from alex ----------------
# new_hotfix () {
#   echo -n "Self create? "
#   read SELF_CREATE
#   if [[ $SELF_CREATE =~ "y|Y|yes|Yes" ]]; then
#     SELF_CREATE=true
#   else
#     SELF_CREATE=false
#   fi
#   echo -n "Old hotfix branch: "
#   read OLD_HOTFIX
#   echo -n "New hotfix branch: "
#   read NEW_HOTFIX

#   if [[ $SELF_CREATE == true ]]; then
#     git flow hotfix start $NEW_HOTFIX
#     git push origin hotfix/$NEW_HOTFIX
#     git push origin :hotfix/$$OLD_HOTFIX
#     git branch --set-upstream hotfix/$NEW_HOTFIX origin/hotfix/$NEW_HOTFIX
#   else
#     git checkout develop && git pull
#     git checkout master && git pull
#     git branch -d hotfix/$OLD_HOTFIX
#     git branch --set-upstream hotfix/$NEW_HOTFIX origin/hotfix/$NEW_HOTFIX
#     git remote prune origin
#     git checkout hotfix/$NEW_HOTFIX
#   fi
#   echo -n "Done!"
# }
# --------------- end from alex

# refresh db
# refreshdb () {
#   pg_dump -c -h 3620C -p 5433 -T fund_prices    -T snapshot_portfolios -U athenabest amoeba | psql -d amoeba_dev
#   pg_dump -c -h 3620C -p 5433 -s -t fund_prices -t snapshot_portfolios -U athenabest amoeba | psql -d amoeba_dev
# }

zstyle ":completion:*:*:kill:*" menu yes select
zstyle ":completion:*:*:kill:*:processes" list-colors "=(#b) #([0-9]#)*=0=01;31"
zstyle ":completion:*:*:kill:*:processes" command "ps xo pid,user:10,cmd | ack-grep -v zsh"

#zstyle ':completion:*:*:kill:*:processes' command 'ps --forest xo pid,user:10,cmd'
#zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'

# bundle editor
export BUNDLER_EDITOR="vi"

#####################################################
# specific for amoebaba
#####################################################

alias psqlamoebadev='psql -d amoeba_dev'
alias psqligsdev='psql -d igs_dev'

# newly added by fred (20111228)
# export TERM=xterm-256color

alias ku='[[ -f tmp/pids/unicorn.pid ]] && kill `cat tmp/pids/unicorn.pid`'
#alias u='[[ -f config/unicorn.rb ]] && RAILS_RELATIVE_URL_ROOT=/`basename $PWD` _run-with-bundler unicorn -c $PWD/config/unicorn.rb -D'
alias ru='ku && bin/s'

# puma
kpu() {
  local PID=`grep -o 'pid: [0-9]*' tmp/pids/puma.state | grep -o '[0-9]*'`
  if [[ $PID =~ "[0-9]+" ]]; then
    kill $PID
  else
    echo 'no pid found'
  fi
}

#alias spu='bundle exec puma -C config/puma.rb config.ru'
alias spu='RAILS_RELATIVE_URL_ROOT=/nerv bundle exec puma -d -C config/puma.rb config.ru'
alias spu2='RAILS_RELATIVE_URL_ROOT=/nerv2 bundle exec puma -d -C config/puma.rb config.ru'
alias spu_debug='RAILS_RELATIVE_URL_ROOT=/nerv bundle exec puma -C bin/puma_debug.rb'
alias spu2_debug='RAILS_RELATIVE_URL_ROOT=/nerv2 bundle exec puma -C bin/puma_debug.rb'
alias rpu='kpu && spu'
alias rpu2='kpu && spu2'

alias spuk='RAILS_RELATIVE_URL_ROOT=/myk bundle exec puma -d -C config/puma.rb config.ru'
alias spukp='RAILS_RELATIVE_URL_ROOT=/myk bundle exec puma -d -C config/puma_production.rb config.ru'

# default cluster port
# export PGPORT=5434

# newly added by fred (20120131) - for ruby performance
# export RUBY_HEAP_MIN_SLOTS=1000000
# export RUBY_HEAP_SLOTS_INCREMENT=1000000
# export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
# export RUBY_GC_MALLOC_LIMIT=1000000000
# export RUBY_HEAP_FREE_MIN=500000

#####################################################
# copy from alex (20120813)
#####################################################
hotfiz() {
  echo "You prepare the deployment? (Y/N) "
  read prepare

  if [[ $prepare =~ "y|Y|yes|Yes" ]]; then
    echo "Old hotfix branch: "
    read OLD_HOTFIX
    OLD=(${(s:/:)OLD_HOTFIX})
    OLD_VERSION=$OLD[2]
    echo "New hotfix branch: "
    read NEW_HOTFIX

    git pull --rebase
    git checkout master
    git pull
    git merge --no-ff $OLD_HOTFIX
    ./bump-version
    git add VERSION
    git commit -m "Bump version to $OLD_VERSION"
    git tag $OLD_VERSION
    git branch $NEW_HOTFIX
    git branch -d $OLD_HOTFIX
    git checkout $NEW_HOTFIX
    clear
    git branch -a

    echo "Push to remote? (Y/N) "
    read push
    if [[ $push =~ "y|Y|yes|Yes" ]]; then
      git push
      git push --tags
      git push origin $NEW_HOTFIX
      git push origin :$OLD_HOTFIX
      git branch --set-upstream $NEW_HOTFIX origin/$NEW_HOTFIX
    fi
  else
    echo "Old hotfix branch: "
    read OLD_HOTFIX
    echo "New hotfix branch: "
    read NEW_HOTFIX

    git stash save 'Temp. storage for hotfiz'
    git checkout master
    git pull
    git branch -t $NEW_HOTFIX origin/$NEW_HOTFIX
    git branch -d $OLD_HOTFIX
    git remote prune origin
    git checkout $NEW_HOTFIX
    git stash pop
    clear
    git branch -a
  fi

  echo -n "Done!"
}

cop() {
  local extra_options='--display-cop-names --rails'
  if [[ $# -gt 0 ]]; then
    if git diff --name-only $@ -- **/*.(rb|jbuilder) > /dev/null; then
      git diff --name-only $@ -- **/*.(rb|jbuilder) | xargs rubocop `echo $extra_options`
    fi
  else
    local files="$(gst --porcelain -- **/*.(rb|jbuilder) | sed -e '/^\s\?[DRC] /d' -e 's/^.\{3\}//g')"
    if [[ -n "$files" ]]; then
      echo $files | xargs rubocop `echo $extra_options`
    else
      echo "Nothing to check. Write some *.(rb|jbuilder) to check.\nYou have 20 seconds to comply."
    fi
  fi
}
