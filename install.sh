# Basic system setup and installation.
brightnessctl s 152
sudo timedatectl set-timezone Asia/Bangkok
sudo grubby --update-kernel=ALL --args="iwlwifi.power_save=0 iwlmvm.power_scheme=1"
sudo dnf install xset NetworkManager-tui kernel-devel kernel-headers dkms fira-code-fonts liberation-fonts -y
sudo dnf update -y && sudo dnf upgrade -y && sudo dnf clean packages -y

sudo rm -rf ~/.config && sudo mv .config ~/.config
sudo rm -rf ~/.local && sudo mv .local ~/.local
sudo rm -rf /etc/polybar && sudo mv polybar /etc/polybar

sudo fc-cache -f && sudo xset s off

# Tools installation.
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

sudo mv virtualbox.repo /etc/yum.repos.d/virtualbox.repo

sudo dnf install polybar feh kitty fastfetch git zsh vim gcc g++ vcpkg rofi picom xclip maim code VirtualBox-7.1 -y

# Enable/Disable openh library and install non-free RPM.
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=0

# Nvidia driver installation and setup.
sudo dnf upgrade --refresh -y
sudo dnf install xrandr akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-libs.i686 -y

sudo akmods --force

sudo reboot

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# sudo mv .zshrc ~/.zshrc
# sudo usermod -a -G vboxusers $USER
