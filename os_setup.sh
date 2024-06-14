#!/bin/bash

# Function to print colored messages
print_message() {
  local message=$1
  echo -e "\e[1;34m${message}\e[0m"
}

print_message "Welcome! Let's set this machine up"
print_message "Remember that this process will require sudo permission."

print_message "What is your Full name?"
read git_config_user_name

print_message "What is your Github username?"
read username

print_message "What email do you want to use to log into Github?"
read git_config_user_email

print_message "Updating system"
cd ~ && sudo apt update

print_message "Installing curl"
sudo apt-get install curl -y

print_message "Installing EXA"
sudo apt-get install exa -y

print_message "Installing neofetch"
sudo apt-get install neofetch -y

print_message "Installing bat"
sudo apt-get install bat -y

print_message "Installing copyq"
sudo add-apt-repository ppa:hluk/copyq -y
sudo apt update
sudo apt install copyq -y

print_message "Installing latest git"
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update && sudo apt-get install git -y

print_message "Installing python3-pip"
sudo apt-get install python3-pip -y

print_message "Setting up your git global user name and email"
git config --global user.name "$git_config_user_name"
git config --global user.email $git_config_user_email

print_message "Installing FiraCode"
sudo apt-get install fonts-firacode -y

print_message "Installing SF Pro font"
wget https://www.cufonfonts.com/get/font/download/d164d0130677c7a1d5bf59c5177e95cc

print_message "Installing Monaco font"
wget 'https://github.com/todylu/monaco.ttf/blob/master/monaco.ttf'

print_message "Installing Starship"
curl -sS https://starship.rs/install.sh | sh

print_message "Installing Ble.sh"
cd ~
git clone --recursive https://github.com/akinomyoga/ble.sh.git
cd ble.sh
sudo apt-get install gawk -y
make install
cd ~

print_message "Installing macOS theme for all accent color..."
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
cd ./WhiteSur-gtk-theme && ./install.sh -t all
cd ~

print_message "Installing macOS Icon theme"
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme && ./install.sh -a
cd ~

print_message "Installing macOS wallpaper"
git clone https://github.com/vinceliuice/WhiteSur-wallpapers.git
cd WhiteSur-wallpapers && sudo ./install-gnome-backgrounds.sh
cd ~

print_message "Installing Gnome tweaks"
sudo apt install gnome-tweak-tool -y

print_message "Installing figlet"
sudo apt install figlet -y

print_message "Installing fortune"
sudo apt install fortune -y


print_message "Doing some customization in gnomes..."
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-Light-solid-green'

print_message "Installing NVM"
sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash)"

export NVM_DIR="$HOME/.nvm" && (
git clone https://github.com/creationix/nvm.git "$NVM_DIR"
cd "$NVM_DIR"
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

print_message "Installing NodeJS LTS"
nvm --version
nvm install --lts
nvm current

print_message "Installing yarn"
npm i -g yarn

print_message "Installing RBENV"
sudo apt install libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev -y
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc
type rbenv

print_message "Installing Ruby 2.7.7"
rbenv install 2.7.7
rbenv global 2.7.7
ruby -v

print_message "Installing bundler"
echo "gem: --no-document" > ~/.gemrc
gem install bundler
gem env home

print_message "Installing rails"
gem install rails
rails -v

print_message "Installing VS Code"
sudo snap install code --classic

cd ~

print_message "Installing MPV"
sudo apt install mpv -y
echo UP add volume +2 >> ~/.config/mpv/input.conf
echo DOWN add volume -2 >> ~/.config/mpv/input.conf

print_message "Installing OBS Studio"
sudo apt-get install ffmpeg -y && sudo snap install obs-studio

print_message "Enabling KVM for Android Studio"
sudo apt-get install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager -y
sudo adduser $USER libvirt
sudo adduser $USER libvirt-qemu

print_message "Installing dbeaver"
wget -c https://dbeaver.io/files/6.0.0/dbeaver-ce_6.0.0_amd64.deb
sudo dpkg -i -y dbeaver-ce_6.0.0_amd64.deb
sudo apt-get install -f

print_message "Installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

print_message "Installing Peek"
sudo add-apt-repository ppa:peek-developers/stable -y
sudo apt-get update && sudo apt-get install peek -y

print_message "Installing Google Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
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

print_message "Updating and Cleaning Unnecessary Packages"
sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get full-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'

print_message "Alhamdulillah Done!"
