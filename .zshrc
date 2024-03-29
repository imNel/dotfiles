export ZSH="$HOME/.oh-my-zsh"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"

if command -v brew &> /dev/null
then
  source "$(brew --prefix)/etc/profile.d/z.sh"
fi

export PATH="$HOME/Library/pnpm:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.local/share/fnm:$HOME/.emacs.d/bin:$HOME/Clones/kotlin-language-server/server/build/install/server/bin:$PATH"

eval "$(fnm env --use-on-cd)"
eval "$(thefuck --alias)"
eval "$(starship init zsh)"

# alias delbranches="git fetch && git branch -vv | grep ': gone]'|  grep -v \"\*\" | awk '{ print $1; }' | xargs -r git branch -d"
alias lg="lazygit"
alias nvm="echo You wanna use: fnm"
alias vim="nvim"
alias nv="nvim"
alias pn="pnpm"
alias s="kitty +kitten ssh"
alias neofetch="hyfetch"

# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/platform-tools
