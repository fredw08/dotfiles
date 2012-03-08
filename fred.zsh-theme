# Yay! High voltage and arrows!

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}[!]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_HAVE_STASH="%{$fg_bold[red]%}#%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_HAVE_NO_STASH=""


PROMPT='%{$fg[yellow]%}[%m] %{$fg_bold[cyan]%}%0~%{$reset_color%}%{$fg_bold[red]%}|%{$reset_color%}$(git_prompt_info)%{$fg_bold[cyan]%}>%{$reset_color%} '
