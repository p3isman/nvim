if exists('g:vscode')
  call plug#begin("~/.vim/plugged")
      Plug 'tpope/vim-surround'
      Plug 'scrooloose/nerdcommenter'
      Plug 'easymotion/vim-easymotion'
      Plug 'justinmk/vim-sneak'
  call plug#end()

  "Config Section
  let mapleader = " " " Set map leader to Space

  " Easy motion
  nmap <Leader>s <Plug>(easymotion-s2)

else
  call plug#begin("~/.vim/plugged")
      Plug 'scrooloose/nerdtree'
      Plug 'ryanoasis/vim-devicons'
      Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
      Plug 'junegunn/fzf.vim'
      Plug 'pangloss/vim-javascript'
      Plug 'tpope/vim-surround'
      Plug 'jiangmiao/auto-pairs'
      Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'
      Plug 'tpope/vim-fugitive'
      Plug 'scrooloose/nerdcommenter'
      Plug 'leafgarland/typescript-vim'
      Plug 'easymotion/vim-easymotion'
      Plug 'jonathanfilip/vim-lucius'

      " FLUTTER
      Plug 'natebosch/vim-lsc'
      Plug 'natebosch/vim-lsc-dart'
      Plug 'dart-lang/dart-vim-plugin'
      Plug 'thosakwe/vim-flutter'

      Plug 'alvan/vim-closetag'
      Plug 'mhinz/vim-startify'
  call plug#end()

  "Config Section
  let mapleader = " " " Set map leader to Space
  set mouse=a " Allow mouse to interact with text
  set clipboard=unnamed
  set nu
  set rnu
  set nowrap
  set nohlsearch
  set expandtab
  set shiftwidth=2
  set tabstop=2
  set noshowmode
  if (has("termguicolors"))
  set termguicolors
  endif
  syntax enable

  colorscheme lucius
  hi Normal guibg=NONE ctermbg=NONE

  " Default vim-lsc mappings
  let g:lsc_auto_map = v:true

  " NERDTree
  let g:NERDTreeShowHidden = 1
  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeIgnore = []
  let g:NERDTreeStatusline = ''

  " Automaticaly close nvim if NERDTree is only thing left open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " Toggle
  nnoremap <silent> <C-b> :NERDTreeToggle<CR>

  " open new split panes to right and below
  set splitright
  set splitbelow

  " start terminal in insert mode
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif

  " open terminal on ctrl+n
  function! OpenTerminal()
    split term://bash
    resize 10
  endfunction
  nnoremap <c-n> :call OpenTerminal()<CR>

  " use Ctrl+hjkl to move between split/vsplit panels
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " Fuzzy file finder
  nnoremap <C-p> :FZF<CR>
  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'
    \}

  " use <tab> for trigger completion and navigate to the next complete item
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Easy motion
  nmap <Leader>s <Plug>(easymotion-s2)

  " Save and quit
  nmap <Leader>w :w<CR>
  nmap <Leader>q :q<CR>

  " Autoclose tags
  " filenames like *.xml, *.html, *.xhtml, ...
  " These are the file extensions where this plugin is enabled.
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.ts,*.tsx'

  " filenames like *.xml, *.xhtml, ...
  " This will make the list of non-closing tags self-closing in the specified files.
  let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.ts,*.tsx'

  " filetypes like xml, html, xhtml, ...
  " These are the file types where this plugin is enabled.
  let g:closetag_filetypes = 'html,xhtml,phtml,jsx,js,ts,tsx'

  " filetypes like xml, xhtml, ...
  " This will make the list of non-closing tags self-closing in the specified files.
  let g:closetag_xhtml_filetypes = 'xhtml,jsx,js,ts,tsx'

  " integer value [0|1]
  " This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
  let g:closetag_emptyTags_caseSensitive = 1

  " dict
  " Disables auto-close if not in a "valid" region (based on filetype)
  let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
      \ }

  " Shortcut for closing tags, default is '>'
  let g:closetag_shortcut = '>'

  " Add > at current position without closing the current tag, default is ''
  let g:closetag_close_shortcut = '<leader>>'

  " Run Flutter Project
  nnoremap <leader>fr :FlutterRun<CR>
      " ordinary neovim
endif

