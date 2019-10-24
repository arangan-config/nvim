let g:vimDirectory = $HOME . '\appdata\Local\nvim\'

call plug#begin(join([g:vimDirectory, 'plugins'],''))

	" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
	Plug 'itchyny/lightline.vim'

	" Any Valid URL is allowed
	Plug 'https://github.com/ervandew/supertab.git'
	
	" On-demand loading	
	Plug 'https://github.com/scrooloose/nerdtree.git', { 'on':  'NERDTreeToggle' }
	Plug 'https://github.com/jeetsukumaran/vim-buffergator.git', { 'on': 'BuffergatorToggle' }
	Plug 'https://github.com/jlanzarotta/bufexplorer.git', { 'on': 'BufExplorerVerticalSplit' }
	Plug 'https://github.com/kien/ctrlp.vim.git', { 'on': ['CtrlPBuffer', 'CtrlPMRUFiles'] }		
	
call plug#end()

set ignorecase
     
"########## Maintain code folding after saving and reloading documents ##########
  " g:vimDirectory/view  -- directory must be created
  "autocmd BufWinLeave .vimrc mkview
  "autocmd BufWinEnter .vimrc silent loadview
  autocmd BufWinLeave .* mkview
  autocmd BufWinEnter .* silent loadview

"########## Look and Feel ##########
  filetype plugin on
  filetype indent on
  syntax on " ######  turn on syntax highlighting
  set cursorline " #### highlight the current line which the cursor is sitting
  highlight CursorLine ctermbg=darkgrey ctermfg=white cterm=none
  set number

"########## Set the status line ########## 
  set laststatus=2
  "set statusline=   " clear the statusline for when vimrc is reloaded
  "set statusline+=%-.3h%m%r%w                      " flags
  "set statusline+=%-3.3n\                      " buffer number
  "set statusline+=%-14.(%c,%l/%L%V%)%<%P        " offset
  "set statusline+=\ \ \ ASCII=%b,Hex=0x%-8B\                   " current char
  "set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
  "set statusline+=%=                           " right align
  "set statusline+=%f\                          " file name
  "set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
  "set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
  "set statusline+=%{&fileformat}]              " file format

"########## Fold Expressions ##########
  set foldenable
  set foldmethod=indent
  set foldlevel=99
  set expandtab " Insert spaces when tab is pressed 
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set smarttab
  "set smartindent  "Better to use filetype indent on
  " :retab " will replace tabs with spaces, expandtab must be set

