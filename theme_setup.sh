echo "Installing macOS theme for all accent color..."
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
cd ./WhiteSur-gtk-theme && ./install.sh -t all
cd ~

echo "Installing macOS Icon theme"
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme && ./install.sh -a
cd ~

echo "Installing macOS wallpaper"
git clone https://github.com/vinceliuice/WhiteSur-wallpapers.git
cd WhiteSur-wallpapers && sudo ./install-gnome-backgrounds.sh

echo "Done!"
