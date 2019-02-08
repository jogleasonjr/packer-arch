## Packer-Arch

Packer script to generate throwaway Arch Linux VMWare images to my liking. These include:
  * VMWare tools (for copy/paste and screen resizing)
  * i3-gaps window manager
  * rofi launcher (try typing 'day' or 'night' into it)
  * compton compositor
  * termite terminal
  * polybar

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
