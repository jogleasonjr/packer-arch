#!/bin/bash

set -e
set -x

# install xorg and i3
sudo pacman -S --noconfirm xorg-server xorg-xinit i3-gaps i3status dmenu

# install some sane defaults
sudo pacman -S --noconfirm noto-fonts termite vim nemo

# wire up startx and default i3 config
# mkdir -p /home/dev/.config/i3
# cp /etc/i3/config /home/dev/.config/i3/config
printf "#!/bin/bash\n\n" > /home/dev/.xinitrc
printf "# For vmware copy/paste\n" >> /home/dev/.xinitrc
printf "vmware-user\n\n" >> /home/dev/.xinitrc
printf "exec i3" >> /home/dev/.xinitrc

