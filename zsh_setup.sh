#!/bin/bash

# Function to print colored messages
print_message() {
  local message=$1
  echo -e "\e[1;34m${message}\e[0m"
}

print_message "Installing Zsh and Oh-My-Zsh"
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

print_message "Installing Zsh Plugins and Themes"
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
git clone https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

sed -i 's/^plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-completions zsh-autocomplete)/' ~/.zshrc

print_message "Configuring Powerlevel10k Theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
sed -i 's/^ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

print_message "Setting up Zsh Aliases..."
cat << 'EOF' >> ~/.zshrc
# File and Directory Management
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias l="ls -lah"
alias ll="ls -l"
alias la="ls -A"
alias mkdir="mkdir -pv"
alias cp="cp -i"          # Confirm before overwriting
alias mv="mv -i"          # Confirm before overwriting
alias rm="rm -i"          # Confirm before deleting
alias gs="git status"
alias ga="git add ."
alias gcm="git commit -m "
alias commit="git commit -m "
alias checkout="git checkout "
alias gb="git branch"
alias gl="git log"
alias gp="git push"
alias h="cd ~"
alias d="cd ~/Downloads"
alias p="cd ~/projects"
alias c="cd ~/.config"
alias bashrc="nano ~/.bashrc "
alias iii="sudo apt install -y"
alias cl="clear"
alias gacm="ga && gcm"
alias gg="git status"
alias gcd="git checkout development"
alias gpl="git pull"
alias gps="git push"
alias c="code"
alias gdev="git checkout development"
alias gmain="git checkout main"
alias kat="batcat"
alias black="echo -ne '\e]11;#000000\a'"
alias white="echo -ne '\e]11;#ffffff\a'"
# File and Directory Management
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias l="ls -lah"
alias ll="ls -l"
alias la="ls -A"
alias mkdir="mkdir -pv"
alias cp="cp -i"          # Confirm before overwriting
alias mv="mv -i"          # Confirm before overwriting
alias rm="rm -i"          # Confirm before deleting



# Git Shortcuts
alias gco="git checkout"
alias gcb="git checkout -b"
alias gm="git merge"
alias gr="git remote -v"
alias gst="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias glg="git log --oneline --graph --decorate"
alias gup="git pull --rebase"
alias gpr="git pull --rebase && git push"
alias gclean="git clean -fd"

# System and Utilities
alias update="sudo apt update && sudo apt upgrade -y"
alias cleanup="sudo apt autoremove -y && sudo apt autoclean -y"
alias reboot="sudo reboot"
alias shutdown="sudo shutdown now"
alias df="df -h"
alias free="free -m"

# Networking
alias ipinfo="curl ipinfo.io/ip"
alias myip="ip addr show | grep 'inet ' | grep -v '127.0.0.1'"

# Docker
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dbuild="docker build -t"
alias drun="docker run -it --rm"
alias dstop="docker stop"
alias drm="docker rm"
alias dimages="docker images"

# Kubernetes (kubectl)
alias k="kubectl"
alias kx="kubectl exec -it"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kl="kubectl logs"
alias kctx="kubectl config use-context"
alias kns="kubectl config set-context --current --namespace"

# Python and Virtual Environments
alias venv="python3 -m venv"
alias act="source venv/bin/activate"
alias deact="deactivate"

# Custom Commands
alias weather="curl wttr.in"
alias todo="nano ~/todo.txt"
alias timestamp="date '+%Y-%m-%d %H:%M:%S'"
alias stopwatch="echo 'Press Ctrl+C to stop'; date +%s | while read start; do date +%s | awk '{print strftime(\"%H:%M:%S\", $1-'$start', 1)}'; sleep 1; done"

# Zsh Reload
alias reload="source ~/.zshrc"

# Aliases for common typos
alias mroe="more"
alias kk="kubectl"
alias htop="htop -C"
EOF

print_message "Source new zshrc..."
source ~/.zshrc

print_message "Zsh setup is complete! Please restart your terminal or run 'exec zsh' to start using Zsh."
