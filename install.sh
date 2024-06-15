# [ "pavucontrol" for audio manager ]
# [ "thunar" for file manager ]

mkdir Projects && mkdir Pictures/Wallpapers
brightnessctl s 163
sudo timedatectl set-timezone Asia/Bangkok
sudo grubby --update-kernel=ALL --args="iwlwifi.power_save=0 iwlmvm.power_scheme=1"

sudo dnf install xset kernel-devel -y

sudo dnf update -y && sudo dnf upgrade -y && sudo clean packages -y

sudo dnf install NetworkManager-tui -y

# [ Config DNS of IPv4 to Google DNS server then reboot ]

sudo dnf install polybar feh kitty fastfetch git zsh vim gcc g++ rofi picom stow fira-code-fonts -y
fc-cache -f -v

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# [ Retrieve and enable non-free fedora repo ]

sudo dnf config-manager --enable fedora-cisco-openh264
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y


# [ Nividia driver install ]

sudo dnf upgrade --refresh -y

sudo dnf install kernel-headers xrandr akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-libs.i686 -y

sudo akmods --force
sudo dracut --force

sudo reboot

# [ Add Option "PrimaryGPU" "yes" to /etc/X11/xorg.conf.d/nvidia.conf in "OutputClass" section ]
# sudo cp -p /usr/share/X11/xorg.conf.d/nvidia.conf /etc/X11/xorg.conf.d/nvidia.conf
#
# [ Edit "display_setup.sh" according to the ARCH document https://wiki.archlinux.org/title/NVIDIA_Optimus#Display_managers ]
# touch /etc/lightdm/display_setup.sh && chmod +x /etc/lightdm/display_setup.sh
#
# [ Fix screen tearing ]
# touch /etc/modprobe.d/nvidia-drm-nomodeset.conf && echo "options nvidia-drm modeset=1" > nvidia-drm-nomodeset.conf
#
# [About the picom, must turn it off every time if need to play any games]
# HD2 Launch option = dx11 / --use-d3d11
