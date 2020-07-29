export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

export SSL_CERT_FILE=/etc/ssl/keychain-certs.pem
export REQUESTS_CA_BUNDLE=/etc/ssl/keychain-certs.pem
export SQL_SERVER_HOST="AUSWDEVDB03"
export SQL_SERVER_NAME="R441Bank"
export SQL_SERVER_USER="dev_sa"
exportSQL_SERVER_PWD="q2success"
export HQ_URL="http://aus-app-dev-00/R441_Ardent_Hydra"
export CSR_USER="q2"
export CSR_PWD="2q"
export ABA="022222222"
export CACHE_HOST="10.115.4.230"
export HQ_BOUNCE_URL="http://fabio-hq-lb.service.q2consul-corp:5000/sdk/44/api/v1/web/recycle/hq"

fpath=($ZSH/functions $fpath)

autoload -U $ZSH/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char
