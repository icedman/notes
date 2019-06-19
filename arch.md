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
  29. `$ exit`
  30. `# umount -a`
  31. `# reboot`


###### Post installation steps:
  1. Fix GNOME app issues: `# localectl set-locale LANG="en_US.UTF-8"`
  2. Add to `fstab`:
     `tmpfs   /tmp         tmpfs   nodev,nosuid,size=2G          0  0`
  3. If ssd, add `discard` to `fstab`. Example:
     `UUID=<UUID> /           ext4        defaults,noatime,discard  0 2`



###### Pacman:

  1. Installing a package
    `sudo pacman -S <package name>`

  2. Installing a user-repository package
    `git clone <http://package-report>`
    `cd`
    `makepkg`
    `sudo pacman -U <generated package>`


###### Desktop:
  
  1. install wayland weston xorg-server-xwayland
  2. install gnome gnome-extras
  3. systemctl enable gdm

###### DW1560 wifi

  https://www.archlinux.org/packages/community/x86_64/broadcom-wl-dkms/
  sudo pacman -S broadcom-wl-dkms

###### usb tethering (internet)

  ls /sys/class/net
  dhcpd <interface>

###### touchpad

  install libinput

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
  /etc/modprobe.d/i8k.conf ->editor input-> options i8k force=1