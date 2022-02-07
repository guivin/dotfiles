# guivin's dotfiles [![.github/workflows/main.yml](https://github.com/guivin/dotfiles/actions/workflows/main.yml/badge.svg)](https://github.com/guivin/dotfiles/actions/workflows/main.yml)

Here is my daily configuration. I use MacOS, so I can only guarantee dotfiles will work on a Mac even if I use it
sometimes on Linux.

## Installation (on MacOS)

Clone the repository into your home directory

```
$ cd && git clone https://github.com/guivin/dotfiles.git
```

`pyenv` is useful to switch between different python versions without breaking stuffs. You can list all available
python versions with `pyenv install --list`. Next you can define it as default version for the system.

```
$ xcode-select --install
$ brew install openssl readline sqlite3 xz zlib vim most zsh colordiff lesspipe
$ brew install pyenv
$ pyenv install <python_version>
$ pyenv global <python_version>
```

Ensure the current python version is well the one selected:

```
$ python --version
```

Install dotbot:

```
$ python -m pip install --user -r requirements
```

Run dotbot to deploy the dotfiles:

```
dotbot -c install.conf.yml
```

# Thanks to

* [anishathalye](https://github.com/anishathalye) for [dotbot](https://github.com/anishathalye/dotbot)
* [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
