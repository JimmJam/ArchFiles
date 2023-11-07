# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh
PLUGINS=/usr/share/zsh/plugins/
ZSH_CACHE_DIR=~/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster" # Main PC
#ZSH_THEME="risto" # Secondary/VM
#ZSH_THEME="half-life" # Server
#ZSH_THEME="alanpeabody" # AWS

# Load zsh plugins
source $ZSH/oh-my-zsh.sh
source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load modules and refresh autocompletes
plugins=(git)
setopt rcquotes
autoload -U compinit promptinit
compinit

# Define variables
EDITOR="nvim"
LIBVIRT_DEFAULT_URI="qemu:///system"
DISTRO="$(grep -oP 'PRETTY_NAME="\K[^"]+' /etc/os-release | awk '{print tolower($1)}')"
SMB="~/JimboSMB"
pfetch(){ neofetch --config ~/.config/neofetch/smallfetch.conf --ascii_distro $(echo $DISTRO)_small }

# Run fetch program on shell start
pfetch

## Aliases for both PC and Server ##

# Shortcut aliases
alias neo="clear && neofetch"
alias ip="ip -c"
alias ls="eza -a --color=always --group-directories-first"
alias lspkg="~/.config/sway/scripts/tools/lspkg.sh"
alias update="~/.config/sway/scripts/tools/full-update.sh"
alias iommu="~/.config/sway/scripts/tools/iommu-groups.sh"
alias killproton="~/.config/sway/scripts/tools/kill-proton.sh"
alias sunshinehost="WAYLAND_DISPLAY=wayland-1 DISPLAY=:1 sunshine"
alias controlserver="ssh server -t 'tmux attach -t control'"
alias birth="date -d @$(stat -c %W /) '+%a %b %d %r %Z %Y'"
alias alarms="cat $alarmfolder/alarms.sh"

# SSH Commands
alias kssh="kitten ssh"
alias pc="kssh 192.168.1.18"
alias server="kssh 192.168.1.17"
alias virtual="kssh 192.168.2.2"
alias senecassh="kssh jhampton1@matrix.senecacollege.ca"
alias dataws="kssh -i ~/.ssh/dat330-first.pem"
alias opsrouter="kssh ops345"
alias opswww="opsrouter -p 2211"
alias opsslave1="opsrouter -p 2221"
alias opsslave2="opsrouter -p 2222"
alias opsslave3="opsrouter -p 2223"

# Session commands
alias swaystart="sudo systemctl start greetd"
alias swaystop="sudo systemctl stop greetd"

# Curl tools
alias myip="curl ifconfig.co"
alias weather="curl wttr.in/Vaughan"
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"

# Download from YouTube
alias ytopus="~/.config/sway/scripts/tools/ytopus.sh"
alias ytmp4="yt-dlp --recode-video mp4"

# Personal fixes
alias cleanup="~/.config/sway/scripts/tools/cleanup.sh"
alias audiorestart="systemctl --user restart pipewire pipewire-pulse pipewire-media-session"
alias umountsmb="sudo umount -Rl $SMB"
alias namedisk="sudo e2label"
alias fixdisks="~/.config/sway/scripts/tools/disk-cleanup.sh"

## Server aliases ##

## Start basic programs
#alias controlpanel="tmux new-session -d -s control"
#alias wakepc="sudo etherwake -i eno1 04:7c:16:54:8d:2d"
#alias caddystart="sudo caddy run --config /etc/caddy/Caddyfile"
#alias ducksync="~/.config/duckdns/duck.sh"

## Synapse stuff
#alias synapseup="sudo synctl start /home/jimbo/.local/share/synapse/homeserver.yaml && tmux new-session -d 'cd /home/jimbo/.local/share/synapse/mx-puppet-steam; npm run start' && tmux new-session -d 'cd /home/jimbo/.local/share/synapse/instagram-bridge; ./bin/python -m mautrix_instagram' && tmux new-session -d 'cd /home/jimbo/.local/share/synapse/mautrix-discord && ./mautrix-discord-amd64' && tmux new-session -d 'cd /home/jimbo/.local/share/synapse/mautrix-whatsapp && ./mautrix-whatsapp-amd64'"
#alias synapsedown="sudo synctl stop /home/jimbo/.local/share/synapse/homeserver.yaml && pkill -9 npm && pkill -9 python && pkill -9 -f mautrix-discord-amd64 && pkill -9 -f mautrix-whatsapp-amd64"

## Minecraft stuff
#alias mcstart21="/usr/lib/jvm/java-21-openjdk-amd64/bin/java -Xms9G -Xmx9G -jar"
#alias mcstart8="/usr/lib/jvm/java-8-openjdk-amd64/bin/java -Xms5G -Xmx5G -jar"
#alias mineservers="cd $SMB/Minecraft\ Servers/"
#alias johnstart="mineservers; cd Johnside-SMP && mcstart21 paper* --nogui"
#alias betastart="mineservers; cd BetaServer && mcstart8 Posiden*"
