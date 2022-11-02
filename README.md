# NeoVIM startup

Use either init.vim or init.lua but not both as neovim will complain about conflicting startup files.

Lua is the better option as it runs much faster than traditional vimscript.

To use Lua, nothing needs to be done. Just compile the packer and enjoy!

To use Vimscript, rename _init.vim to init.vim and delete init.lua

## Lua
`:PackerCompile`


## Vimscript
`:PlugInstall`


Lua still lacks many plugins compared to VimScript. There is a way to install Vim Plug inside Lua. Search the web for an answer

Currently, i need a plugin called BufferGator   
There is no native Lua plugin so, to manually install this  
`git clone https://github.com/jeetsukumaran/vim-buffergator.git`  
  

#### On Linux

Create a directory `~/.local/share/nvim/site/plugin` and clone into this.  
If the above wont work, then try this directory `~/.local/share/nvim/site/pack/plugin/start`

#### on Windows

Create a directory and clone into this.

`stdpath("config")`.  |$XDG_CONFIG_HOME|

Data home directory, for plugins installed by user.  
Given by `stdpath("data")/site`.  |$XDG_DATA_HOME|  

:help 'runtimepath' for more detailed information.  

### Try these commands to check if the plugin is loading correctly or not.
`:scriptnames`            : list all plugins, _vimrcs loaded (super)  
`:verbose set history?`   : reveals value of history and where set  
`:function`               : list functions  
`:func SearchCompl`       : List particular function


This can reveal the various locations of the plugins that nvim looks into
`:set runtimepath?`
