sudo pacman --noconfirm -S foot ranger git nano rofi wofi zathura waybar ttf-font-awesome htop swaylock zathura-pdf-mupdf xdg-utils terminus-font sway firefox noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra adobe-source-code-pro-fonts adobe-source-sans-fonts adobe-source-serif-fonts adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts ttf-liberation ttf-dejavu ttf-roboto


git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

xdg-settings set default-web-browser firefox.desktop

touch .hushlogin


git clone --recursive https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc
