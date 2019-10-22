https://gitlab.com/jsherman82/notes/blob/master/arch.md

###### General Installation procedure (standard install on EFI):
  1. Use wifi-menu to connect to network
  2. Start ssh `# systemctl start sshd`
  3. Connect to machine via SSH
  4. Visit https://www.archlinux.org/mirrorlist/ on another computer, generate mirrorlist
  5. Edit /etc/pacman.d/mirrorlist on the Arch computer and paste the faster servers
  6. Update package indexes: `# pacman -Syyy`
  7. Create efi partition:

       `# fdisk /dev/sda`

          * g (to create an empty GPT partition table)
          * n
          * 1
          * enter
          * +300M
          * t
          * 1 (For EFI)
          * w

  8. Create root partition:

      `# fdisk /dev/sda`

         * n
         * 2
         * enter
         * +30G
         * w

  9. Create home partition:

       `# fdisk /dev/sda`

          * n
          * 3
          * enter
          * enter
          * w

  10. `# mkfs.fat -F32 /dev/sda1`
  11. `# mkfs.ext4 /dev/sda2`
      `# mkfs.ext4 /dev/sda3`
      `# mount /dev/sda2 /mnt`
  12. `# mkdir /mnt/home`
  13. `# mount /dev/sda3 /mnt/home`
  14. `# pacstrap -i /mnt base`
  15. `# genfstab -U -p /mnt >> /mnt/etc/fstab`
  16. `# arch-chroot /mnt`
  17. `# pacman -S base-devel grub efibootmgr dosfstools openssh os-prober mtools linux-headers linux-lts linux-lts-headers`
  18. `# nano /etc/locale.gen` (uncomment en_US.UTF-8)
  19. `# locale-gen`
  20. Enable `root` logon via `ssh`
  21. `# systemctl enable sshd.service`
  22. `# passwd` (for setting root password)
  23. `# mkdir /boot/EFI`
  24. `# mount /dev/sda1 /boot/EFI`
  25. `# grub-install --target=x86_64-efi  --bootloader-id=grub_uefi --recheck`
  26. `# cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo`
  27. `# grub-mkconfig -o /boot/grub/grub.cfg`
  28. Create swap file:
        * `# fallocate -l 2G /swapfile`
        * `# chmod 600 /swapfile`
        * `# mkswap /swapfile`
        * `# echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab`
  
  30. iputils, dhcpcd
  31. `$ exit`
  30. `# umount -a`
  31. `# reboot`


###### Post installation steps:
  1. Fix GNOME app issues: `# localectl set-locale LANG="en_US.UTF-8"`
  2. Add to `fstab`:
     `tmpfs   /tmp         tmpfs   nodev,nosuid,size=2G          0  0`
  3. If ssd, add `discard` to `fstab`. Example:
     `UUID=<UUID> /           ext4        defaults,noatime,discard  0 2`
  4. use fstrim.timer service instead of #3

    		`util-linux`
    		`enable fstrim.timer`

###### swap

  sudo pacman -S systemd-swap
  /etc/systemd/swap.conf
  zram_enabled=1
  swapfc_enabled=1  

  .. use swapfile instead

###### Pacman:

  1. Installing a package

    `sudo pacman -S <package name>`

  2. Installing a user-repository package

    ```sh
    git clone <http://package-report>
    cd
    makepkg
    sudo pacman -U <generated package>
    ```

###### Desktop:

  1. install wayland weston xorg-server-xwayland
  2. install gnome gnome-extras
  3. systemctl enable gdm


###### intel 9260

	linux-firmware

###### DW1560 wifi

  https://www.archlinux.org/packages/community/x86_64/broadcom-wl-dkms/
  sudo pacman -S broadcom-wl-dkms

  bluetooth
  sudo pacman -U bt-dw1560-firmware-1.0-1-any.pkg.tar.xz
  sudo rfkill list
  sudo rfkill unblock bluetooth
  enable bluetooth.service 

###### usb tethering (internet)

  ls /sys/class/net
  dhcpd <interface>

###### touchpad

  install libinput

3-finger-drag

  libinput-gestures (3-finger-fork)

https://github.com/daveriedstra/libinput-gestures/tree/three-finger-drag

```sh
gesture swipebegin all 3 xdotool mousedown 1
gesture swipeend all 3 xdotool mouseup 1
gesture swipeupdate all 3 xdotool mousemove_relative -- x y
```

or

https://extensions.gnome.org/extension/2164/three-finger-window-move/

###### theme

  1. theme: arc
  2. icons: paper
  3. gnome-tweaks

###### Dell XPS 9350

  intel-undervolt (AUR)
  /etc/intel-undervolt.conf
  	-50 to -100 cpu
  	-15 to -30 gpu
  start intel-undervolt.service

  https://aur.archlinux.org/packages/dell-bios-fan-control-git/
  https://aur.archlinux.org/packages/i8kutils/

	additional requirements: acpi tcl

   ```sh
   echo 'i8k' >> /etc/modules-load.d/i8k.conf
   vim /etc/i8kutils/i8kmon.conf
   ```
   
   ```sh
   set config(auto) 1
   ```

###### on viber

  viber .. requires `sudo pacman -S openssl-1.0`

###### more on touchpad

  use gnome-tweaks to configure
  and xorg conf.. http://wayland.freedesktop.org/libinput/doc/
  https://jlk.fjfi.cvut.cz/arch/manpages/man/libinput.4
  https://wiki.archlinux.org/index.php/Libinput

  guide/smaple:
  /usr/share/X11/xorg.conf.d/40-libinput.conf

  ```sh /usr/share/X11/xorg.conf.d/40-libinput.conf```

###### yay

  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si

###### hibernate

Add kernel parameters:
  resume=
  resume_offset=
  generate grub

initramfs
  add resume in HOOK = (..udev..resume)

https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate#Hibernation_into_swap_file
https://wiki.archlinux.org/index.php/Mkinitcpio#Image_creation_and_activation

```sh
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo filefrag -v /swapfile
sudo findmnt -no SOURCE,UUID -T /swapfile
sudo vim /etc/default/grub 
```

```sh
GRUB_CMDLINE_LINUX_DEFAULT="resume=UUID=20562a02-cfa6-42e0-bb9f-5e936ea763d0 resume_offset=34818 quiet splash"
```

  ... resume=UUID=..root
  ... resume_offset=..offset

```
sudo grub-mkconfig -o /boot/grub/grub.cfg```

​```sh
sudo vim /etc/mkinitcpio.conf
```

... HOOKS=(base udev resume autodetect modconf block filesystems keyboard fsck)
 ** add resume after udev 

```sh
sudo mkinitcpio -p linux
```

 ... rebuilds initrmfs 
 ... also linux-lts

```sh
sudo reboot
```

###### brightness

```sh
aurman -S brightnessctl
```

sudo usermod --append --groups video iceman


```sh
% cat /etc/udev/rules.d/backlight.rules
ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", RUN+="/bin/chgrp video /sys/class/backlight/%k/brightness"
ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", RUN+="/bin/chmod g+w /sys/class/backlight/%k/brightness"
```

Add keyboard shortcuts

```sh
brightnessctl s 20+
birhgtnessctl s 20-
```
