# Ubuntu Development Setup Script

This repository contains a script to set up Ubuntu for development according to specific needs. The script installs various software and tools, and it has been tested on Ubuntu 20.04 and Ubuntu 23.10.

Feel free to modify the script to fit your own needs.

**Credit goes to [Luke Morales](https://github.com/lukemorales) and his [Ubuntu-Dev-Setup](https://github.com/lukemorales/ubuntu-dev-setup) repository.**

**Note: Ruby on Rails installation is currently not working.**

## Features

This script will:

1. Set up Git username and email.
2. Update the repository.
3. Install essential tools: Curl, Neofetch, CopyQ, Git, Python3-pip, getgist.
4. Install development tools: NVM, NodeJS, Yarn, RBENV, Ruby, Bundler, Rails (**Currently not working**).
5. Install programming fonts: Firacode, SF Pro, Monaco.
6. Customize the appearance: macOS themes, icons, wallpapers, Gnome Tweaks Tool.
7. Install development environments: VS Code, Insomnia Core.
8. Install media and utility tools: MPV, OBS, KVM, DBeaver, fzf, Peek, Google Chrome.
9. Add useful aliases.
10. Clean unnecessary packages.
11. Install fun tools: Figlet and Lolcat.

## Prerequisites

- A fresh installation of Ubuntu 20.04 or Ubuntu 23.10.
- Sudo privileges.

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/ubuntu-dev-setup.git
    cd ubuntu-dev-setup
    ```

2. Make the script executable:
    ```sh
    chmod +x setup.sh
    ```

3. Run the script:
    ```sh
    ./setup.sh
    ```

## Usage

Modify the script to suit your needs by editing `setup.sh`. You can add or remove software installations, change configurations, or update settings.

## Aliases

The script adds the following aliases to enhance your command line experience:

- **File and Directory Management**
  - `..` - `cd ..`
  - `...` - `cd ../..`
  - `....` - `cd ../../..`
  - `l` - `ls -lah`
  - `ll` - `ls -l`
  - `la` - `ls -A`
  - `mkdir` - `mkdir -pv`
  - `cp` - `cp -i`
  - `mv` - `mv -i`
  - `rm` - `rm -i`

- **Git Shortcuts**
  - `gco` - `git checkout`
  - `gcb` - `git checkout -b`
  - `gm` - `git merge`
  - `gr` - `git remote -v`
  - `gst` - `git status`
  - `gd` - `git diff`
  - `gds` - `git diff --staged`
  - `glg` - `git log --oneline --graph --decorate`
  - `gup` - `git pull --rebase`
  - `gpr` - `git pull --rebase && git push`
  - `gclean` - `git clean -fd`

- **System and Utilities**
  - `update` - `sudo apt update && sudo apt upgrade -y`
  - `cleanup` - `sudo apt autoremove -y && sudo apt autoclean -y`
  - `reboot` - `sudo reboot`
  - `shutdown` - `sudo shutdown now`
  - `df` - `df -h`
  - `free` - `free -m`

- **Networking**
  - `ipinfo` - `curl ipinfo.io/ip`
  - `myip` - `ip addr show | grep 'inet ' | grep -v '127.0.0.1'`

- **Docker**
  - `dps` - `docker ps`
  - `dpsa` - `docker ps -a`
  - `dbuild` - `docker build -t`
  - `drun` - `docker run -it --rm`
  - `dstop` - `docker stop`
  - `drm` - `docker rm`
  - `dimages` - `docker images`

- **Kubernetes (kubectl)**
  - `k` - `kubectl`
  - `kx` - `kubectl exec -it`
  - `kg` - `kubectl get`
  - `kd` - `kubectl describe`
  - `kl` - `kubectl logs`
  - `kctx` - `kubectl config use-context`
  - `kns` - `kubectl config set-context --current --namespace`

- **Python and Virtual Environments**
  - `venv` - `python3 -m venv`
  - `act` - `source venv/bin/activate`
  - `deact` - `deactivate`

- **Custom Commands**
  - `weather` - `curl wttr.in`
  - `todo` - `nano ~/todo.txt`
  - `timestamp` - `date '+%Y-%m-%d %H:%M:%S'`
  - `stopwatch` - `echo 'Press Ctrl+C to stop'; date +%s | while read start; do date +%s | awk '{print strftime(\"%H:%M:%S\", $1-'$start', 1)}'; sleep 1; done`

- **Zsh Reload**
  - `reload` - `source ~/.zshrc`

- **Aliases for common typos**
  - `mroe` - `more`
  - `kk` - `kubectl`
  - `htop` - `htop -C`

## Contributing

Contributions are welcome! Please open an issue or submit a pull request if you have any suggestions or improvements.

## License

This project is licensed under the MIT License.

## Acknowledgements

- [Luke Morales](https://github.com/lukemorales) for the original [Ubuntu-Dev-Setup](https://github.com/lukemorales/ubuntu-dev-setup) repository.

## Stars and Feedback

If you find this script useful, please consider giving this repository a star. Your feedback is also appreciated!