# ylei.zsh-theme

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

function prompt_ip {
    echo `ifconfig | grep '192.168'|  awk '{print "lo0       : " $2}'|cut -d "." -f4`;
}

#function git_prompt_info() {
#    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX "
#}

PROMPT='%{$fg_bold[green]%}➜ %{$fg_bold[green]%}[%*] %{$reset_color%}%{$fg_bold[yellow]%}%n@%m%{$fg_bold[yellow]%}<%_$(prompt_ip)> %{$fg_bold[blue]%}%d %{$reset_color%}$(git_prompt_info)'


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}✗%{$reset_color%}"

