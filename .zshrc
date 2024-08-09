# NOTE: Needed for ssh keys passphrase
eval $(keychain --eval --quiet ~/.ssh/proxmox ~/.ssh/photoprism ~/.ssh/nginx ~/.ssh/heimdall ~/.ssh/pihole ~/.ssh/guac ~/.ssh/auth)

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

# NOTE: how often zsh updates
export UPDATE_ZSH_DAYS=13

# NOTE: displays red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"

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


# NOTE: Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# NOTE: locale
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH=$PATH:/home/marvel/.spicetify
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia

eval "$(zoxide init --cmd cd zsh)"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
