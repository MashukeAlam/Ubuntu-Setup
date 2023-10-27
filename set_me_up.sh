echo "Welcome! Let's set this baby up for your pleasure..."
echo "Remember that this process will require sudo permission."

echo "What is your Full name?"
read git_config_user_name

echo "What is your Github username?"
read username

echo "What email do you want to use to log into Github?"
read git_config_user_email

echo "Updating system"
cd ~ && sudo apt update

echo "Installing figlet"
sudo apt install figlet -y

figlet "Installing lolcat"
sudo snap install lolcat

figlet 'Installing curl'  | lolcat
sudo apt-get install curl -y

figlet 'Installing neofetch'  | lolcat
sudo apt-get install neofetch -y

figlet 'Installing bat'  | lolcat
sudo apt-get install bat -y


figlet "Installing copyq" | lolcat
sudo add-apt-repository ppa:hluk/copyq -y
sudo apt update
sudo apt install copyq -y

figlet 'Installing latest git'  | lolcat
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update && sudo apt-get install git -y

figlet 'Installing python3-pip' | lolcat
sudo apt-get install python3-pip -y

figlet "Setting up your git global user name and email" | lolcat
git config --global user.name "$git_config_user_name"
git config --global user.email $git_config_user_email

figlet 'Installing FiraCode' | lolcat
sudo apt-get install fonts-firacode -y

figlet 'Installing SF Pro font' | lolcat
wget https://www.cufonfonts.com/get/font/download/d164d0130677c7a1d5bf59c5177e95cc

figlet "Installing Monaco font" | lolcat
wget 'https://github.com/todylu/monaco.ttf/blob/master/monaco.ttf'

figlet "Installing Starship" | lolcat
curl -sS https://starship.rs/install.sh | sh

figlet "Installing Ble.sh" | lolcat
cd ~
git clone --recursive https://github.com/akinomyoga/ble.sh.git
cd ble.sh
sudo apt-get install gawk -y
make install
cd ~

figlet "Installing macOS theme for all accent color..." | lolcat
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
cd ./WhiteSur-gtk-theme && ./install.sh -t all
cd ~

figlet "Installing macOS Icon theme" | lolcat
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme && ./install.sh -a
cd ~

figlet "Installing macOS wallpaper" | lolcat
git clone https://github.com/vinceliuice/WhiteSur-wallpapers.git
cd WhiteSur-wallpapers && sudo ./install-gnome-backgrounds.sh
cd ~

figlet "Installing Gnome tweaks" | lolcat
sudo apt install gnome-tweak-tool -y

figlet "Doing some customization in gnomes..." | lolcat
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-Light-solid-green'

figlet 'Installing NVM'  | lolcat
sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash)"

export NVM_DIR="$HOME/.nvm" && (
git clone https://github.com/creationix/nvm.git "$NVM_DIR"
cd "$NVM_DIR"
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

figlet 'Installing NodeJS LTS' | lolcat
nvm --version
nvm install --lts
nvm current

figlet "Installing yarn" | lolcat
npm i -g yarn

figlet "Installing RBENV" | lolcat
sudo apt install libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev -y
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
type rbenv

figlet "Installing Ruby 2.7.7" | lolcat
rbenv install 2.7.7
rbenv global 2.7.7
ruby -v

figlet "Installing bundler" | lolcat
echo "gem: --no-document" > ~/.gemrc
gem install bundler
gem env home

figlet "Installing rails" | lolcat
gem install rails -v 6.0.1
rails -v

figlet "Installing VS Code" | lolcat
sudo snap install code --classic

cd ~

figlet 'Installing MPV' | lolcat
sudo apt install mpv -y
echo UP add volume +2 >> ~/.config/mpv/input.conf
echo DOWN add volume -2 >> ~/.config/mpv/input.conf

figlet 'Installing OBS Studio' | lolcat
sudo apt-get install ffmpeg -y && sudo snap install obs-studio

figlet 'Enabling KVM for Android Studio' | lolcat
sudo apt-get install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager -y
sudo adduser $USER libvirt
sudo adduser $USER libvirt-qemu

figlet 'Installing dbeaver' | lolcat
wget -c https://dbeaver.io/files/6.0.0/dbeaver-ce_6.0.0_amd64.deb
sudo dpkg -i -y dbeaver-ce_6.0.0_amd64.deb
sudo apt-get install -f

figlet 'Installing fzf' | lolcat
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

figlet 'Installing Peek'  | lolcat
sudo add-apt-repository ppa:peek-developers/stable -y
sudo apt-get update && sudo apt-get install peek -y

figlet "Installing Google Chrome" | lolcat
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

figlet "Setting up Bash aliases..." | lolcat
echo alias gs=\"git status\" >> ~/.bashrc
echo alias ga=\"git add .\" >> ~/.bashrc
echo alias gcm=\"git commit -m \" >> ~/.bashrc
echo alias commit=\"git commit -m \" >> ~/.bashrc
echo alias checkout=\"git checkout \" >> ~/.bashrc
echo alias gb=\"git branch\" >> ~/.bashrc
echo alias gl=\"git log\" >> ~/.bashrc
echo alias gp=\"git push\" >> ~/.bashrc
echo alias h=\"cd ~\" >> ~/.bashrc
echo alias d=\"cd ~/Downloads\" >> ~/.bashrc
echo alias p=\"cd ~/projects\" >> ~/.bashrc
echo alias c=\"cd ~/.config\" >> ~/.bashrc
echo alias bashrc=\"nano ~/.bashrc\" >> ~/.bashrc
echo alias iii=\"sudo apt install -y\" >> ~/.bashrc
echo alias cl=\"clear\" >> ~/.bashrc
echo "[[ ${BLE_VERSION-} ]] && ble-attach" >> ~/.bashrc


figlet "Setting up Starship" | lolcat
echo eval \"$(starship init bash)\" >> ~/.bashrc
starship preset nerd-font-symbols -o ~/.config/starship.toml



figlet "Source new bashrc..." | lolcat
source ~/.bashrc

figlet 'Updating and Cleaning Unnecessary Packages' | lolcat
sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get full-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'

figlet "Alhamdulillah Done!" | lolcat

echo -e '\033[1mPlease add this line at the *TOP* of .bashrc: [[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach\033[0m'

#figlet "Please restart your system..." | lolcat









