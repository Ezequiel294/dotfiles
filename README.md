# Table of Contents

- [Overview](#overview)
- [Arch Installation in VirtualBox](#arch-installation-in-virtualbox)

# Overview

This is a guide to installing and configuring my Arch setup. I will assume that you are
comfortable with Linux-based operating systems and command line interfaces.

# Arch Installation in VirtualBox

Download VirtualBox:
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

For the Arch ISO image, I recommend having qBtorrent (or any torrent downloader) and downloading the "Torrent for (date)" link.
- [Arch ISO](https://archlinux.org/download/)
- [qBitorrent](https://www.qbittorrent.org/download)

With VirtualBox and the Arch ISO installed, it's time to set up the virtual machine. Click "New", type a name for your virtual machine, and then select the ISO image you just installed and make sure the two last options are "Linux" and "Arch Linux (64-bit)". Now assign the amount of virtual RAM and CPU cores your VM (Virtual Machine) will have. VirtualBox has a guideline below each parameter (I think the colors are self-explanatory). I have 8GB of RAM and 4 cores in my Host, so I dedicated 5120MB of RAM and 2 cores for the Arch VM. Next, set the space for the virtual disc your Arch will have. The minimum is 25GB (512MB for the EFI partition, 20GB for the root, and 4.5GB for the swap partition), Although these values may change depending on who you ask.

 After creating the Arch VM, right-click on it and go to settings. Go to "Display" and set the video memory to max (128MB). Then in "Network", you can choose to leave it to "Attached to: NAT" or change it to "Bridged Adapter" (In NAT, the Arch uses the same IP as your host OS while in Bridged, your Arch will have its own IP address). Click on "OK" to apply the changes.

Now we can start with the Arch Installation; I recommend opening the official guide to help.
- [Arch Installation Guide](https://wiki.archlinux.org/title/Installation_guide)

To start the VM, double-click on it.

Select the first option, "Arch Linux install medium", by pressing the Enter key.

After a lot of green "OK" you should get to the following screen:

![image](https://github.com/Ezequiel294/Arch-Config/assets/119618678/19a71d73-35e0-4f36-bffd-467287bc1954)

This is the terminal that will help you get Arch installed. At this point, your root is the Arch ISO.

First, check you have internet.
```bash
ping google.com
```

With timedatectl, you can check if your time and date are correct
```bash
timedatectl
```

If this is not the case, you can set the time zone
```bash
timedatectl set-timezone [TIMEZONE]
```

Now it's time to create the disk partitions
```bash
cfdisk
```

Select "dos"; now, with "new", I must create an EFI partition and a root partition, but I recommend also having a swap partition (All 3 must be primary partitions). The first one of 512M, and the second one big enough so that only 4.5G are remaining for the third one. With the third partition of 4.5G selected, go to "type" and select "Linux swap / Solaris". To finish, select "write", write "yes" and then quit.

Now, let us format these partitions. The first partition will be for the EFI
```bash
mkfs.vfat -F 32 /dev/sda1
```
The second one is for the root
```bash
mkfs.ext4 /dev/sda2
```

And the third one for the swap
```bash
mkswap /dev/sda3
```

Now we have to mount the partitions
```bash
mount /dev/sda2 /mnt
```
```bash
mount --mkdir /dev/sda1 /mnt/boot
```
```bash
swapon /dev/sda3
```

With that done, if you do a
```bash
lsblk
```
You should get something like this.

![image](https://github.com/Ezequiel294/Arch-Config/assets/119618678/3368f925-1295-4400-a608-512d41343d57)

Now it's time to install the essential packages. According to the arch wiki, only linux, linux-firmware, and base are essential, but I will also add base-devel, grub, virtualbox-guest-utils, and networkmanager. This might take a while.
```bash
pacstrap /mnt linux linux-firmware base base-devel grub virtualbox-guest-utils networkmanager
```

Now generate a fstab file
```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

and with
```bash
cat !$
```
You can check everything looks good.

The next step is to change the root of the system. You should see that "root" is not red anymore
```bash
arch-chroot /mnt
```

Set the time zone
```bash
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
```

Run hwclock to generate /etc/adjtime
```bash
hwclock --systohc
```

Set a password for the root user.
```bash
passwd
```

Create your user with
```bash
useradd -m username
```

and add a password for your user
```bash
passwd username
```

Now add your user to the wheel group
```bash
usermod -aG wheel username
```

Next, install sudo and nano
```bash
pacman -S sudo nano
```

and now edit with nano the file /etc/sudoers
```bash
nano /etc/sudoers
```

Uncomment this line, save, and exit
```bash
# %wheel ALL=(ALL) ALL
```

Edit with nano /etc/locale.gen and uncomment 
```bash
#en_US.UTF-8 UTF-8
```

Generate the locales by running.
```bash
locale-gen
```

Create the locale.conf file
```bash
touch /etc/locale.conf
```
And set the LANG variable using nano to:
```bash
LANG=en_US.UTF-8
```

Now let us configure the boot loader, which is grub
```bash
grub-install /dev/sda
```
and configure it with
```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

We are almost finished. Let us set a hostname (The name of your computer)
```bash
echo "hostname" > /etc/hostname
```

And with this done, edit with nano /etc/hosts to get this
```bash
# Static table lookup for hostnames.
# See hosts(5) for details.

127.0.0.1    localhost
::1          localhost
127.0.0.1    hostname.localhost hostname
```

To finish, write
```bash
exit
```
to go back to the ISO root and then
```bash
shutdown now
```

Now, to be sure, right-click on your Arch VM machine, go to "settings", then to "system", and move the "Hard Disk" to the top of the priorities and then go to "storage", and right-click on the blue disk with the name of the Arch ISO and click on "Remove Attachment". Finish by clicking "OK" to save changes.

When you start your Arch system again, you will find yourself in the grub. Just click "enter" on the fists option. The next step is to log in to your user, and congratulations, this is your system.

You will notice that if you do a 
```bash
ping google.com
```
You won't have internet. This is because you have to enable and start networkmanager
```bash
sudo systemctl enable NetworkManager
```
```bash
sudo systemctl start NetworkManager.service
```

Now you should have internet.

With that out of the way, we can install our graphical interface.
```bash
sudo pacman -S xorg qtile sddm alacritty
```

Before rebooting, you have to enable sddm and the virtual box guest additions
```bash
sudo systemctl enable sddm
```

```bash
sudo systemctl enable vboxservice
```

```bash
reboot
```

Now you will see the login screen of SDDM.

After login in sddm you will get to qtile, which is your desktop environment. 

| Key                  | Action                      |
| -------------------- | --------------------------- |
| **mod + return**     | launch terminal             |
| **mod + k**          | next window                 |
| **mod + j**          | previous window             |
| **mod + w**          | kill window                 |
| **mod + [123456789]** | go to workspace [123456789]|
| **mod + ctrl + r**   | restart qtile               |
| **mod + ctrl + q**   | logout                      |
