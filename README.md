## Packer-Arch

[Packer](https://www.packer.io/) template and scripts to generate Arch Linux virtual machines to my liking. This includes:

  * VMWare/VirtualBox tools (for copy/paste and screen resizing)
  * [i3-gaps](https://github.com/Airblader/i3) window manager
  * [rofi](https://github.com/DaveDavenport/rofi) launcher (try typing `day` or `night` into it)
  * [compton](https://github.com/chjj/compton) compositor
  * [termite](https://github.com/thestinger/termite) terminal
  * [polybar](https://github.com/jaagr/polybar)
  * [nemo](https://github.com/linuxmint/nemo) file browser
  
## Day Mode
![](https://github.com/jogleasonjr/packer-arch/raw/master/screenshots/day_mode.png)

## Night Mode
![](https://github.com/jogleasonjr/packer-arch/raw/master/screenshots/night_mode.png)

## Building
```
git clone https://github.com/jogleasonjr/packer-arch.git
cd packer-arch
packer build --only=vmware-iso-desktop templates\archlinux-x86_64.json

# or for virtualbox
packer build --only=virtualbox-iso-desktop templates\archlinux-x86_64.json
```

## Running
* Username: `dev`
* Password: `piranha`

The virtual machine will start at the console. Log in with the credentials above then type `startx` to get to desktop.

## Defaults

Meta == Windows key or Command key

* **Meta+Enter** -> `terminal`
* **Meta+\\** -> `chromium`
* **Meta+D** -> `rofi` (application launcher)

See `.config/i3/config` for the rest of the key commands.

For i3 shortcuts, the Caps Lock key has been rebound to act as the Meta/Win key. This allows Caps Lock to be used for any of the i3 shortcuts. In addition, for vim purposes, a quick press and release of the Caps Lock key will act as an escape key press. This is done using a combination of `xmodmap` and `xcape` near the [bottom of the i3 configuration file](# make caps act as left windows key when held (for i3 shortcuts)).

# Windows Line Endings

CRLF line endings wreak havoc in the install scripts and sh files that end up in the virtual machine. For this reason be sure your environment isn't overriding the LF endings with CLRF, which Git for Windows usually does.

To fix this, disable the automatic CLRF handling within your local repository using:

```bash
git config core.autocrlf false
```

To revert damage done by autocrlf, use:

```bash
git rm --cached -r . 
git reset --hard
```