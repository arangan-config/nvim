--[[
:let mapleader         -- To display current leader key
:map <leader>          -- To display all leader shortcuts
:verbose map <leader>  -- For debugging
]]

local Global = vim.g
local Keymap = vim.keymap

Global.mapleader = ' '             -- Set the leader key as <SPACE>
Keymap.set({'n','x'}, '<SPACE>','<nop>', {noremap = true})   -- disable the default mapping for the <SPACE> bar both normal and visual mode

Keymap.set('n', '<Leader>w', ':write<CR>')  -- <Leader>-w (Save file)
Keymap.set({'n','x'}, '<Leader>d', '"_dd')         -- <Leader>-d (delete line/selection it to Sinkhole without copying to buffer)

Keymap.set('n', '<Leader>p', '"+p', {noremap = true})
Keymap.set('n', '<Leader>P', '"+P', {noremap = true})

Keymap.set('n', '<Leader>y', '"+Y:echo "Copied to system clipboard"<CR>', {noremap=true})  -- Copy whole line
Keymap.set('x', '<Leader>y', '"+y:echo "Copied to system clipboard"<CR>', {noremap=true})  -- Copy in visual mode, whatever is selected

--Keymap.set('n', '<Leader>t', This is mapped by tasklist default

-- [ Search mappings ]
Keymap.set('n', '<Leader>S', ':%s/\\<<C-r><C-w>\\>/', {noremap = true})
Keymap.set('n', '<Leader>s', ':%s/<C-r><C-w>/', {noremap = true})
Keymap.set('n', '<Leader>h', ':%s//<C-r><C-w><C-b><Right><Right><Right>', {noremap = true})
Keymap.set('x', '<Leader>s', 'y:%s/<C-R>"/', {noremap = true})


--TODO cannot place the <leader> inside that exmode -- currently replaced by space ( leader )
--Keymap.set('n', '<Leader>S', ':map <Leader><cr>', {noremap = true})   -- Print the leader key mappings

-- Let's make it easy to edit this file (mnemonic for the key sequence is " 'e'dit 'v'imrc)
Keymap.set('n', '<Leader>ec', ':e $MYVIMRC<cr>', {silent = true})

-- And to source this file as well (mnemonic for the key sequence is " 's'ource 'v'imrc)
Keymap.set('n', '<Leader>rc', ':luafile $MYVIMRC<cr>:echo $MYVIMRC "refreshed!"<cr>', {silent = true})


