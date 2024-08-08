# NOTE: Needed for ssh keys passphrase
eval $(keychain --eval --quiet ~/.ssh/proxmox ~/.ssh/photoprism ~/.ssh/nginx ~/.ssh/heimdall ~/.ssh/pihole ~/.ssh/guac ~/.ssh/auth)

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to oh-my-zsh installation.
export ZSH="/home/marvel/.oh-my-zsh"

export XDG_RUNTIME_DIR='/tmp/runtime-marvel/'
export EDITOR="nvim"

export mENV=". /home/marvel/.local/share/virtualenvs/Malcolm-next-_RtmuMXy/bin/activate"
export mRUN="~/Coding/Malcolm-next/src/bot.py"
export mCONF="~/Coding/Malcolm-next/config.yml"

PATH="/home/marvel/.local/bin":$PATH
export PATH="/home/marvel/.cargo/bin":$PATH
export PATH=/home/marvel/.nimble/bin:$PATH
export PATH="/usr/local/texlive/2024/bin/x86_64-linux":$PATH

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
alias malcolm-env="source $mENV"
alias malcolm-start="python $mRUN $mCONF"
alias malcolm-linter="flake8 --extend-ignore=E501,E401 ./src/*"
alias ls="exa -la --grid --no-user --header --git --icons --group-directories-first"
alias cp="cp -r"
alias sshp="ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no"
alias mt="manim-test"
alias mb="manim-build"

gitcap() {
  git add . && git commit -am "$1" && git push
}

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
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH=$PATH:/home/marvel/.spicetify
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia

eval "$(zoxide init --cmd cd zsh)"
