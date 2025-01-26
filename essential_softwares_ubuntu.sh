#!/usr/bin/env bash
#
# A Bash script to automate installation of various essential desktop applications on Ubuntu.

set -e  # Exit immediately on any error

echo "============================="
echo " Updating and Upgrading"
echo "============================="
sudo apt-get update -y
sudo apt-get upgrade -y

# -------------------------------------------------------------
# 1. Install Brave Browser (from official repository)
# -------------------------------------------------------------
echo "============================="
echo " Installing Brave Browser"
echo "============================="
sudo apt-get install -y curl apt-transport-https

# Add Brave's official GPG key
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg \
    https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

# Add Brave's APT repository
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=$(dpkg --print-architecture)] \
  https://brave-browser-apt-release.s3.brave.com/ stable main" | \
  sudo tee /etc/apt/sources.list.d/brave-browser-release.list > /dev/null

# Update and install Brave
sudo apt-get update -y
sudo apt-get install -y brave-browser

# -------------------------------------------------------------
# 2. Install Telegram Desktop (APT)
# -------------------------------------------------------------
echo "============================="
echo " Installing Telegram Desktop"
echo "============================="
sudo apt-get install -y telegram-desktop

# -------------------------------------------------------------
# 3. Install Notion (unofficial Snap)
# -------------------------------------------------------------
echo "============================="
echo " Installing Notion (Snap, unofficial)"
echo "============================="
# Make sure snapd is installed
sudo apt-get install -y snapd
sudo snap install notion-snap

# -------------------------------------------------------------
# 4. Install Blender (APT)
# -------------------------------------------------------------
echo "============================="
echo " Installing Blender"
echo "============================="
sudo apt-get install -y blender

# -------------------------------------------------------------
# 5. Install Free Download Manager (from .deb)
# -------------------------------------------------------------
echo "============================="
echo " Installing Free Download Manager"
echo "============================="
wget https://dn3.freedownloadmanager.org/6/latest/fdm.deb -O /tmp/fdm.deb
sudo dpkg -i /tmp/fdm.deb || sudo apt-get install -f -y
rm /tmp/fdm.deb

# -------------------------------------------------------------
# 6. Install JetBrains Toolbox
# -------------------------------------------------------------
echo "============================="
echo " Installing JetBrains Toolbox"
echo "============================="
# Update the URL if newer versions are released:
TOOLBOX_VERSION="1.27.3.14493"
TOOLBOX_TARBALL="jetbrains-toolbox-${TOOLBOX_VERSION}.tar.gz"
DOWNLOAD_URL="https://download.jetbrains.com/toolbox/${TOOLBOX_TARBALL}"

wget -O /tmp/jetbrains-toolbox.tar.gz "$DOWNLOAD_URL"
mkdir -p /tmp/jetbrains-toolbox
tar -zxvf /tmp/jetbrains-toolbox.tar.gz -C /tmp/jetbrains-toolbox

# The extracted folder typically includes the version in the name, e.g., "jetbrains-toolbox-1.27.3.14493"
# Move it to /opt and create a symlink:
JETBRAINS_EXTRACTED="$(find /tmp/jetbrains-toolbox -maxdepth 1 -type d -name 'jetbrains-toolbox-*' | head -n1)"
sudo mkdir -p /opt/jetbrains-toolbox
sudo mv "$JETBRAINS_EXTRACTED"/* /opt/jetbrains-toolbox/

# Create a symlink to run the toolbox from terminal
sudo ln -sf /opt/jetbrains-toolbox/jetbrains-toolbox /usr/local/bin/jetbrains-toolbox

# Cleanup
rm -rf /tmp/jetbrains-toolbox.tar.gz /tmp/jetbrains-toolbox

echo "JetBrains Toolbox installed. Run 'jetbrains-toolbox' to launch."

# -------------------------------------------------------------
# 7. Install GNOME Tweaks & Extensions
# -------------------------------------------------------------
echo "============================="
echo " Installing GNOME Tweaks and Extensions"
echo "============================="
sudo apt-get install -y gnome-tweaks gnome-shell-extensions gnome-shell-extension-manager

# -------------------------------------------------------------
# Cleanup and Finish
# -------------------------------------------------------------
echo "============================="
echo " Final Cleanup"
echo "============================="
sudo apt-get autoremove -y
sudo apt-get autoclean -y

echo "============================="
echo " Installation Complete!"
echo "============================="
echo "All specified essential applications are now installed."
