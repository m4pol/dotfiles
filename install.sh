# [ Set brightness, timezone, disable power saving mode, and brah brah brah ]
brightnessctl s 163
sudo timedatectl set-timezone Asia/Bangkok
sudo grubby --update-kernel=ALL --args="iwlwifi.power_save=0 iwlmvm.power_scheme=1"
sudo dnf install xset NetworkManager-tui kernel-devel -y
sudo dnf update -y && sudo dnf upgrade -y && sudo clean packages -y

# [ Install stuff ]
sudo dnf install polybar feh kitty fastfetch git zsh vim gcc g++ rofi picom stow fira-code-fonts -y
fc-cache -f -v

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# [ Enable openh libary and install non-free RPM ]
sudo dnf config-manager --enable fedora-cisco-openh264
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf config-manager --disable fedora-cisco-openh264

# [ Install Nvidia driver ]
sudo dnf upgrade --refresh -y
sudo dnf install kernel-headers xrandr akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-libs.i686 -y
# [ Check if akmods is installed and reboot ]
sudo akmods --force
sudo reboot

# [ Add Option "PrimaryGPU" "yes" to /etc/X11/xorg.conf.d/nvidia.conf in "OutputClass" section ]
# sudo cp -p /usr/share/X11/xorg.conf.d/nvidia.conf /etc/X11/xorg.conf.d/nvidia.conf
#
# [ Edit "display_setup.sh" according to the Arch linux document https://wiki.archlinux.org/title/NVIDIA_Optimus#Display_managers ]
# touch /etc/lightdm/display_setup.sh && chmod +x /etc/lightdm/display_setup.sh
#
# [ Fix screen tearing ]
# touch /etc/modprobe.d/nvidia-drm-nomodeset.conf && echo "options nvidia-drm modeset=1" > /etc/modprobe.d/nvidia-drm-nomodeset.conf
#
# [ Must turn picom off every time if need to play any games ]
# HD2 Launch option = dx11 / --use-d3d11
