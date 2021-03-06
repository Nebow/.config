sudo pacman --noconfirm -S foot nano wofi zathura waybar ttf-font-awesome htop swaylock zathura-pdf-mupdf xdg-utils terminus-font sway firefox noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra adobe-source-code-pro-fonts adobe-source-sans-fonts adobe-source-serif-fonts adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts ttf-liberation ttf-dejavu ttf-roboto slurp wl-clipboard jq grim pamixer brightnessctl nomacs pngquant mpv


git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --noconfirm -si

yay -S --noconfirm ranger-git rofi-lbonn-wayland


touch ~/.hushlogin


git clone --recursive https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc


cat << EOF >> ~/.bash_profile
if [ -z $DISPLAY ] && [ "\$(tty)" = "/dev/tty1" ]; then
  exec sway
fi
EOF


cd ..
sudo rm -r yay

echo "FONT=ter-128n" | sudo tee -a /etc/vconsole.conf

echo "alias rm='rm -i'" | tee -a ~/.bashrc
echo "alias mpv='mpv --keep-open'" | tee -a ~/.bashrc

sudo mkdir /etc/systemd/system/getty@tty1.service.d
sudo tee -a /etc/systemd/system/getty@tty1.service.d/override.conf << EOF
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --noissue --nohostname %I $TERM
EOF
