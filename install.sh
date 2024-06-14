# "pavucontrol" for audio manager
# "thunar" for file manager

mkdir Projects && mkdir Pictures/Wallpapers
brightnessctl s 163
sudo timedatectl set-timezone Asia/Bangkok

sudo dnf install kernel-devel -y

sudo dnf update -y && sudo dnf upgrade -y && sudo clean packages -y

sudo dnf install NetworkManager-tui -y

# Config DNS of IPv4 to Google DNS server then reboot

sudo dnf install polybar feh kitty fastfetch git zsh vim gcc g++ rofi picom stow -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Nividia driver install

sudo dnf config-manager --enable fedora-cisco-openh264
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf upgrade --refresh -y

sudo dnf install kernel-headers xrandr akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-libs.i686 -y

sudo akmods --force
sudo dracut --force

sudo reboot
