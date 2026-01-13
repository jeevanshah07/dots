# NOTE: Needed for ssh keys passphrase

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export EDITOR="nvim"


# NOTE: See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k" 

# NOTE: how often zsh updates
export UPDATE_ZSH_DAYS=13

# NOTE: displays red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# NOTE: omz plugins
plugins=(
  git
  colored-man-pages
  sudo
  themes
  zsh-interactive-cd
  wd
  zsh-vi-mode
  zsh-syntax-highlighting
)

# NOTE: zsh completions 
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# NOTE: Add custom escape keybind for vi-mode (zsh-vi-mode plugin)
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# NOTE: user defined alias'
alias ls="eza -la --grid --no-user --header --git --icons --group-directories-first"
alias cp="cp -r"
alias python="python3"

gitcap() {
  git add . && git commit -am "$1" && git push
}

gitwork() {
  # $1 = remote URL, $2 = folder
  url="$1"
  folder="$2"

  # Unique remote name from folder name
  remote_name="assignment-$(basename "$folder")"

  # Clean up remote if it already exists
  git remote remove "$remote_name" 2>/dev/null
  git remote add "$remote_name" "$url"

  # Unique temporary branch name
  tmp_branch="tmp-$(basename "$folder")-branch"

  # Clean up old temp branch if it exists
  git branch -D "$tmp_branch" 2>/dev/null

  # Split subtree into a fresh branch
  git subtree split --prefix="$folder" -b "$tmp_branch" \
    && git push "$remote_name" "$tmp_branch:main" --force \
    && git branch -D "$tmp_branch" \
    && git remote remove "$remote_name"
}
# gitwork() {
#   git remote add assignment "$1"
#   git subtree split --prefix="$2" -b homework && git push assignment homework:main --force && git branch -D homework
# }

if [ $TERM = "xterm-kitty" ]
then
  alias ssh="kitty +kitten ssh"
fi


# NOTE: User configuration

# NOTE: Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# NOTE: locale
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8


# NOTE:  To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init --cmd cd zsh)"

export GPG_TTY=$TTY

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/jeevanshah/.bun/_bun" ] && source "/Users/jeevanshah/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export GPG_TTY=$(tty)
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
