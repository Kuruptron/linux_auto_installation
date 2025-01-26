# Linux Auto Installation

This repository provides Bash scripts that automate the installation of common software on Ubuntu-based distributions. You can use these scripts to quickly set up a new Ubuntu installation for development or general desktop use.

---

## Contents

1. [Prerequisites](#prerequisites)  
2. [Scripts](#scripts)  
   - [auto-install-coding-tools.sh](#auto-install-coding-toolssh)  
   - [auto-install-essentials.sh](#auto-install-essentialssh)  
3. [How to Use](#how-to-use)  
4. [Notes & Tips](#notes--tips)  
5. [Contributing](#contributing)  
6. [License](#license)  

---

## Prerequisites

- **Ubuntu** (or a derivative using apt for package management).  
- **Internet connection** (the scripts download packages from the internet).  
- **Sudo privileges** (to install system packages).

---

## Scripts

### auto-install-coding-tools.sh

A Bash script to automate the installation of popular development tools:

- **Git**  
- **GitHub CLI (gh)**  
- **Visual Studio Code** (Snap package)  
- **OpenJDK** (default)  
- **GCC** (via `build-essential`)  
- **Miniconda** (latest version)  

This script will:
1. Update and upgrade the system.
2. Install the required packages (curl, git, snapd, openjdk, build-essential, etc.).
3. Add the official GitHub CLI repository and install `gh`.
4. Install Visual Studio Code from Snap.
5. Download and install Miniconda to `~/miniconda`.
6. Clean up any residual packages.

### auto-install-essentials.sh

A Bash script to install a variety of essential desktop applications:

- **Brave Browser** (official repository)  
- **Telegram Desktop**  
- **Notion (unofficial Snap)**  
- **Blender**  
- **Free Download Manager**  
- **JetBrains Toolbox**  
- **GNOME Tweaks & Extensions**  

This script will:
1. Update and upgrade the system.
2. Add and configure the official Brave Browser repository.
3. Install Telegram Desktop from Ubuntu’s repositories.
4. Install Notion (unofficial snap package), Blender, GNOME Tweaks, GNOME Extensions.
5. Download the latest Free Download Manager `.deb` and install it.
6. Download the JetBrains Toolbox tarball, extract and move it to `/opt`, and create a symlink.  
7. Perform a system cleanup.

---

## How to Use

1. **Clone or Download** this repository:
   ```bash
   git clone https://github.com/Kuruptron/linux_auto_installation.git
   cd linux_auto_installation
