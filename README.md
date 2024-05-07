## Hello NVIM


#### Install NeoVim

'''
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
'''


#### Configure NeoVim

Step 1: create and edit `init.vim`

```
mkdir ~/.config/nvim
touch init.vim
```


Step 2: Install vim-plug

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Step 3: Install plugins

Run `:PlugInstall` in NeoVim

Step 4: Install `coc.nvim`

```
:Plug 'neoclide/coc.nvim', {'branch': 'release'}

cd ~/.local/nvim/plugged/coc.nvim
npm ci
```

