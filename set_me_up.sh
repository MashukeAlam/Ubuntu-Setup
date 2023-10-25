echo "Welcome! Let's set this baby up for your pleasure..."
echo "Remember that this process will require sudo permission."

echo "What is your Full name?"
read git_config_user_name

echo "What is your Github username?"
read username

echo "What email do you want to use to log into Github?"
read git_config_user_email

cd ~ && sudo apt update

echo "Installing figlet"
sudo apt install figlet

figlet 'Installing curl' 
sudo apt-get install curl -y

figlet 'Installing neofetch' 
sudo apt-get install neofetch -y


figlet "Installing copyq"
sudo add-apt-repository ppa:hluk/copyq -y
sudo apt update
sudo apt install copyq -y

figlet 'Installing latest git' 
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update && sudo apt-get install git -y

figlet 'Installing python3-pip'
sudo apt-get install python3-pip -y

figlet 'Installing getgist to download dot files from gist'
sudo pip3 install getgist
export GETGIST_USER=$username

figlet "Setting up your git global user name and email"
git config --global user.name "$git_config_user_name"
git config --global user.email $git_config_user_email

figlet 'Installing FiraCode'
sudo apt-get install fonts-firacode -y

figlet 'Installing SF Pro font'
wget https://www.cufonfonts.com/get/font/download/d164d0130677c7a1d5bf59c5177e95cc

figlet "Installing Monaco font"
wget 'https://github.com/todylu/monaco.ttf/blob/master/monaco.ttf'

figlet "Installing macOS theme for all accent color..."
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
cd ./WhiteSur-gtk-theme && ./install.sh -t all
cd ~

figlet "Installing macOS Icon theme"
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme && ./install.sh -a
cd ~

figlet "Installing macOS wallpaper"
git clone https://github.com/vinceliuice/WhiteSur-wallpapers.git
cd WhiteSur-wallpapers && sudo ./install-gnome-backgrounds.sh
cd ~

figlet "Installing Gnome tweaks"
sudo apt install gnome-tweak-tool -y

figlet "Doing some customization in gnomes..."
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false

figlet 'Installing NVM' 
sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash)"

export NVM_DIR="$HOME/.nvm" && (
git clone https://github.com/creationix/nvm.git "$NVM_DIR"
cd "$NVM_DIR"
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

figlet 'Installing NodeJS LTS'
nvm --version
nvm install --lts
nvm current

figlet "Installing yarn"
npm i -g yarn

figlet "Installing RBENV"
sudo apt install libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev -y
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
type rbenv

figlet "Installing Ruby 2.7.7"
rbenv install 2.7.7
rbenv global 2.7.7
ruby -v

figlet "Installing bundler"
echo "gem: --no-document" > ~/.gemrc
gem install bundler
gem env home

figlet "Installing rails"
gem install rails -v 6.0.1
rails -v

figlet "Installing VS Code"
sudo snap install code --classic

figlet 'Installing Insomnia Core and Omni Theme' 
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
  | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
  | sudo apt-key add -
sudo apt-get update && sudo apt-get install insomnia -y
mkdir ~/.config/Insomnia/plugins && cd ~/.config/Insomnia/plugins
git clone https://github.com/Rocketseat/insomnia-omni.git omni-theme && cd ~

figlet 'Installing MPV'
sudo apt install mpv -y
echo UP add volume +2 >> ~/.config/mpv/input.conf
echo DOWN add volume -2 >> ~/.config/mpv/input.conf

figlet 'Installing OBS Studio'
sudo apt-get install ffmpeg -y && sudo snap install obs-studio

figlet 'Enabling KVM for Android Studio'
sudo apt-get install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager -y
sudo adduser $USER libvirt
sudo adduser $USER libvirt-qemu

figlet 'Installing dbeaver'
wget -c https://dbeaver.io/files/6.0.0/dbeaver-ce_6.0.0_amd64.deb
sudo dpkg -i dbeaver-ce_6.0.0_amd64.deb
sudo apt-get install -f

figlet 'Installing fzf'
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

figlet 'Installing Peek' 
sudo add-apt-repository ppa:peek-developers/stable -y
sudo apt-get update && sudo apt-get install peek -y

figlet "Installing Google Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

figlet "Setting up Bash aliases..."
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

figlet "Source new bashrc..."
source ~/.bashrc

figlet 'Updating and Cleaning Unnecessary Packages'
sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get full-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'

echo "Alhamdulillah Done! Please restart your system..."









