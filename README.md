meh vim stuff
=============
My vim environment.

After cloning the repo remember to run the following:

```sh
git submodule init
git submodule update
git submodule foreach --recursive git submodule init
git submodule foreach --recursive git submodule update
```

To use it this just do:

```sh
ln -s /path/to/this/repo/vimrc ~/.vimrc
ln -s /path/to/this/repo ~/.vim
```
