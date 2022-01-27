armbian

/boot/armbianEnv.txt

console=custom-both
consoleargs=console=ttyS0,115200 console=ttyS1 console=ttyGS0

/lib/systemd/system/getty.target.wants/getty-static.service 

ExecStart=/bin/systemctl --no-block start getty@ttyGS0 getty@tty2.service getty@tty3.service getty@tty4.service getty@tty5.service getty@tty6.service



All credit goes to balbes150 over on freaktab for this epic port of Armbian Ubuntu/Debian desktop for S905,S905X,S912 Amlogic TV box's.

The system runs significantly faster than the S805 port we did a install guide for, a few days ago.

This guides a little long, it cover the installation guide as well as a intro into how the system performs, including running the system from internal storage.

S905 / S905X / S912 Linux Image - https://yadi.sk/d/5_32km_EsCV2A/ARMBIAN - These are compatible with all 3 amlogic processors mentioned.

Win32disk - http://mxqproject.com/files/win32disk/ - Can also use Rufus etc as well as downloading from other sources.

Free unzip tool, 7zip - http://www.7-zip.org/download.html - can also use winzip etc

Exact DTB i used for MXQPRO S905 - Write IMG to SD card and enter the folder named DTB - File is named - gxbb_p201.dtb - Rename to dtb.img




Armbian Forum https://goo.gl/CfowrP

Armbian Image https://yadi.sk/d/pHxaRAs-tZiei



Generic Backup/ Restore
If you are root you can backup/ restore all partitions (not only recovery) with native tools.

To list all mountable partitions and block devices use find and grep

adb shell
su
find /dev | grep by-name$
On my system I get /dev/block/platform/soc/1d84000.ufshc/by-name back (this is very device specific and yours may look different).

Now You can list ls this path to show all mountable partitions.

ls -al --color /dev/block/platform/soc/1d84000.ufshc/by-name/
Or all in one command

ls -al --color $(find /dev|grep by-name$)
Backup
Armed with this information you can, as root, backup all partitions. Just use the dd (part of every android toolboox/ toyboox e.g.:

dd if=/dev/block/platform/soc/1d84000.ufshc/by-name/recovery of=/sdcard/Download/recovery.img.dd
Restore
Warning Data lost possible! Don't use until You understand all dd parameter.

In many cases you can also restore with the dd tool, e.g:

dd if=/sdcard/Download/recovery.img.dd of=/dev/block/platform/soc/1d84000.ufshc/recovery
share  improve this answer  follow 




Bootloader mode (Fastboot mode) allows you to do various amazing things. You can flash any partition using this mode. If you are familiar with the android stuff these are .img that can be flashed via fastboot mode.

In some devices, you need to flash recovery image using ADB and Fastboot. Majorly this applies to the device which has Google’s stock UI such as nexus, pixel, most Motorola device etc. You can learn what is custom recovery from our previous article.

Here is the complete tutorial how you can flash recovery via fastboot on your Android device.


Before taking any step further we request you to take backup of Android device. This will be very useful if something goes wrong while flashing. In almost all cases everything will work out fine.

Requirements
Recovery Image.
Android device drivers.
ADB and Fastboot Drivers.
If Bootloader available then it should be unlocked. Read: Unlock HTC Bootloader, Unlock Sony Bootloader.
USB Cable.
Windows PC/Laptop.
An Android Device. ;)
Steps To Flash Recovery Image Using ADB and Fastboot
Install your device drivers and Minimal ADB and Fastboot on your computer.
Enable USB Debugging On Your Device.(Go To Settings -> Developers Option -> Tick The USB Debugging Option)(In Case You Does Not Find Developer Options In Your Device Then Go To Settings -> About -> Tap On Build Number Many Times…A Pop Will Show That You Are Now A Developer….)
Connect your device to your computer via USB cable.
Open Minimal ADB and Fastboot on your computer.Minimal ADB & Fastboot
To check whether your device is detected or not by the computer typeADB Devices
adb devices
Reboot into bootloader mode using the following command.
adb reboot bootloader
Copy recovery image to C drive and rename recovery image to recovery.img.
Type the following command to flash recovery image.
fastboot flash recovery c:\recovery.img
Now type the following command to reboot bootloader.
fastboot reboot-bootloader
and then type the following command to erase cache.
fastboot erase cache
Now type the following command to reboot your device.
fastboot reboot
Now disconnect your device.
You have successfully flashed recovery image to your Android device.
If you are looking forward to rooting your Android device then you can easily Root Android Device Using Custom Recovery.



If you still have Android installed, you can boot CE from USB/SD and type dd if=/dev/dtb | gzip > /storage/downloads/dtb.img.gz on SSH, you can then download it from the Downloads folder.
