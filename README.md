# My Dotfiles 🖥️
My personal collection of dotfiles and configuration files. This repository is intended to maintain a consistent and personalized development environment across all my machines, regardless of OS.

## 📂 Repository Structure
The repo is organized by application to keep configurations modular and easy to manage. Machine-specific files can be handled within these directories as needed.

```
.
├── komorebi/
│   └── komorebi.json
├── nvim/
│   └── ...
├── git/
│   └── ...
└── ...
```

This structure allows for easy symlinking of configuration files to their required locations in the user's home directory.

## 🚀 Installation
These configurations are meant to be installed by creating symbolic links (symlinks) from the various files to their expected locations in your home directory. This way, any changes made here are automatically reflected in your system's configuration.

### Manual Installation
To install a configuration, create a symlink to the file in this repo to the location on your machine a specific application expects. Here is an example for komorebi on Windows:

#### 1. Clone the Repository

First, clone this repository to a location on your machine. A common choice is C:\Users\YourUser\dotfiles or ~/dotfiles.

#### 2. Create the Symbolic Link

You need to create a link from the komorebi.json file in this repository to the location where Komorebi expects its configuration file.

For windows, open Command Prompt or PowerShell as an Administrator and run the appropriate command.

For Command Prompt (cmd):

```
# DOS

mklink "%USERPROFILE%\komorebi.json" "C:\path\to\your\dotfiles\komorebi\komorebi.json"
```
For PowerShell:

```
# PowerShell

New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\komorebi.json" -Target "C:\path\to\your\dotfiles\komorebi\komorebi.json"
Note: Be sure to replace C:\path\to\your\dotfiles with the actual path to where you cloned the repository.
```
As more configurations are added, the same principle will apply. For Linux or macOS, use `ln -s`:
 
```
# Bash
 
# Example for a future .gitconfig
ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
```