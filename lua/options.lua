local Opt = vim.opt  -- options
local Wo = vim.wo    -- window options
local Global = vim.g

--[[ Look and Feel ]]
Opt.guifont = "Cousine:h16"

Opt.cursorline = true      -- Highlight the current line which the cursor is sitting
Wo.number = true
Wo.relativenumber = true   -- Set hybrid line numbers
Opt.showcmd = true         -- Show the leader key and other keys at the bottom
Opt.lazyredraw = true      -- Don't update the display while executing macros
Opt.list = false           -- Do not show the listchars like eol:$↲ tab:→▸, trail:·
Opt.listchars= {eol ='$', tab = '→ ' , trail = '·' }  -- List of chars that will be shown
Opt.encoding = 'utf-8'
Opt.termencoding = 'utf-8'
Opt.fileformat = 'unix'
Opt.fileformats = 'unix,dos,mac'
Opt.switchbuf = 'useopen,usetab,newtab'
Opt.textwidth = 140
Opt.splitbelow = true
Opt.splitright = true
Opt.confirm = true      -- Prompts to Save changes if there are unsaved changes present
Opt.belloff = 'all'     -- This is the default anyways
Opt.visualbell = false  -- Visual bell is turned off
Opt.mouse = 'a'         -- Allow visual mode by mouse selection and navigation by clicking
--Opt.clipboard = ''
Opt.wildignore = '*.swp,*.bak,*.pyc,*.class,*.dll,*/.git/*,*/.hg/*,*/.svn/*'  --ignored when expanding wildcards

Opt.expandtab = true -- Insert spaces when tab is pressed
Opt.tabstop = 4
Opt.softtabstop = 4
Opt.shiftwidth = 4
Opt.smarttab = true

--[ Fold Expressions ]
Opt.foldenable = true
Opt.foldmethod = "indent" -- "syntax  "indent can also be used
Opt.foldlevel = 99


--vim.opt.clipboard = 'unnamedplus'   -- this needs xclip or wl-clipboard (wayland) on linux --no need to enable this option, its autoenabled


--[[ Retain the last position in the document ]]
vim.cmd([[
  if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif
]])

    Global["buffergator_suppress_keymaps"] = 1
    Global["buffergator_viewport_split_policy"]="B"
    Global["buffergator_hsplit_size"]=6
    Global["buffergator_window_statusline"]= 0
--[[




"[ Function Keys ] {{{
    "map <F2> :NERDTreeToggle<CR>
    "let NerdTreeQuitOnOpen = 1
    "let NerdTreeIgnore=['\.pyc$','\~$']
" }}}


"[ Turn on/off Certain Plugins and their default key mappings ] {{{
    "nnoremap <silent> <F10> :TagbarOpenAutoClose<CR>
    "nnoremap <silent> <F9> :TagbarToggle<CR>
    "nnoremap <silent> <F8> :TlistToggle<CR>

    "let g:buffergator_autoexpand_on_split = 0 "disable resizing when calling buffergator
	  let g:buffergator_suppress_keymaps = 1
    let g:buffergator_viewport_split_policy="B"
    let g:buffergator_hsplit_size="6"
    nmap <silent> <Leader>b :BuffergatorToggle<cr>
" }}}


" \ 'colorscheme': 'wombat',
    let g:lightline = {
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype', 'fileencoding', 'charvaluehex','fileformat' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }

" "}}}

" [ Save and Restore a session ] {{{
    " This will only save and restore buffers mapping to real files. Not in memory, unsaved buffers
    function! MakeSession()
      let b:sessiondir = $HOME . "\\appdata\\local\\nvim-data\\sessions"
      if (filewritable(b:sessiondir) != 2)
        exe 'silent !mkdir -p ' b:sessiondir
        redraw!
      endif
      let b:filename = b:sessiondir . '\\session.vim'
      exe "mksession! " . b:filename
    endfunction

    function! LoadSession()
      let b:sessiondir = $HOME . "\\appdata\\local\\nvim-data\\sessions"
      let b:sessionfile = b:sessiondir . "\\session.vim"
      if (filereadable(b:sessionfile))
        exe 'source ' b:sessionfile
      else
        echo "No session loaded."
      endif
    endfunction

    "au VimEnter * nested :call LoadSession()
    "au VimLeave * :call MakeSession()

" }}}

" ^^^^^^^^^^^^^ TODO -- Need to refine these and throw away the ones not needed ^^^^^^^^^^^^^^^ {{{

"########## Maintain code folding after saving and reloading documents ##########
  " g:vimDirectory/view  -- directory must be created
  "autocmd BufWinLeave .vimrc mkview
  "autocmd BufWinEnter .vimrc silent loadview
  autocmd BufWinLeave .* mkview
  autocmd BufWinEnter .* silent loadview




"########## Operating System Specific Options ##########
    "h feature-list
    "if has("mac") || has("macunix")
    "  if has("gui_macvim") || has("gui_running")
    "    set macmeta
    "  else
    "    map Ω <A-z>
    "    map ∆ <A-j>
    "    map ˚ <A-k>
    "  endif
    "endif

  "if its mac or linux and in cli mode, map the alt keys
  "if (g:os == 'osx' || g:os == "Linux") && !g:gui
        "exe "set <M-z>=\<Esc>z"
        "exe "set <M-j>=\<Esc>j"
        "exe "set <M-k>=\<Esc>k"
        "exe "set <M-r>=\<Esc>r"
        "exe "set <M-b>=\<Esc>b"
        "exe "set <M-l>=\<Esc>l"
        "exe "set <M-h>=\<Esc>h"
        "exe "set <M-m>=\<Esc>m"
        "exe "set <M-\\>=\<Esc>\\"
        "exe "set <M-w>=\<Esc>w"
        "set ttimeoutlen=50
  "endif

"########## Final options and Look for vimrc.local file ##########
  "if !g:gui
    "if g:os=='Windows'
      "set fileformat=dos
      "if filereadable(expand("~/_vimrc.local"))
        "source ~/_vimrc.local
      "endif
    "elseif g:os=="Linux" || g:os=="osx"
      "set fileformat=unix
      "if filereadable(expand("~/.vimrc.local"))
        "source ~/.vimrc.local
      "endif
    "endif
  "endif
" }}}
]]
