# ███████╗███████╗██╗  ██╗
# ╚══███╔╝██╔════╝██║  ██║
#  ███╔╝ ███████╗███████║
# ███╔╝  ╚════██║██╔══██║
#███████╗███████║██║  ██║
#╚══════╝╚══════╝╚═╝  ╚═╝
                        
# =====================================
# Zsh Configuration File (~/.zshrc) 
# =====================================
# ███████╗███████╗██╗  ██╗
# ╚══███╔╝██╔════╝██║  ██║
#  ███╔╝ ███████╗███████║
# ███╔╝  ╚════██║██╔══██║
#███████╗███████║██║  ██║
#╚══════╝╚══════╝╚═╝  ╚═╝
#
#
#   git clone https://github.com/zsh-users/zsh-completions ~/.zsh/plugins/zsh-completions
#   git clone https://github.com/childj/devops-bash-tools ~/.zsh/plugins/zsh-bash-completions  
#   git clone https://github.com/unixorn/fzf-zsh-plugin ~/.zsh/plugins/fzf-zsh-plugin
#   git clone https://github.com/twornowski/zsh-fzf-history-search ~/.zsh/plugins/zsh-fzf-history-search

# ------------------------------
# Powerlevel10k Instant Prompt
# ------------------------------

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# -----------------------------
# Theme: Powerlevel10k
# -----------------------------
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -----------------------------
# Plugins 
# -----------------------------
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 

source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

source ~/.zsh/plugins/zsh-completions/zsh-completions.plugin.zsh  # Mejores completados
source ~/.zsh/plugins/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh   # Integración fzf general


[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# -----------------------------
# Zsh Options 
# -----------------------------
setopt AUTO_CD              # Cambiar dir sin cd (te gusta).
setopt CORRECT              # Correcciones de comandos.
setopt EXTENDED_GLOB        # Globbing avanzado.
setopt INTERACTIVE_COMMENTS # Comentarios en interactivo.
setopt NO_BEEP              # Sin pitidos.
setopt APPEND_HISTORY        # Agrega al historial en tiempo real (nuevo).
setopt SHARE_HISTORY        # Comparte historial entre sesiones abiertas (nuevo, genial para multi-terminal).
setopt PROMPT_SUBST         # Sustitución de variables en prompts (nuevo, para p10k avanzado).
setopt MENU_COMPLETE        # Completa automáticamente la primera opción (mejor flujo).

# -----------------------------
# History Settings (Mejorado)
# -----------------------------
HISTFILE=~/.zsh_history
HISTSIZE=50000              
SAVEHIST=50000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY       
# -----------------------------
# Completion System
# -----------------------------
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'  
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{green}-- %d --%f' 
zmodload zsh/complist     

fpath=(~/.zsh/plugins/zsh-completions/src $fpath)

# -----------------------------
# Environment Variables 
# -----------------------------
export TERM=xterm-256color
export PATH="$HOME/.npm-global/bin:$PATH"
export EDITOR=vim        
export VISUAL=vim        

if [ -f ~/.dircolors ]; then
  eval "$(dircolors ~/.dircolors)"
fi

# -----------------------------
# Aliases (
# -----------------------------
# -- Navegación y Archivos (mejorados) --
alias ls='exa --icons --color=always --group-directories-first' 
alias la='exa -a --icons --color=always'
alias ll='exa -l --icons --color=always --git' 
alias lla='exa -la --icons --color=always'
alias tree='exa --tree --icons --color=always --level=3' 
alias mkd='mkdir -pv'      
alias t='touch'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias shred='shred -u -z -n 5' 
alias df='df -hT'         
alias du='du -h --max-depth=1'  
alias ..='cd ..'
alias ...='cd ../..'
alias bat='bat --style=full'  

# -- Sistema y Pacman --
alias pac='sudo pacman'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias search='pacman -Ss'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq); sudo pacman -Sc'  
alias yayupdate='yay -Syu' 
# -- Console y Workflow --
alias cl='clear'
alias ch='chmod'
alias ff='fastfetch'
alias clock='peaclock'
alias wf='wf-recorder'
alias win='hyprctl clients'
alias reboot='sudo reboot'
alias shutdown='sudo shutdown now'
alias grep='grep --color=auto -n' 
alias tailf='tail -f'    

# -- Editors --
alias nn='nano'
alias v='nvim'
alias vi='vim'
alias view='vim -R'
alias code='code'    

# -- Git 
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias glog='git log --oneline --graph --decorate'
alias gcl='git clone'      
alias gstash='git stash'    

# -- Docker --
alias docker='docker'
alias dps='docker ps'
alias dim='docker images'
alias dcu='docker compose up -d'  
alias dcd='docker compose down'
alias dcl='docker compose logs -f'

# -- Python/Venv --
alias py='python3'
alias pip='pip3'
alias venv='python3 -m venv .venv && source .venv/bin/activate' 
# -- Networking --
alias ping='ping -c 5'
alias ip='ip -color=auto addr show'
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias curl='curl -L'
alias ports='ss -tulanp'    
# -- Extra --
alias weather='curl wttr.in/~Madrid' 
alias matrix='cmatrix -b'   
alias yt='yt-dlp'           
# -----------------------------
# Useful functions
# -----------------------------

extract() {
  if [ -f "$1" ]; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "'$1' Cannot be extracted ()" ;;
    esac
  else
    echo "'$1' It is not a valid file"
  fi
}

# -----------------------------
# Key Bindings
# -----------------------------
bindkey -e  # Emacs mode.
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

# fzf bindings 
bindkey '^T' fzf-file-widget
bindkey '^[^C' fzf-cd-widget  # Alt+C
bindkey '^R' fzf-history-widget

# -----------------------------
# End of .zshrc
# -----------------------------

