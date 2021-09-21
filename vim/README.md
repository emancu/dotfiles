vim-packages
============

Vim 8 added a native way to load third-party packages.

How it works
------------

In `~/.vim` a new folder needs to be created within this folder to hold plugins.
I decided to keep `colors` and `plugins` in different directories, but this is not a requirement.

    mkdir -p ~/.vim/pack/{colors,plugins}/start

Within this folder a further folder `start` is needed to hold plugins. Vim will pick up any packages added to this folder and automatically load the plugins.

Optionally another folder `opt` may be created to hold packages that are not loaded automatically.
Packages added in the `opt` folder may be loaded using

    :packadd packagename


Managing packages
-----------------

The new functionality in vim does not add anything for managing plugins; it just loads them. How you manage plugins is up to you.

Managing packages is directly equivalent to using Pathogen so moving a plugin folder into place, cloning a git repository or using git submodules to move packages into the start folder are all options. I decided to use `git submodules`


### Adding a package

Here is an example of how to add a package using Vim’s native approach to packages and `git submodules`.


    cd ~/.vim/pack/plugins/start
    git submodule init
    git submodule add git@github.com:preservim/tagbar.git
    git add .gitmodules tagbar
    git commit -m "Add tagbar plugin"


### Updating a package ###

To update packages is also just a case of updating git submodules.

    git submodule update --remote --merge
    git commit


### Removing a package ###

Removing a package is just a case of removing the git submodule.

    cd ~/.vim/pack/plugins/start
    git submodule deinit tagbar
    git rm tagbar
    rm -Rf .git/modules/vim/pack/start/tagbar
    git commit -m "Remove tagbar plugin"


Further reading
===============

- [Vim: So long Pathogen, hello native package loading](https://shapeshed.com/vim-packages/)
- [:help packages](https://vimhelp.org/repeat.txt.html#packages)
- [Git Tools - Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
