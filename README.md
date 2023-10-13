# Index

- [Overview](#overview)
- [Arch Installation in VirtualBox](#arch-installation-in-virtualbox)
- [Configuration](#configuration)

# Overview

This is a guide to installing and configuring my Arch setup. I will assume that you are
comfortable with Linux-based operating systems, virtual machines, and command line interfaces.

# Arch Installation in VirtualBox

Download VirtualBox and the Arch ISO:
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Arch ISO](https://archlinux.org/download/)

For the Arch virtual machine:
- Do not check "Enable EFI"
- Assign all the video memory possible
- At least 2GB of RAM
- More than 15GB of storage

Now we can start with the Arch Installation; I recommend opening the official guide to help.
- [Arch Installation Guide](https://wiki.archlinux.org/title/Installation_guide)

Start the VM, select the first boot option, and after many "OK" you should get to this:

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

If this is not the case, you can set the time zone. See the official wiki on the syntax for [TIMEZONE].
```bash
timedatectl set-timezone [TIMEZONE]
```

Now it's time to create the disk partitions
```bash
cfdisk
```

Select "dos" if you are indeed in a VM.
Here you make your partitions. You NEED an EFI and a root partition. Manage your home and swap as you wish.

After making the partitions, they have to be formatted. The first partition will be for the EFI
```bash
mkfs.vfat -F 32 /dev/sda1
```
The second one is for the root
```bash
mkfs.ext4 /dev/sda2
```
(Home partition uses the same format)

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

Now it's time to install the essential packages.
```bash
pacstrap /mnt linux linux-firmware base base-devel grub virtualbox-guest-utils networkmanager sudo nano
```

Now generate a fstab file
```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

The next step is to change the root of the system.
```bash
arch-chroot /mnt
```

Set the time zone. Replace Region/City with your region and city (It's the same as with timedatectl).
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

Create your user with:
```bash
useradd -m username
```

and add a password for your user
```bash
passwd username
```

Now add your user to the wheel group so sudo works
```bash
usermod -aG wheel username
```

Now edit with nano the file /etc/sudoers and uncomment this line:
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

And set the LANG variable using nano:
```bash
LANG=en_US.UTF-8
```

Now let us configure the boot loader, which is Grub
```bash
grub-install /dev/sda
```
and configure it with
```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

We are almost finished. Let us set a hostname (The name you want for your computer)
```bash
echo "hostname" > /etc/hostname
```

And with this done, edit with nano /etc/hosts to get this. Replace hostname with your hostname.
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

Now, to be sure, right-click on your Arch VM machine, go to "settings," then to "system," move the "Hard Disk" to the top of the priorities and then go to "storage," and right-click on the blue disk with the name of the Arch ISO and click on "Remove Attachment." Finish by clicking "OK" to save changes.

When you start your Arch system again, you will find yourself in the grub. Just click "enter" on the fists option. The next step is to log in to your user, and congratulations, this is your system.

You will notice that if you do a 
```bash
ping google.com
```
You won't have internet. This is because you have to enable and start NetworkManager
```bash
sudo systemctl enable NetworkManager
```
```bash
sudo systemctl start NetworkManager
```

Now you should have internet.

With that out of the way, we can install our graphical interface.
```bash
sudo pacman -S xorg xorg-xinit qtile sddm alacritty git
```

You have to enable sddm and the VirtualBox guest additions
```bash
sudo systemctl enable vboxservice sddm
```

Now we can reboot
```bash
reboot
```

Now, you will see the login screen of SDDM.
In the top left corner, it says "Qtile Wayland." Change it to just "Qtile".

After logging in sddm, you will get to qtile, your desktop environment. 

These are the basic Qtile key mappings:

| Key                  | Action                      |
| -------------------- | --------------------------- |
| **mod + return**     | launch terminal             |
| **mod + k**          | next window                 |
| **mod + j**          | previous window             |
| **mod + w**          | kill window                 |
| **mod + [123456789]**| go to workspace [123456789]|
| **mod + ctrl + r**   | restart qtile               |
| **mod + ctrl + q**   | logout                      |

# Configuration

To start the configuration process, let's start by cloning my dotfiles repo with a bare clone.
```bash
git clone --bare https://github.com/Ezequiel294/dotfiles .dotfiles
```

To put all the files where they should go, execute the following command.
```bash
git --git-dir $HOME/.dotfiles/ --work-tree $HOME checkout --force
```

This long command is due to the special characteristic of this repo being a bare clone.
But because the .bashrc was replaced by the checkout with a new .bashrc, an alias was set. Now, dotfiles stands for 'git --git-dir $HOME/.dotfiles/ --work-tree $HOME'. So now, to execute git commands for this repo, you use dotfiles (for example: dotfiles pull).

Execute the 'setup.sh' script that will automatically install all needed packages so that the configurations work correctly.
Note that you will be asked several times for things like the password or whether or not you want to perform a specific action. Also, sometimes, you will be asked which of the available packages you want to install. In those cases, I recommend the default one. If you want to have autologin, make sure you type your username and session correctly (at the moment, only 'qtile' works as session).
```bash
bash setup.sh
```

It's highly recommended to reboot after the script has finished if you didn't accept the prompt from the script.
```bash
reboot
```

To set a wallpaper on qtile, you need something like feh or nitrogen. 
Open nitrogen with rofi and select the directory using the preferences button in which your wallpapers are stored. In my case is Pictures/Wallpapers, and the rest is very easy.

To update the .pkg file with all the packages installed in your system, you have to remove the .pkg file and regenerate it
```bash
rm .pkg
pacman -Qqe | tr '\n' ' ' | sed 's/.$//' > .pkg
```

To push the modified repository, you have to use dotfiles instead of git.
```bash
dotfiles push -u origin main
```

