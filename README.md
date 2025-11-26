### `README.md`

````markdown
# 🔧 My Dotfiles

My system configuration files, managed using a **Git Bare Repository**. 
This method allows files to exist in the `$HOME` directory without needing to be symlinked.

## 🚀 Installation on a New Machine

To set up these dotfiles on a fresh machine, follow these steps:

### 1. Prerequisite
Ensure `git` is installed.

### 2. Setup (One-Liner method)
Run the following commands in your terminal. This will clone the repo, backup any existing conflicting config files, and apply the new configuration.

```bash
# 1. Add the repo folder to global ignore to prevent recursion issues
echo ".cfg" >> .gitignore

# 2. Clone the bare repository
git clone --bare [https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git](https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git) $HOME/.cfg

# 3. Define the alias temporarily for the current shell
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# 4. Checkout the content
config checkout
````

### ⚠️ Troubleshooting: "Checkout Failed"

If the checkout command fails, it is likely because you already have default config files (like `.bashrc` or `.zshrc`) in your home folder. Git will not overwrite them blindly.

Run this script to backup your existing files and force the checkout:

```bash
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{} && \
config checkout
```

### 3\. Post-Setup

Once checked out, hide untracked files so `config status` doesn't show your entire Home directory:

```bash
config config --local status.showUntrackedFiles no
```

-----

## 🛠 Usage

I do not use the standard `git` command for this repo. Instead, I use the alias `config`.

### To check status

```bash
config status
```

### To add a new file

```bash
config add .vimrc
```

### To save changes

```bash
config commit -m "Update vim configuration"
config push
```

## 📂 What's Inside?

  * **Shell:** .zshrc / .bashrc
  * **Editor:** .vimrc / .config/nvim
  * **Git:** .gitconfig
  * **Terminal:** .tmux.conf


