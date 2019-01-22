## Packer-Arch

Packer script to generate throwaway Arch Linux VMWare images to my liking. These include:
  * VMWare tools (for copy/paste and screen resizing)
  * i3wm
  * rofi
  * termite terminal

## Building
```
packer build --only=vmware-iso templates\archlinux-x86_64.json
```

## Running
* Username: `dev`
* Password: `piranha`

Run `startx` to get to desktop.

## Defaults

* **Meta+Enter** -> `terminal`
* **Meta+\\** -> `firefox`
* **Meta+D** -> `rofi` (application launcher)
