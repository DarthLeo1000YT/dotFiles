# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ubunly"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git branch colored-man-pages docker)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# some more ls aliases
if command -v exa &> /dev/null
then
    alias ls='exa -hF --group-directories-first --color=auto --long --header -ag'
else
    alias ls='ls -hF --group-directories-first --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#Custom aliases
alias dirbuster='source /opt/dirbuster/DirBuster-1.0-RC1.sh'
alias cls='clear'
alias ctl='sudo systemctl'
alias restart='sudo reboot'

if command -v exa &> /dev/null; then
    alias remove='sudo nala remove'
    alias aptsearch='sudo nala search'
    alias listpackages='sudo nala list --installed'
    alias install='sudo nala install'
    alias instally='sudo nala install -y'
    alias update='sudo nala update && sudo nala upgrade'
else
    alias remove='sudo apt remove'
    alias aptsearch='sudo apt search'
    alias listpackages='sudo apt list --installed'
    alias install='sudo apt install'
    alias instally='sudo apt install -y'
    alias update='sudo apt update && sudo apt upgrade'
fi



alias publicip='dig TXT +short o-o.myaddr.l.google.com @ns1.google.com'
alias localip='hostname -I | awk "{print $1}"'
alias snano='sudo nano'
alias scode='sudo code --user-data-dir /home/darthleo/'
alias ssubl='sudo subl'
alias crafty='cd /var/opt/minecraft/crafty/ && sudo su crafty -'
alias deletelock='sudo rm /var/opt/minecraft/crafty/crafty-commander/app/config/session.lock && ls /var/opt/minecraft/crafty/crafty-commander/app/config'
alias nginxdir='nautilus /etc/nginx/'
alias lol='sudo find / | grep'
alias pls='sudo $(fc -ln -1)'
alias cd..='cd ..'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cp='cp -i -v' # Add confirmation
alias mv='mv -i -v' # Add confirmation
alias rm='rm -i -v' # Add confirmation
alias ln='ln -i -v' # Add confirmation
alias left='env ls -t -1' # Where you left off
alias speed='speedtest-cli --server 35491 --simple'
alias cpv='rsync -ah --info=progress2'
alias vopen="nautilus . 2>&1"
alias rcopen="code ~/.bashrc"

portapp(){
	sudo lsof -i -P -n | grep LISTEN | grep ':{print $1}'
}
allports(){
	sudo lsof -i -P -n | grep LISTEN
}
rebootnginx(){
	sudo systemctl restart nginx && systemctl status nginx
}
perms(){
	sudo chown -R crafty:crafty /var/opt/minecraft && sudo chmod -R 2777 /var/opt/minecraft
}

alias updatecc='cd /var/opt/minecraft/crafty/crafty-commander && git pull'
alias forceupdatecc='cd /var/opt/minecraft/crafty/crafty-commander && git reset --hard && git checkout dev && git pull'
alias craftydir='cd /var/opt/minecraft/crafty/crafty-4'
alias rr='if [ -f /var/run/reboot-required ]; then echo "reboot required"; else echo "No reboot needed"; fi'

alias java11='/usr/lib/jvm/java-11-openjdk-amd64/bin/java'
alias java8='/usr/lib/jvm/java-8-openjdk-amd64/bin/java'
alias java16='/usr/lib/jvm/java-16-openjdk-amd64/bin/java'
alias java17='/usr/lib/jvm/java-17-openjdk-amd64/bin/java'
alias java11adopt='/usr/lib/jvm/jdk11adoptium/bin/java'
alias jvmdir='echo "Java Install dir is /usr/lib/jvm/" && ls /usr/lib/jvm/'
alias config='/usr/bin/git --git-dir=/home/darthleo/dotFiles'
