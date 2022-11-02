# NeoVIM startup

Use either init.vim or init.lua but not both as neovim will complain about conflicting startup files.

Lua is the better option as it runs much faster than traditional vimscript.

To use Lua, nothing needs to be done. Just compile the packer and enjoy!

To use Vimscript, rename _init.vim to init.vim and delete init.lua

## Lua
:PackerCompile


## Vimscript
:PlugInstall


Lua still lacks many plugins compared to VimScript. There is a way to install Vim Plug inside Lua. Search the web for an answer
