export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"

source "$(brew --prefix)/etc/profile.d/z.sh"
export PATH="/Users/nel/Library/pnpm:/Users/nel/.cargo/bin:/Users/nel/.local/bin:$PATH"

eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"

# alias delbranches="git fetch && git branch -vv | grep ': gone]'|  grep -v \"\*\" | awk '{ print $1; }' | xargs -r git branch -d"
alias lg="lazygit"
alias nvm="echo You wanna use: fnm"
alias tp="togglepadding"

# fnm
export PATH="/home/nel/.local/share/fnm:$PATH"
eval "`fnm env`"