"########## Basic Options ##########
  set nocompatible " Say bye bye to old vi
  set hidden " Why is this not a default
  set lazyredraw " Don't update the display while executing macros
  set showmode " At least let yourself know what mode you're in
  set showcmd " Show the leader key and other keys at the bottom

  " Enable enhanced command-line completion. Presumes you have compiled
  " with +wildmenu.  See :help 'wildmenu'
  set wildmenu
  set wildmode=full "this is the vim default
  set backspace=indent,eol,start " Allow backspace during insert mode
  set encoding=utf-8
  set termencoding=utf-8
  set listchars=eol:$,tab:→\ ,trail:·
  set nolist
  set switchbuf=useopen,usetab,newtab
  set noerrorbells visualbell t_vb=
  autocmd GUIEnter * set visualbell t_vb=
  
  set splitbelow
  set splitright
  "set swapfile

  set autochdir
  set fileformat=unix
  set fileformats=unix,dos,mac

  "Do not copy stuff to the system clipboard, use leader-P
  if has('unnamedplus')
    set clipboard-=unnamedplus  " Share X windows clipboard.
  else
    set clipboard-=unnamed  " Share system clipboard.
  endif

  set mouse=a
  set wildignore=*.swp,*.bak,*.pyc,*.class,*/.git/*,*/.hg/*,*/.svn/*
  set guioptions-=a "Visual selection should not be automatically copied to clipboard
  set nrformats+=alpha "This allows ctrl+a, ctrl+x to increment/decrement characters along with numbers

"########## Search Options ##########
  ":highlight Search "Displays current 
  set incsearch
  set hlsearch
  hi Search guibg=Yellow
  hi Search guifg=Black
  hi Search ctermbg=Yellow
  hi Search ctermfg=Black
  set gdefault
  set smartcase
  xnoremap <silent> * :call VisualSelection('f')<CR>
  xnoremap <silent> # :call VisualSelection('b')<CR>

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

"########## Custom Key Mappings ########## 
  "########## Leader Key ########## 
    "To display current leader key :let mapleader
    "To display all leader shortcuts  :map <leader>
    "for debugging :verbose map <leader>
    let mapleader = "\<Space>"    
    nnoremap <Space> <nop>
    map <Leader>b :CtrlPBuffer<CR>
    map <Leader>m :CtrlPMRUFiles<CR>
    map <Leader>d "_d
    noremap <Leader>p "+p
    noremap <Leader>P "+P
    xnoremap <Leader>y "+y:echo "Copied to system clipboard"<CR>
    nnoremap <Leader>y "+y
    "nnoremap <Leader>t " This is mapped by tasklist default

   " Let's make it easy to edit this file (mnemonic for the key sequence is " 'e'dit 'v'imrc)
     "nmap <silent> <Leader>te :e $MYVIMRC<cr>
  
   " And to source this file as well (mnemonic for the key sequence is " 's'ource 'v'imrc)
     "nmap <silent> <Leader>ts :so $MYVIMRC<cr>:echo $MYVIMRC "refreshed!"<cr>

  "########## Search mappings ##########
    nnoremap <Leader>S :%s/\<<C-r><C-w>\>/
    nnoremap <Leader>s :%s/<C-r><C-w>/
    nnoremap <Leader>h :%s//<C-r><C-w><C-b><Right><Right><Right>
    xnoremap <Leader>s y:%s/<C-R>"/

  "########## Function Keys ########## 
    map <F2> :NERDTreeToggle<CR>
    let NerdTreeQuitOnOpen = 1
    let NerdTreeIgnore=['\.pyc$','\~$']

  "########## Alt Keys ##########
    nnoremap <A-z> :echo 'Alt z'<CR>
    nnoremap <silent> <A-j> :<C-u>call MoveLineDown()<CR>
    nnoremap <silent> <A-k> :<C-u>call MoveLineUp()<CR>
    inoremap <silent> <A-j> <C-o>:call MoveLineDown()<CR>
    inoremap <silent> <A-k> <C-o>:call MoveLineUp()<CR>
    xnoremap <silent> <A-k> :<C-u>call MoveVisualUp()<CR>
    xnoremap <silent> <A-j> :<C-u>call MoveVisualDown()<CR>
    nmap <silent> <C-Up> <A-k>
    nmap <silent> <C-Down> <A-j>
    "if !g:gui
		"nmap <silent> <A-b> :BuffergatorToggle<cr>
		"nmap <silent> \b :BufExplorerVerticalSplit<Cr>
    "else
    "endif
	nmap <silent> <A-b> :BuffergatorToggle<cr>
	nmap <silent> \b :BufExplorerVerticalSplit<Cr>
	
    nmap <silent> <A-h> 0
    nmap <silent> <A-l> $
    nmap <silent> <A-w> <C-w>q
    nnoremap <silent> <A-\> :nohlsearch<bar>:redraw<cr>
    nnoremap <silent> <backspace> :nohlsearch<bar>:redraw<cr>
    inoremap <C-Backspace> <C-o>x
    "nmap <silent> <C-a> :call IncrementCharacter(getline(".")[col(".") - 1])<cr>

  "Show the registers and marks
    "nmap <silent> <Leader>r :reg<CR>
    nnoremap <A-r> :registers<CR>
    xnoremap <A-r> :<C-u>reg<CR>:normal gv
    inoremap <A-r> <C-o>:reg<CR>
    nnoremap <silent> <A-m> :marks<cr>

  "########## My Mappings ##########
    ":nohlsearch<bar>:redraw<cr>
    "nmap <silent> <esc> :nohlsearch<bar>:echo<cr>
    ":redraw<CR>
    " echo<CR>
    "inoremap <esc> <nop> " this will disable the esc key

    "Paste without copying the replaced text into the default register
    "xnoremap p "_dP
    xnoremap p p:let @" = @0<cr>:<bs>

    "remapping the default keys eg, Q and q keys
      "nmap Q q " Map the original q to capital Q for recording macros
      nnoremap <silent> Q :exe 'norm!'.(virtcol("$")/2)."<bar>"<cr>

    "Adding a new line above and below
    nnoremap <C-Enter> mTo<Esc>`T
    nnoremap <C-S-Enter> mTO<Esc>`T
    inoremap <C-Enter> <C-o>mT<C-o>o<C-o>`T
    inoremap <C-S-Enter> <C-o>mT<C-o>O<C-o>`T


   "########## Control Keys ##########
       nnoremap <silent> <C-\> :set list!<CR>
     " If Ctrl+u or Ctrl+e is pressed in insert mode, then Esc and u will
     " bring back what was accidently deleted
       inoremap <C-u> <C-g>u<C-u>
       inoremap <C-w> <C-g>u<C-w>

     "Map the Control H J K L keys to jump to windows easily
       nnoremap <C-j> <C-w>j
       inoremap <C-j> <C-o><C-w>j
       xnoremap <C-j> <C-w>j
        nnoremap <C-k> <C-w>k
        inoremap <C-k> <C-o><C-w>k
        xnoremap <C-k> <C-w>k
       nnoremap <C-l> <C-w>l
       inoremap <C-l> <C-o><C-w>l
       xnoremap <C-l> <C-w>l
        nnoremap <C-h> <C-w>h
        inoremap <C-h> <C-o><C-w>h
        xnoremap <C-h> <C-w>h

   "Command-line editing mappings
    :cnoremap <C-l> <Right>
    :cnoremap <C-h> <Left>

"########## Turn on/off Certain Plugins and theie default key mappings  ########## 
    "nnoremap <silent> <F10> :TagbarOpenAutoClose<CR>
    "nnoremap <silent> <F9> :TagbarToggle<CR>
    "nnoremap <silent> <F8> :TlistToggle<CR>
   let g:buffergator_suppress_keymaps = 1
   let g:buffergator_autoexpand_on_split = 0 "disable resizing when calling buffergator
   let g:bufExplorerDisableDefaultKeyMapping=1 "disable this otherwise ,Leader B gets in the way

"########## Omni Completion ########## 
  "set omnifunc
  set ofu=syntaxcomplete#Complete
  set completeopt=menuone,menu,longest,preview
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Complete
  
  "CPP/C autocompletion
    ""autocmd FileType cpp set omnifunc=omni#cpp#complete#Main
    "autocmd BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
    "" build tags of your own project with Ctrl-F12
    "map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q <CR>
    "map <C-i> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q <CR>
    "map  :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.vim/commontags
    let OmniCpp_NamespaceSearch = 1
    let OmniCpp_GlobalScopeSearch = 1
    let OmniCpp_ShowAccess = 1
    let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
    let OmniCpp_MayCompleteDot = 1 " autocomplete after .
    let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
    let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
    let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
    "" automatically open and close the popup menu / preview window
    "au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
    set tags+=./tags

  " If you prefer the Omni-Completion tip window to close when a selection is
  " made, these lines close it on movement in insert mode or when leaving
  " insert mode
  autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif
  "inoremap <C-Space> <C-x><C-o>
  "if !has("gui_running")
  "  inoremap <C-@> <C-x><C-o>
  "endif

  let g:SuperTabDefaultCompletionType = "context"
  autocmd FileType *
      \ if &omnifunc != '' |
      \   call SuperTabChain(&omnifunc, "<c-p>") |
      \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
      \ endif

"########## Retain the last position in the document ########## 
  if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif


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


"########## Function Definitions ##########
  "function! IncrementCharacter(char)
  "  let l:chr = char2nr(a:char)
  "  if (l:chr >=65 && l:chr<90) || (l:chr >=97 && l:chr<122)
  "    execute "normal r".nr2char(l:chr+1)
  "  else
  "      "execute ":normal!"
  "  endif
  "endfunction

  function! VisualSelection(direction) range
      let l:saved_reg = @"
      execute "normal! vgvy"

      let l:pattern = escape(@", '\\/.*$^~[]')
      let l:pattern = substitute(l:pattern, "\n$", "", "")

      if a:direction == 'b'
          execute "normal ?" . l:pattern . "^M"
      elseif a:direction == 'gv'
          call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
      elseif a:direction == 'replace'
          call CmdLine("%s" . '/'. l:pattern . '/')
      elseif a:direction == 'f'
          execute "normal /" . l:pattern . "^M"
      endif

      let @/ = l:pattern
      let @" = l:saved_reg
  endfunction

  function! MoveLineUp()
    call MoveLineOrVisualUp(".", "")
  endfunction
  
  function! MoveLineDown()
    call MoveLineOrVisualDown(".", "")
  endfunction
  
  function! MoveVisualUp()
    call MoveLineOrVisualUp("'<", "'<,'>")
    normal gv
  endfunction
  
  function! MoveVisualDown()
    call MoveLineOrVisualDown("'>", "'<,'>")
    normal gv
  endfunction
  
  function! MoveLineOrVisualUp(line_getter, range)
    let l_num = line(a:line_getter)
    if l_num - v:count1 - 1 < 0
      let move_arg = "0"
    else
      let move_arg = a:line_getter." -".(v:count1 + 1)
    endif
    call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
  endfunction
  
  function! MoveLineOrVisualDown(line_getter, range)
    let l_num = line(a:line_getter)
    if l_num + v:count1 > line("$")
      let move_arg = "$"
    else
      let move_arg = a:line_getter." +".v:count1
    endif
    call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
  endfunction
  
  function! MoveLineOrVisualUpOrDown(move_arg)
    let col_num = virtcol(".")
    execute "silent! ".a:move_arg
    execute "normal! ".col_num."|"
  endfunction