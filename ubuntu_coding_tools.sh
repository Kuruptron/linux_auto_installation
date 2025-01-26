#!/usr/bin/env bash
#
# A Bash script to automate installation of common coding tools on Ubuntu.

set -e  # Exit immediately on error

echo "============================="
echo " Updating and Upgrading"
echo "============================="
sudo apt-get update -y
sudo apt-get upgrade -y

echo "============================="
echo " Installing Base Packages"
echo "============================="
sudo apt-get install -y curl wget git default-jdk build-essential snapd

echo "============================="
echo " Installing GitHub CLI (gh)"
echo "============================="

# If GitHub CLI is already in your Ubuntu repositories, you can skip adding the official GitHub repo:
# For older Ubuntu versions or guaranteed latest GH version, use the official GitHub repo steps below:

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
  | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt-get update -y
sudo apt-get install -y gh

echo "============================="
echo " Installing Visual Studio Code (Snap)"
echo "============================="
sudo snap install code --classic

echo "============================="
echo " Installing Miniconda"
echo "============================="
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh
chmod +x /tmp/miniconda.sh

# -b = run installer in batch mode (no manual input), -p = installation prefix
bash /tmp/miniconda.sh -b -p "$HOME/miniconda"

# Initialize conda for current user (optional)
"$HOME/miniconda/bin/conda" init bash

# Optionally remove the installer script
rm /tmp/miniconda.sh

# Export conda path (for immediate use in this session)
export PATH="$HOME/miniconda/bin:$PATH"

echo "============================="
echo " Cleaning Up"
echo "============================="
sudo apt-get autoremove -y
sudo apt-get autoclean -y

echo "============================="
echo " Installation Complete!"
echo "============================="
echo "Close and reopen your terminal or run 'source ~/.bashrc' to activate conda."
