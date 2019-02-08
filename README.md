## Packer-Arch

Packer template and scripts to generate Arch Linux virtual machines to my liking. This includes:

  * VMWare/VirtualBox tools (for copy/paste and screen resizing)
  * [i3-gaps](https://github.com/Airblader/i3) window manager
  * [rofi](https://github.com/DaveDavenport/rofi) launcher (try typing `day` or `night` into it)
  * [compton](https://github.com/chjj/compton) compositor
  * [termite](https://github.com/thestinger/termite) terminal
  * [polybar](https://github.com/jaagr/polybar)
  
## Day Mode
![](https://github.com/jogleasonjr/packer-arch/raw/master/screenshots/day_mode.png)

## Night Mode
![](https://github.com/jogleasonjr/packer-arch/raw/master/screenshots/night_mode.png)

## Building
```
packer build --only=vmware-iso-desktop templates\archlinux-x86_64.json

packer build --only=virtualbox-iso-desktop templates\archlinux-x86_64.json
```

## Running
* Username: `dev`
* Password: `piranha`

The virtual machine will start at the console. Log in with the credentials above then type `startx` to get to desktop.

## Defaults

* **Meta+Enter** -> `terminal`
* **Meta+\\** -> `chromium`
* **Meta+D** -> `rofi` (application launcher)

See `.config/i3/config` for the rest of the key commands.
