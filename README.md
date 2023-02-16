# Multiboot_image_selctor

Supported boxes:
vuultimo4k vuuno4kse vuuno4k vusolo4k vuzero4k vuduo4k vuduo4kse (all the vuplus 4k boxes)

Note:
- multiboot over external memory uses subdir like on flash so you don't need to repartition your memory (internal hdd/usb)..
- you will need an image that officially support this solution to install the image into an external memory (internal hdd/usb)
- if you are using OMB, swith to the image in flash, after install kexec multiboot, don't use OMB, at least until we will tell you that you can use it, or we will explain you an alternative mode to use the OMB slot under this solution

TODO:
- update (our) image to support flashing to external memory
- write a plugin for image without a multiboot menu and for machine with trivial partitioning (duo4k, duo4kse and zero4k)
- supports writing to vfd(will be attempted)
- supports writing to TFT display (too difficult, suspended)
- kernel protection (bind kernel partition to the zImage file inside the slot)
- support mipsel boxes (test in progress)

DONE:
- initial modification of ofgwrite
- support duo4k, duo4kse and zero4k
- support booting to flash if usb is missing
- support using a fat 32 formatted usb drive with magic file to choose the slot
- support reading STARTUP_ONCE - will use slot 0 as recovery

COMPATIBILITY:
modified openbh 5.1 in flash on vuultimo4k(a) vuuno4kse(b) vuuno4k(c) vusolo4k(d) vuduo4k(e) vuduo4kse(f) vuzero4k(g)

*** WARNING ***
- guest image on duo4k, duo4kse and zero4k needs patches to activate the multiboot menu. Patches will be provided later, for now you can leave an usb stick with STARTUP_RECOVERY (read above)
- To flash another slot: You must first use the recovery option to get back to Slot 0, for the moment, you can NOT flash another image unless you are in Slot 0. This is a limit that guest image doesn't know yet about this solution. To fix you can copy ofgwrite_bin and replace the one on the guest image.


image	version	status up today	flash	sda(usually hdd if available)	sdb1
openbh	5.1	(1)	untested	untested	untested
openvix	6.2	(1)	boots(a)	untested	untested
openvix	6.3	(1)	boots(a|d)	untested	untested
openatv	6.4	(1)	boots(a) (if no external slot defined)	untested	boots(a) + patch needed(2)
openatv	7.2	(1)	boots(a|b@Ev0)	untested	boots(a)
egami	10.3		boots(a@darog69)	untested	untested
openpli	8.3	(1)(3)	boots(a)	untested	untested
vuplus	3.0	v0.2.1+ (4)	boots(a)		

(1) needs patches to flash external memory
(2) needs patches to start enigma2 and recognize slots.
(3) don't detect slot in flash from multiboot menu (on vuduo4k, vuduo4kse, vuzero4k)
(4) needs to plug an usb stick to restart to slot0

ONLY FOR THE BRAVE :)

TUTORIAL:

- First of all, we recommend you do a full backup of any image you wish to keep, you can restore it into another slot later.
- We then recommend that you reflash the box with a clean installation of OpenBh 5.1, boot the image and just setup the basic options such as resolution and network connection.
- Do not install any settings, channel lists or plugins as this is now your "Recovery image", so it is better to keep this image as clean and as small as possible to maximise the avaliable free space left in flash for other images.

- When the above is done:
- upload the attached zip to /tmp
- open a putty session on your box
Code:

cd /tmp
unzip kexec-multiboot-ultimo4k-v0.2.4.zip (the box name obviously changes depending which Vu+ model you have).
sh install.sh

Now you can reboot, then install your backup image that you previously made or a new image via imagemanager into 1 of the 3 available slots.

- To switch from another Slot to Slot 0: (Slot 0 is your "Recovery image" from above, it's used if you started an unsupported image and you need to switch to the image in flash or if you wish to flash / reflash Slot 1,2, or 3).
open a terminal session
Code:

<v0.2
mkdir -p /tmp/recover
mount /dev/mmcblk0p4 /tmp/recover
echo "kernel=/boot/kernel_auto.bin root=/dev/mmcblk0p4 rootsubdir=linuxrootfs0" > /tmp/recover/STARTUP
reboot

>v0.2:
cd /boot 
cp STARTUP_RECOVERY STARTUP
reboot

The previous method is still valid (except on vuzero4k, vuduo4k, vuduo4kse) but outdated and not required anyway.

With v0.2.x you can create a file STARTUP_RECOVERY on the root folder of a usb flash drive. The file should be empty (blank).
It is supported in the root of a device without a partition (floppy disk mode) or the root of the first partition.
The kexec-multiboot scans for sda, sda1, sdb, sdb1, sdc, scd1, sdd, sdd1. if you have more than 1 device connected.
The file needs to be uppercase and double check that windows doesn't append the .txt extension or something similar.
If you need to switch to the slot0 just plug in the usb stick, reboot or power off, and finally remove the stick after the reboot is complete.

- To recover the box if something goes wrong and completely remove kexec-multiboot without loosing the flash image:
- Put on your usb stick /vuplus/ultimo4k/kernel_auto.bin from your installed image and reflash it
- Boot your box, don't worry if enigma won't start and connect to it with putty or an ftp client and delete /STARTUP*
- Remove /boot/kernel_auto.bin /zImage
- Remove /linuxrootfsX folders
- Reboot your box

- To recover the box if something goes really wrong (you will loose all the box content)
- reflash openbh by unpacking the installation file into an usb drive formatted FAT32 as usual.

- Known Issues:
- Currently unable to use imagemanager to do a full backup of an image from Slot 1,2,3*
- * we do have a fix for this, but currently it requires you manually replacing the file and would only work for our image anyway.

- Finally:
- Keep in mind, that if you decide at any point to reflash the box in the traditional way (usb stick and power button), then you will wipe ALL IMAGES from the flash of your box.

Changelog:
2023-01-18 - initial basic support for ultimo4k package (v0.1)
2023-01-19 - added support for uno4kse and refreshed ultimo4k package (v0.1.1) ultimo4k have no improvement.. just aligned some configurations
2023-01-20 - added support for uno4k, solo4k, added simple protection to avoid flashing the kernel to a wrong box
2023-01-23 - v0.2.1 implemented reading of STARTUP_RECOVERY from usb drive to force switching to slot0, implemented reboot to recovery in multiboot menu of guests, support use of custom initrd (for developers), fix boot of vuplus-derivated images, (vuplus, VTI, BH), released zero4k, duo4k and duo4kse, v0.2.2 - fixes openpli bootmenu (no duo4k/se zero4k)
2023-01-24 - v0.2.3 working at usb flashing support
2023-01-28 - v0.2.4 fixed small bug that caused enigma2 crash for some users
