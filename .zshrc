## Load nvm, install using brew

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"


## Load jenv, install using brew

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


## Load rbenv, install using brew

eval "$(rbenv init -)"


## Git prompt

autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       '%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:*' enable git

vcs_info_wrapper() {
    vcs_info
    if [ -n "$vcs_info_msg_0_" ]; then
        echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
    fi
}


## Set clean custom prompt

setopt prompt_subst
PROMPT='%F{yellow}%3~%f $(vcs_info_wrapper)%(?.🚀.💥) '


## Load z, install using brew

. /usr/local/etc/profile.d/z.sh


## Aliases

alias ll='ls -lhGp'
alias cat='bat'
alias dotenv='env $(grep -v '^#' .env | xargs)'


## Load project specifics

for file in ~/.zsh.d/projects/*.zshrc; do
    source "$file"
done
