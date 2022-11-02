local Keymap = vim.keymap

Keymap.set({'n','x'}, 'Q', 'q')                    -- Q will record macros (Remap Q to q)
Keymap.set({'n','x'}, 'q', '', {noremap = true})   -- q will no longer record marcos (default mapping removed)


Keymap.set('n', '<backspace>', ':nohlsearch<bar>:redraw<cr>', {noremap = true, silent = true}) -- unhighlight the current search term

--Keymap.set('n', '<esc>', '<nop>', {noremap = true, silent = true}) -- this will disable the esc key


--[[ Alt Keys ]]

Keymap.set('n', '<A-z>', ':echo "Alt-z"<CR>', {noremap = true})

-- Move line down
Keymap.set('n', '<A-j>', ':m .+1<CR>==', {noremap = true, silent = true})
Keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', {noremap = true, silent = true})
Keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", {noremap = true, silent = true})

--Move line up
Keymap.set('n', '<A-k>', ':m .-2<CR>==', {noremap = true, silent = true})
Keymap.set('i', '<A-k>', '<Esc>:m -2<CR>==gi', {noremap = true, silent = true})
Keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", {noremap = true, silent = true})


Keymap.set('n', '<A-w>', ':bwipe<CR>', {noremap = true, silent = true})    -- Close/Wipe the current buffer
Keymap.set('v', '<A-w>', ':<C-w>bwipe<CR>', {noremap = true, silent = true})    -- Close/Wipe the current buffer

Keymap.set('n', '<A-h>', '^', {noremap = true, silent = true})  -- Move to line beginning
Keymap.set('n', '<A-l>', '$', {noremap = true, silent = true})  -- Move to line end

Keymap.set('i', '<A-Backspace>', '<C-o>x', {noremap = true, silent = true})  -- Del key in insert mode
Keymap.set('i', '<A-h>', '<C-o>^', {noremap = true, silent = true})  -- Move to line beginning
Keymap.set('i', '<A-l>', '<C-o>$', {noremap = true, silent = true})  -- Move to line end

-- Show the registers
Keymap.set('n', '<A-r>', ':registers<CR>', {noremap = true, silent = true})
Keymap.set('i', '<A-r>', '<C-o>:reg<CR>', {noremap = true, silent = true})
Keymap.set('v', '<A-r>', ":<C-u>reg<CR>:normal gv", {noremap = true, silent = true})

Keymap.set('n', '<A-m>', ':marks<cr>', {noremap = true, silent = true})   -- Show all marks

Keymap.set('n', '<A-b>', ':buffers<CR>:b<space>', {noremap = true, silent = true}) -- Show all buffers and ready to choose any buffer

Keymap.set('n', '<A-t>', ':enew<CR>', {noremap = true, silent = true}) -- Open a new buffer

--[[ Control Keys ]]
Keymap.set('n', '<C-\\>', ':set list!<CR>', {noremap = true, silent = true}) -- Show/hide special characters (tab, eol etc)

Keymap.set('n', '<C-q>', '<C-q><C-w>o', {noremap = true, silent = true})  --close the split window

--Map the Control H J K L keys to jump to windows easily
Keymap.set('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
Keymap.set('i', '<C-j>', '<C-o><C-w>j', {noremap = true, silent = true})
Keymap.set('x', '<C-j>', "<C-w>j", {noremap = true, silent = true})

Keymap.set('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
Keymap.set('i', '<C-k>', '<C-o><C-w>k', {noremap = true, silent = true})
Keymap.set('x', '<C-k>', "<C-w>k", {noremap = true, silent = true})

Keymap.set('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})
Keymap.set('i', '<C-l>', '<C-o><C-w>l', {noremap = true, silent = true})
Keymap.set('x', '<C-l>', "<C-w>l", {noremap = true, silent = true})

Keymap.set('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
Keymap.set('i', '<C-h>', '<C-o><C-w>h', {noremap = true, silent = true})
Keymap.set('x', '<C-h>', "<C-w>h", {noremap = true, silent = true})

-- Adding a new line above and below
Keymap.set('n', '<C-Enter>', 'mTo<Esc>`T', {noremap = true})
Keymap.set('n', '<C-S-Enter>', 'mTO<Esc>`T', {noremap = true})
Keymap.set('i', '<C-Enter>', '<C-o>mT<C-o>o<C-o>`T', {noremap = true})
Keymap.set('i', '<C-S-Enter>', '<C-o>mT<C-o>O<C-o>`T', {noremap = true})

-- Switch Buffers
Keymap.set({'n','x'}, '<C-S-Tab>', ':b#<cr>', {noremap = true, silent = true})
Keymap.set('i', '<C-S-Tab>', '<Esc>:b#<cr>', {noremap = true, silent = true})

Keymap.set('n', '<C-p>', ':bprev<CR>', {noremap = true, silent = true})
Keymap.set('n', '<C-n>', ':bnext<CR>', {noremap = true, silent = true})
Keymap.set('i', '<C-p>', '<Esc>:bprev<CR>', {noremap = true, silent = true})
Keymap.set('i', '<C-n>', '<Esc>:bnext<CR>', {noremap = true, silent = true})


Keymap.set('x', 'p', '"_dpgv', {noremap = true, silent = true})  -- Paste without copying the replaced text into the default register

--[[
    "nmap <silent> <C-a> :call IncrementCharacter(getline(".")[col(".") - 1])<cr>

    " Map the Q key to move to the middle of current line
	"nnoremap <silent> Q :exe 'norm!'.(virtcol("$")/2)."<bar>"<cr>
]]
