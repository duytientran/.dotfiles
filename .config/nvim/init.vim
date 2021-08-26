"{{{ Vim vanilla mapping
let mapleader = " " "Mapping leader key
" nnoremap <Leader>le <C-O><C-O>
nnoremap <Leader>so :update<CR>:source ~/.config/nvim/init.vim<CR>:nohlsearch<CR>
nnoremap <silent> <Leader>ss :update<CR>
nnoremap <Leader>sq :update<CR>:bd<CR>
" nnoremap <Leader>sc :set<space>spell<CR>
nnoremap <Leader>su :set<space>nospell<CR>
" unmap    <Leader>qq
" unmap    <Leader>QQ
nnoremap <silent> <Leader>qq :bd!<CR>
nmap <silent> <Leader>cl :nohlsearch<CR>
"Clean extra space between words while ignoring
noremap <silent> <Leader>dws :%s/\(\S\)\s\+\(\S\)/\1 \2/g<CR>:nohlsearch<CR>
"Mapping s and S to delete without registering in register (register in
"blackhole register)
nnoremap s "_diw
nnoremap S "_S
nnoremap x "_x
nnoremap <Leader>c0 :set conceallevel=0<CR>
nnoremap <Leader>c3 :set conceallevel=3<CR>
"}}}

"{{{Vim vanilla configuration
set nomodeline                      "Ignore file’s mode lines; use vimrc configurations instead.
set shell                      "The shell used to execute commands.
let g:loaded_matchparen=1
set notimeout
set nottimeout
set nocompatible                      "Use Vim settings, rather then Vi settings. It’s important to have this on the top of your file, as it influences other options.
set backspace=indent,eol,start                      "Allow backspacing over indention, line breaks and insertion start.
set history=1000                      "Set bigger history of executed commands.
set showcmd                      "Show incomplete commands at the bottom.
set showmode                      "Show current mode at the bottom.
set autoread                      "Automatically re-read files if unmodified inside Vim.
set hidden                      "Manage multiple buffers effectively: the current buffer can be “sent” to the background without writing to disk. When a background buffer becomes current again, marks and undo-history are remembered. See chapter Buffers to understand this better.
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set clipboard=unnamedplus               " Copy paste between vim and everything else
set autochdir                           " Your working directory will always be the same as your working directory
set cursorline                          " Enable highlighting of the current line
set cmdheight=2
set lazyredraw "setting for macro
set title titlestring=
set isfname-== "When using commands like Ctrl-x Ctrl-f for filename completion, do not read equal signs as part of file names, a common nuisance when working with shell scripts
" Display extra whitespace
 " set list listchars=tab:>·,trail:·,nbsp:·
" Spelling check for Filetype
"autocmd FileType markdown setlocal spell


"{{{ Interface configuration
set conceallevel=0
set laststatus=2                      "Always display the status bar.
set ruler                      "Always show cursor position.
set wildmenu                      "Display command line’s tab complete options as a menu.
set tabpagemax=40                      "Maximum number of tab pages that can be opened from the command line.
set cursorline                      "Highlight the line currently under cursor.
set number                      "Show line numbers on the sidebar.
set relativenumber                      "Show line number on the current line and relative numbers on all other lines. Works only if the option above ( number ) is enabled.
augroup toggle_relative_number
  autocmd InsertEnter * :setlocal norelativenumber
  autocmd InsertLeave * :setlocal relativenumber
set noerrorbells                      "Disable beep on errors.
set visualbell                      "Flash the screen instead of beeping on errors.
set mouse=a                      "Enable mouse for scrolling and resizing.
set background=dark                      "Use colors that suit a dark background.
set title                      "Set the window’s title, reflecting the file currently being edited.
"}}}

"{{{ Swap and backup file options
"set noswapfile
" set directory=$HOME/.config/nvim/swp//
" set nobackup
" set nowritebackup
" set nowb
"}}}

"{{{Indentation configuration
set autoindent                      "New lines inherit the indentation of previous lines.
filetype plugin indent on                      "Smart auto indentation (instead of old smartindent option).
set tabstop=4                      "Show existing tab with 4 spaces width.
set shiftwidth=2                      "When indenting with ‘>’, use 2 spaces width.
set expandtab                     "On pressing tab, insert 4 spaces.
set wrap                      "Don’t wrap lines.
set breakindent
set showbreak=
"set formatoptions+=a
set textwidth=80
"}}}

"{{{Search configuration
set incsearch                      "Find the next match as we type the search.
set hlsearch                      "Highlight searches by default.
set ignorecase                      "Ignore case when searching . . .
set smartcase                      "unless you type a capital.
"}}}

"{{{Text rendering configuration
set encoding=utf-8                      "Use an encoding that supports Unicode.
set linebreak                      "Wrap lines at convenient points, avoid wrapping a line in the middle of a word.
set scrolloff=999                      "The number of screen lines to keep above and below the cursor.
set sidescrolloff=5                      "The number of screen columns to keep to the left and right of the cursor.
syntax enable                      "Enable syntax highlighting.
"}}}

"{{{ Miscellaneous configuration
set confirm                      "Display a confirmation dialog when closing an unsaved file.
"}}}

"{{{Vim vanilla undo configuration
set undodir=~/.config/nvim/undodir
if has("persistent_undo")
   let target_path = expand('~/.config/nvim/undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif"}}}

"{{{ Vim vanilla windows navigation configuration
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
"}}}

"{{{ Movement
"Bring next or previous search results to midscreen
nnoremap <expr> n  'Nn'[v:searchforward]
xnoremap <expr> n  'Nn'[v:searchforward]
onoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]
xnoremap <expr> N  'nN'[v:searchforward]
onoremap <expr> N  'nN'[v:searchforward]
nnoremap <A-o> g;
nnoremap <A-i> g,
"}}}


"{{{Vim visual mode mapping
vnoremap . :normal.<CR> " Dot command
vnoremap J :m '>+1<CR>gv=gv " Move visual selection
vnoremap K :m '<-2<CR>gv=gv " Move visual selection
"}}}

"{{{ Vim folding configuration
set foldmethod=marker "Defines the type of folding.
set foldlevel=20 " Large value for opening fold when open a file
let perl_fold=1
let perl_fold_blocks = 1
let sh_fold_enabled=1
let vimsyn_folding='af'
let r_syntax_folding=1
let ruby_fold=1
let php_folding=1
let javascript_fold=1
let xml_syntax_folding=1
"}}}

"{{{Vim template loading
:autocmd BufNewFile *.html 1r ~/.vim/templates/html.tpl
"}}}

"{{{Vim buffer mapping

noremap <leader>bd :bd<CR>      " Close the buffer.
" noremap <C-S-K> :bn<CR>          " Next buffer.
noremap <S-L> :bn<CR>          " Next buffer.
noremap <S-H> :bp<CR>          " Next buffer.
" noremap <leader>nb :bn<CR>          " Next buffer.
" noremap <leader>pb :bp<CR>          " Previous buffer.
" noremap <C-S-J> :bp<CR>          " Previous buffer.
noremap <leader><leader> :b#<CR>          " Toggle to most recently used buffer.
"}}}

"{{{ Others
"clearing registers by wipereg
command! Wipereg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
"}}}

"{{{ Vim vanilla wrap lines movement
" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")
"}}}

"{{{ Abbreviation Configuration
let g:AutoPairsMapSpace=0
" Title: Abbreviation expansions
" Author: Michael Geddes <michael at frog dot wheelycreek dot net>
" Version: 0.1.1
"
" This was created at the request of Marsha Gilliland for her work doing
" Medical Transcription.
"
" As such, if you add an abbreviation such as   wrt=with respect to
" then a corresponding abbreviation Wrt=With respect to is also created.
"
" Usage:
" :Myabbrev {abbrev} {expanded}
" Add an abbreviation of {lhs} to {expanded}
" use ;; to expand an abbreviation that does not already exist... eg:
" typing..
"    mrg ;;
" will prompt for the abbreviation, and then replace mrg with whatever is
" typed... as well as adding it to the persistent list for future.
"
" g:abbrevlist_filename   This is where the abbreviations are stored.
"

if ! exists('g:abbrevlist_filename')
  let g:abbrevlist_filename='/home/arenberg/MEGA/brain_tientran/dot_files/abbrevs.txt'
endif
"
fun! s:AddAbbrev(lhs, rhs)
  exe 'iabb '.a:lhs.' '.a:rhs
  if a:lhs =~# '^[a-z]' && a:rhs =~# '^[a-z]'
    let lhs=substitute(a:lhs, '.*', '\u&','')
    let rhs=substitute(a:rhs, '.*', '\u&','')
    exe 'iabb '.lhs.' '.rhs
  endif
endfun

fun! s:LoadAbbrevs(filename)
  for line in readfile(a:filename)
    let lhs=matchstr(line, '^\s*\zs\k\+\>')
    let rhs=matchstr(line, '^\k\+\>\s\+\zs.\{-}\ze\s*$')
    if lhs !~ '^\s*$' && rhs !~ '^\s*$'
      call s:AddAbbrev(lhs,rhs)
    endif
  endfor
endfun

fun! s:AddAbbrevFile(filename, lhs, rhs)
  exe 'redir >> '.a:filename
  silent echo a:lhs a:rhs
  redir END
  call s:AddAbbrev(a:lhs,a:rhs)
endfun

fun! s:AddMyAbbrev(myab)
  let lhs=matchstr(a:myab,'^\S\+')
  let rhs=matchstr(a:myab,'^\S\+\s\+\zs.\{-}\ze\s*$')
  if rhs =~ '^\s*$'
    echoerr 'Supply abbreviation and expanded text'
  else
    if lhs == '.'
      let lhs=expand('<cword>')
      if lhs == ''
        echoerr 'No word under cursor'
        return
      endif
    endif
    call s:AddAbbrevFile(expand(g:abbrevlist_filename),lhs,rhs)
  endif
endfun

" use Myabbrev {lhs} {rhs} to add an abbreviation
com! -nargs=+ Myabbrev call s:AddMyAbbrev(<q-args>)

" Used by ;; abbreviation to trigger adding an abbreviation
fun! s:InputAbbrev(abblen)
  " Gobble the character
  let ch=nr2char(getchar())
  let c=col('.')-(2+a:abblen)
  let line=getline('.')
  " Find the end
  while c > 0
    if line[c] =~ '\k' | break | endif
    let c-=1
  endwhile
  " Find the start
  let b=c-1
  while b>=0
    if line[b] !~ '\k' | break | endif
    let b -= 1
  endwhile
  let lhs = line[b+1:c]
  " Prompt for the expansion
  let rhs=input(lhs.' expands to>')
  if rhs==''
    return (ch == ' ')?'':ch
  else
    call s:AddAbbrevFile(expand(g:abbrevlist_filename),lhs,rhs)
    return repeat("\<BS>",(col('.')-b)-(2+a:abblen)).rhs.ch
  endif
endfun
"
" If the abbreviation is not recognized - use ;; to trigger to prompt for the
" required expansion.
iabbrev <expr> ;; <SID>InputAbbrev(2)

if filereadable(expand(g:abbrevlist_filename))
  " Load the file if it exists
  call s:LoadAbbrevs(expand(g:abbrevlist_filename))
else
  echo 'Loading defaults'
  " This is an example of usage - and sets up the defaults.
  Myab tp the patient
  Myab IMP IMPRESSION:
endif
"}}}

"{{{ Vim Insert Mode Mapping
imap <c-s> <c-o>:w<cr>
imap <c-v> <c-o>"+p
imap <c-z> <c-o>g-
" imap <c-p> <up>
" imap <c-n> <down>
imap <c-b> <left>
imap <c-f> <right>
" imap <c-k> <c-o>d$
" imap <c-j> <c-o>d$
" imap <c-e> <c-o>A<c-o>:nohlsearch<cr> cannot map due to default behavior
imap <c-a> <c-o>I<c-o>:nohlsearch<cr>
imap <c-e> <c-o>A<c-o>:nohlsearch<cr>
imap <A-f> <Esc>Ea
imap <A-d> <c-o>cE
" imap <A-b> <c-o>B
"Modify Ctr-Y in insert mode which copies above word instead of character on the
"above line
inoremap <expr> <c-y> pumvisible() ? "\<c-y>" : matchstr(getline(line('.')-1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')
"Modify Ctr-E in insert mode which copies above word instead of character on the
"below line
" inoremap <expr> <c-e> pumvisible() ? "\<c-e>" : matchstr(getline(line('.')+1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')
"}}}

"{{{ Vim plugin list
call plug#begin()
Plug 'tpope/vim-repeat' " Work with vim-surround plugin. Just need to press . it will repeat the last action
Plug 'tpope/vim-surround' " Surround with brackets,...
Plug 'kreskij/Repeatable.vim', { 'on': 'Repeatable' } " Put Repeatable before mapping to make it repeatable.
Plug 'sedm0784/vim-you-autocorrect' " Autocorrect words as we type, it would make English better.
Plug 'ron89/thesaurus_query.vim' " Thesaurus dictionary for vim
" Plug 'jalvesaq/zotcite'
Plug 'romainl/vim-qf' " Quickfix window control
Plug 'vim-scripts/Rename2' " Rename the file
Plug 'mbbill/undotree' "Undotree
Plug 'arthurxavierx/vim-caser' " Change case for words
Plug 'sainnhe/everforest'
Plug 'joshdick/onedark.vim' " Theme for vim
Plug 'vim-airline/vim-airline' " Status line for vim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'prettier/vim-prettier', {'do': 'yarn install'} " Make format prettier
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary' " Comment vim
Plug 'frazrepo/vim-rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-peekaboo'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/vim-easyoperator-phrase'
Plug 'haya14busa/vim-easyoperator-line'
" Plug 'tomasiser/vim-code-dark'
" Plug 'rderik/vim-markdown-toc', { 'branch': 'add-anchors-to-headings/drc2r' }
" Plug 'vim-airline/vim-airline-themes'
"-----------Git----------
"Plug 'airblade/vim-gitgutter'
"Plug 'mhinz/vim-signify'
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-rhubarb'
"Plug 'junegunn/gv.vim'
"---------------------------
Plug 'mracos/mermaid.vim' " Support mermaid syntax for vim https://support.typora.io/Draw-Diagrams-With-Markdown/
Plug 'dhruvasagar/vim-table-mode' " For creating tables
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'vimwiki/vimwiki', {'branch': 'dev'}
Plug 'mattn/calendar-vim'
" Plug 'masukomi/vim-markdown-folding'
" Plug 'michal-h21/vim-zettel'
Plug 'preservim/tagbar'
"--------Language packs------
"Plug 'elzr/vim-json'
Plug 'rhysd/reply.vim', { 'on': ['Repl', 'ReplAuto'] }
" Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
" Plug 'gaalcaras/ncm-R'
"--------------------------------
Plug 'dkarter/bullets.vim' " For using bullets, number indents
Plug 'ntpeters/vim-better-whitespace' " For controlling whitespace
Plug 'matze/vim-move' " For moving text
Plug 'dpelle/vim-LanguageTool' " Checking gramar and vocabulary
Plug 'kshenoy/vim-signature'  " Marking the file and move to marks
Plug 'chrisbra/Recover.vim' " For controlling swapfile
Plug 'junegunn/vim-easy-align' " Aligning texts
Plug 'jremmen/vim-ripgrep' " Ripgrep for vim
Plug 'stefandtw/quickfix-reflector.vim' " Change directly on quickfix  list
Plug 'roosta/fzfolds.vim' " Fzf for folds
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-lua/popup.nvim'
" Plug 'windwp/nvim-spectre'
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'brooth/far.vim'
" requires
"---Lua plugins------
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'ray-x/lsp_signature.nvim'
" Plug 'nvim-lua/completion-nvim'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-nvim-lua'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/nvim-compe'
call plug#end()
"}}}

"{{{ Fzf folds Plugin
nnoremap <leader>jf :Folds<CR>
let g:fzfolds_open = 1
"}}}

"{{{ Tagbar plugin
nmap <Leader>tb :TagbarToggle<CR>
"}}}
"
"{{{ Spectre plugin
"nnoremap <leader>S :lua require('spectre').open()<CR>

"search current word
"nnoremap <leader>sw :lua require('spectre').open_visual({select_word=true})<CR>
"vnoremap <leader>s :lua require('spectre').open_visual()<CR>
"Search in current file
"nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
"}}}

"{{{ NNN Plugin

let g:nnn#set_default_mappings = 0 " Disable default mappings
" Start nnn in the current file's directory
" nnoremap <leader>nn :NnnPicker '%:p:h'<CR>
" Opens the nnn window in a split
let g:nnn#layout = 'vnew' " or vnew, tabnew etc.
" Or pass a dictionary with window size
let g:nnn#layout = { 'right': '~30%' } " or right, up, down
" Floating window (neovim latest and vim with patch 8.2.191)
"let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
"}}}

"{{{ FZF Plugin
" Always enable preview window on the right with 60% width
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let g:fzf_layout = { 'down':'40%'}
let g:fzf_preview_window = 'right:50%'
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.config/nvim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
nmap <Leader>fF :Files<space>~<CR>
nmap <Leader>ff :Files<CR>
nmap <Leader>fb :Buffers<CR>
nmap <Leader>ft :BTags<CR>
nmap <Leader>fT :Tags<CR>
nmap <Leader>fl :BLines<CR>
nmap <Leader>fL :Lines<CR>
nmap <Leader>f' :Marks<CR>
nmap <Leader>fr :Rg<Space>
nmap <Leader>fh :History<CR>
nmap <Leader>fH :History/<CR>
nmap <Leader>fc :History:<CR>
nmap <Leader>fC :Commands:<CR>
nmap <Leader>fk :Maps<CR>
" nmap <Leader>kt <plug>(fzf-maps-i)
" nmap <Leader>kl <plug>(fzf-maps-x)
nmap <Leader>fG :Commits<CR>
nmap <Leader>fg :BCommits<CR>
nmap <Leader>fs :Snippets<CR>
nmap <Leader>fe :Filetypes<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" imap <c-f><c-w> <plug>(fzf-complete-word)
" imap <c-f><c-f> <plug>(fzf-complete-file)
imap <c-x><c-p> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-buffer-line)
" imap <c-f><c-k> <plug>(fzf-complete-line)
" inoremap <expr> <c-f><c-f> fzf#vim#complete#path('fd')
" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
" " Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-w> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-x><c-k> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))
"}}}

"{{{ Airline Plugin
let g:airline_powerline_fonts = 1
let g:airline#extensions#fzf#enabled = 1
let g:airline_extensions = ['branch', 'hunks', 'coc', 'tabline']
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
let g:airline_skip_empty_sections = 1
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
" Configure error/warning section to use coc.nvim
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
"let g:airline_theme = '<set to something sexy>'
"}}}

"{{{ Markdown TOC Plugin
" let g:vmt_insert_anchors = 1
let g:vmt_auto_update_on_save = 1
let g:vmt_cycle_list_item_markers = 0
let g:vmt_list_item_char = "*"
let g:vmt_include_headings_before = 0
"}}}

"{{{ Plugin Markdown Preview
nnoremap <Leader>pm :MarkdownPreview<cr>
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
"}}}

"{{{ Vim Markdown Plugin
" Display TOC on quickfix
nnoremap <Leader>tc :Toc<CR>
let g:vim_markdown_folding_level = 6
" To disable conceal regardless of conceallevel setting, add the following to your .vimrc:
" let g:vim_markdown_conceal = 0
" Allow for the TOC window to auto-fit when it's possible for it to shrink. It never increases its default size (half screen), it only shrinks.
let g:vim_markdown_toc_autofit = 1
" Disable math conceal with Latex math syntax enabled
" let g:tex_conceal = ""
" let g:vim_markdown_math = 1
"}}}

"{{{ Ultisnips Plugin
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-f>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsListSnippets= "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="normal"
let g:UltiSnipsSnippetDirectories=['/home/arenberg/MEGA/resource_tientran/linux_tool/snippet/']
nnoremap <Leader>se :UltiSnipsEdit<CR>
nnoremap <Leader>sa :UltiSnipsAddFiletypes<space>
"}}}

"{{{ Rainbow Plugin
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
"}}}

"{{{ Autopair Plugin
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
"}}}

"{{{ Commentaryy Plugin
autocmd FileType markdown  setlocal commentstring=<!--\ %s\ -->
"}}}


"{{{ Vimwiki Plugin
"set nocompatible "Already setup upwards
let g:vimwiki_filetypes = ['markdown']
filetype plugin on
syntax on
" let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_global_ext = 0
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/MEGA/', 'syntax': 'markdown', 'ext': '.md', 'auto_tags': 1}]

" This is to get back the C-I in jumping list
" nmap <F21> <Plug>VimwikiNextLink
nnoremap <Leader>rt :VimwikiRebuildTags<CR>
nnoremap <Leader>gt :VimwikiGenerateTagLinks<space>
" Better to use ripgrep/fzf search rather than vimwiki search which is quite
" slow
nnoremap <Leader>st :VimwikiSearchTags<space>
nnoremap <Leader>sl :VimwikiSearch<space>
nnoremap <Leader>gl :VimwikiGenerateLinks<space>
nnoremap <Leader>vc :VimwikiCheckLinks<space>
nnoremap <Leader>vt :VimwikiTOC<CR>
nnoremap <Leader>bl :VimwikiBackLinks<CR>

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end
"}}}

"{{{ Zettel Plugin
" let g:zettel_options = [{"template" :  "~/MEGA/brain_tientran/dot_files/zettel_template.tpl"}]
" let g:nv_search_paths = ['~/MEGA/']
" let g:zettel_default_mappings = 0
" let g:zettel_format = "%y%m%d%H%M_%title"
" let g:zettel_fzf_command = "rg--column --line-number --ignore-case \ --no-heading --color=always "
" let g:zettel_backlinks_title = "Backlinks"
" let g:zettel_link_format="[%title](%link)"
imap <silent> [[ [[<esc><Plug>ZettelSearchMap
" nmap <Leader>zy <Plug>ZettelYankNameMap
" nmap <Leader>zl <Plug>ZettelReplaceFileWithLink
" nnoremap <Leader>zs :ZettelSearch<cr>
" nnoremap <Leader>zo :ZettelOpen<cr>
" nnoremap <Leader>zI :ZettelInbox<cr>
" nnoremap <Leader>zi :ZettelInsertNote
" nnoremap <Leader>zn :ZettelNew<space>
" nnoremap <Leader>zgl :VimwikiRebuildTags<cr>:ZettelGenerateLinks<space>
" nnoremap <Leader>ts :VimwikiSearchTags<space>
" nnoremap <Leader>zbl :VimwikiRebuildTags<cr>:ZettelBackLinks<cr>
" nnoremap <Leader>vs :VimwikiSearch<space>
" imap <silent> [[ [[<esc><Plug>ZettelSearchMap
" xmap zm <Plug>ZettelNewSelectedMap
" nnoremap <Leader>zgt :VimwikiRebuildTags<cr>:ZettelGenerateTags<space>
"}}}

"{{{ Easymotion Plugins and Accesories
let g:EasyMotion_do_mapping = 0 " Disable default mappings
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcasea= 1
hi Search ctermbg=Yellow
map f <Plug>(easymotion-bd-f)
nmap <leader>wf <Plug>(easymotion-overwin-f)
map t <Plug>(easymotion-bd-t)
map <Leader>ej <Plug>(easymotion-bd-jk)
map <Leader>ek <Plug>(easymotion-eol-k)
let g:EasyOperator_line_do_mapping = 0
map <Leader>el  <Plug>(easyoperator-line-select)
" nmap <Leader>l  <Plug>(easyoperator-line-select)
" omap <Leader>l  <Plug>(easyoperator-line-select)
" xmap <Leader>l  <Plug>(easyoperator-line-select)
" nmap d<Leader>l <Plug>(easyoperator-line-delete)
" nmap y<Leader>l <Plug>(easyoperator-line-yank)
"unmap <Leader>s
let g:EasyOperator_phrase_do_mapping = 0
map <Leader>ep  <Plug>(easyoperator-phrase-select)
" nmap <Leader>p  <Plug>(easyoperator-phrase-select)
" omap <Leader>p  <Plug>(easyoperator-phrase-select)
" xmap <Leader>p  <Plug>(easyoperator-phrase-select)
" nmap d<Leader>p <Plug>(easyoperator-phrase-delete)
" nmap y<Leader>p <Plug>(easyoperator-phrase-yank)
"}}}

"{{{ Whitespace Plugin
""To enable highlighting and stripping whitespace on save by default, use respectively
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
""Ignore filetype
let g:better_whitespace_filetypes_blacklist=[ 'markdown', 'text', 'vimwiki', 'diff', 'gitcommit', 'unite', 'qf', 'help']
"To strip white lines at the end of the file when stripping whitespace
let g:strip_whitelines_at_eof=1
"Show before tabs
let g:show_spaces_that_precede_tabs=0
let g:strip_whitespace_confirm=0
"" highlight whitespace in markdown files, though stripping remains disabled by the blacklist
" autocmd FileType markdown EnableWhitespace
"" Do not modify kernel files, even though their type is not blacklisted and highlighting is enabled
autocmd BufRead /usr/src/linux* DisableStripWhitespaceOnSave
"}}}

"{{{ Tabular plugin
" call the :tabularize command each time you insert a | character
inoremap <silent> <bar>   <bar><esc>:call <sid>align()<cr>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
"}}}

"{{{ Vim Easy Align Plugin
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}

"{{{ Bullet Plugin
let g:bullets_checkbox_markers = ' ○◐●✓'
let g:bullets_enabled_file_types = ['markdown', 'text', 'gitcommit', 'wiki']
"}}}

"{{{ LanguageTool Plugin
"Set symlinks file en.utf-8.add to file ignore.txt of LanguageTool to add ignore
"list. If we use set spell in vim we can use [s or ]s and zg to add to the
"ignore list
let g:languagetool_jar= '/home/arenberg/MEGA/resource_tientran/linux_tool/LanguageTool-5.0/languagetool-commandline.jar'
set spelllang=en_us
nnoremap <Leader>lc :LanguageToolCheck<CR>
nnoremap <Leader>ll :LanguageToolClear<CR>
set spellfile=$HOME/MEGA/brain_tientran/dot_files/en.utf-8.add
hi LanguageToolGrammarError  guisp=blue gui=undercurl guifg=NONE guibg=NONE ctermfg=white ctermbg=blue term=underline cterm=none
hi LanguageToolSpellingError guisp=red  gui=undercurl guifg=NONE guibg=NONE ctermfg=white ctermbg=red  term=underline cterm=none
"}}}

"{{{ Startify Plugin
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_enable_special = 0
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_bookmarks = [
            \ { 'b': '~/Dropbox/brain_tientran/' },
            \ { 'd': '~/Downloads' },
            \ { 'v': '~/.config/nvim/init.vim' },
            \ ]
"}}}

"{{{ Prettier Plugin
nmap <Leader>py <Plug>(Prettier)
" Allow auto formatting for files without "@format" or "@prettier" tag
let g:prettier#autoformat_require_pragma = 0
"}}}

""{{{ Move up and down navigation
" inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
""}}}
"{{{ COC-snippets
" imap <C-l> <Plug>(coc-snippets-expand)
" vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:coc_snippet_next = '<tab>'" inoremap <silent><expr> <C-j>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<C-J>" :
"       \ coc#refresh()

" inoremap <silent><expr> <C-k>
"       \ pumvisible() ? "\<C-p>" :
"       \ <SID>check_back_space() ? "\<C-K>" :
"       \ coc#refresh()

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"}}}
"{{{ COC-explorer
" Add this into coc-settings.json
" // explorer
  "explorer.width": 30,
  "explorer.icon.enableNerdfont": true,
  "explorer.previewAction.onHover": false,
  "explorer.keyMappings": {
    "<cr>": ["expandable?", "expand", "open"],
    "v": "open:vsplit"
    "}}
" nmap <space>ce :CocCommand explorer<CR>
" nmap <space>f :CocCommand explorer --preset floating<CR>
" autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
"}}}
""{{{ COC-Actions
"" Remap for do codeAction of selected region
"function! s:cocActionsOpenFromSelected(type) abort
"  execute 'CocCommand actions.open ' . a:type
"endfunction
"xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
"nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
""}}}
""{{{ COC-General
"nmap <Leader>cc :CocConfig<space><CR>
"nmap <Leader>ol :CocList<space><CR>
"" nnoremap <silent> <Leader>yy  :<C-u>CocList -A --normal yank<cr>
"" nnoremap <silent> <Leader>yc  :CocCommand yank.clean<cr>
"" nnoremap <Leader>rw :CocCommand document.renameCurrentWord<cr>
"nnoremap <Leader>es :CocCommand snippets.editSnippets<cr>
"nnoremap <Leader>eo :CocCommand snippets.openSnippetFiles<cr>
" nnoremap <Leader>bt :CocCommand bookmark.toggle<cr>
" nnoremap <Leader>ba :CocCommand bookmark.annotate<cr>
" nnoremap <Leader>bk :CocCommand bookmark.prev<cr>
" nnoremap <Leader>bj :CocCommand bookmark.next<cr>
" nnoremap <Leader>bc :CocCommand bookmark.clearForCurrentFile<cr>
" nnoremap <Leader>bd :CocCommand bookmark.clearForAllFiles<cr>
"}}}

"{{{ Vim-Tmux Navigation Plugin
" Write all buffers before navigating from Vim to tmux pane
" let g:tmux_navigator_save_on_switch = 2"
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
" Save all vim files when vim focus lost, leave buffer and resize windows. This is for tmux.
:autocmd BufLeave,FocusLost,VimResized * silent! wall
"}}}

"{{{ Calendar Plugin
let g:calendar_no_mappings=0
let g:calendar_monday = 1
let g:calendar_weeknm = 1 " WK01
nnoremap <Leader>cr :Calendar
" let g:calendar_filetype = 'markdown'
" let g:calendar_number_of_months = 5
"}}}

"{{{ Vim-table mode plugin
" Markdown and rest automatically configur
" For Markdown format
" let g:table_mode_corner='|'
" Rest-compatible table use
" let g:table_mode_corner_corner='+'
" let g:table_mode_header_fillchar='='
" For excel coverting:
xnoremap <Leader>ec :'[,']Tableize/\t<CR>
"}}}

"{{{ Undotree Plugin
"Mapping F5 to toggle undo tree
nnoremap <F5> :UndotreeToggle<cr>
"}}}

"{{{ Quickfix Configuration
command! Vlist botright vertical copen | vertical resize 50
nnoremap <leader>v :Vlist<CR>
" Make :grep use ripgrep
" if executable("rg")
"     set grepprg=rg\ --vimgrep\ --no-heading
"     " set grepformat=%f:%l:%c:%m,%f:%l:%m
" endif
"}}}

"{{{ Quickfix vimqf plugin
nmap <Leader>io <Plug>(qf_qf_switch)
nmap <Leader>it <Plug>(qf_qf_toggle)
nmap <Leader>is <Plug>(qf_qf_toggle_stay)
nmap <Leader>ip <Plug>(qf_qf_previous)
nmap <Leader>in <Plug>(qf_qf_next)
nmap <Leader>op <Plug>(qf_loc_previous)
nmap <Leader>on <Plug>(qf_loc_next)
nmap <Leader>ot <Plug>(qf_loc_toggle)
nmap <Leader>os <Plug>(qf_loc_toggle_stay)
" nmap <F6> <Plug>(qf_loc_toggle_stay)

nmap { <Plug>(qf_previous_file)
nmap } <Plug>(qf_next_file)
nmap <buffer> <Left>  <Plug>(qf_older)
nmap <buffer> <Right> <Plug>(qf_newer)
let g:qf_window_bottom = 0
let g:qf_loclist_window_bottom = 0
let g:qf_mapping_ack_style = 1
" s - open entry in a new horizontal window
" v - open entry in a new vertical window
" t - open entry in a new tab
" o - open entry and come back
" O - open entry and close the location/quickfix window
" p - open entry in a preview window
" let g:qf_max_height = 12
"}}}

"{{{ Thesaurus Plugin
nnoremap <Leader>sn  :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap <Leader>sn  y:ThesaurusQueryReplace <C-r>"<CR>
"}}}

"{{{ Vim Theme Onedark Configuration
let g:airline_theme = 'onedark'
hi Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
" onedark.vim override: Don't set a background color when running in a terminal;
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
syntax on
colorscheme onedark
"}}}

"{{{ Everforest colorscheme plugin
""Important!!
"if has('termguicolors')
"  set termguicolors
"endif
"" For dark version.
"set background=dark
"" For light version.
"" set background=light
"" Set contrast.
"" This configuration option should be placed before `colorscheme everforest`.
"" Available values: 'hard', 'medium'(default), 'soft'
"let g:everforest_background = 'hard'
"colorscheme everforest
"}}}

"{{{ Additional Configuration
" Replace space with underscore
map <Leader>sr :s/\%V /_/g
" Use function NormLead for executing Leader inside command line
function! ExecuteLeader(suffix)
  let l:leader = get(g:,"mapleader","\\")

  if l:leader == ' '
    let l:leader = '1' . l:leader
  endif

  execute "normal ".l:leader.a:suffix
endfunction

command! -nargs=1 NormLead call ExecuteLeader(<f-args>)

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

"}}}

"{{{"Vim you autocorrect plugin
nnoremap <silent> <Leader>ae :EnableAutocorrect <CR>
nnoremap <silent> <Leader>ad :DisableAutocorrect <CR>
"}}}

"{{{ Repeatable and vim repeat plugin
" Repeatable plugin: Add Repeat in front of the mapping you want it to repeat.
" vim.repeat plugin: repeat last work with . command
"}}}


"{{{ vim-ripgrep plugin
"Set smartcase search for ripgrep
let g:rg_command = 'rg --vimgrep -S'
let g:rg_highlight = 'True'
"}}}
"{{{ Reply vim plugin
noremap <Leader>ra :ReplAuto <CR>
Repeatable noremap <Leader>rs :ReplSend <CR>
noremap <Leader>rS :ReplStop <CR>
noremap <Leader>rR :ReplRecv <CR>
noremap <Leader>rl :Repl <CR>
"}}}

"{{{Plugin Management Keymaps
nnoremap <Leader>pi :PlugInstall <CR>
nnoremap <Leader>pu :PlugUpdate <CR>
nnoremap <Leader>pc :PlugClean <CR>
"}}}

"{{{ Nvim tree setup plugin
let g:nvim_tree_side = 'left' "left by default
let g:nvim_tree_width = 40 "30 by default, can be width_in_columns or 'width_in_percent%'
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_gitignore = 1 "0 by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_auto_resize = 0 "1 by default, will resize the tree to its saved width when opening a file
let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_hijack_cursor = 0 "1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_update_cwd = 1 "0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

nnoremap <leader>ot :NvimTreeToggle<CR>
nnoremap <leader>tr :NvimTreeRefresh<CR>
nnoremap <leader>tf :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose and NvimTreeFocus are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

let g:nvim_tree_disable_default_keybindings = 1
lua <<EOF
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    -- default mappings
    vim.g.nvim_tree_bindings = {
      { key = {"<CR>", "l", "<2-LeftMouse>"}, cb = tree_cb("edit") },
      { key = {"<2-RightMouse>"},    cb = tree_cb("cd") },
      { key = "<C-v>",                        cb = tree_cb("vsplit") },
      { key = "<C-x>",                        cb = tree_cb("split") },
      { key = "<C-t>",                        cb = tree_cb("tabnew") },
      { key = "<",                            cb = tree_cb("prev_sibling") },
      { key = ">",                            cb = tree_cb("next_sibling") },
      { key = "[",                            cb = tree_cb("parent_node") },
      { key = "<BS>",                         cb = tree_cb("close_node") },
      { key = "h",                       cb = tree_cb("close_node") },
      { key = "<Tab>",                        cb = tree_cb("preview") },
      { key = "gg",                            cb = tree_cb("first_sibling") },
      { key = "G",                            cb = tree_cb("last_sibling") },
      { key = "I",                            cb = tree_cb("toggle_ignored") },
      { key = "H",                            cb = tree_cb("toggle_dotfiles") },
      { key = "R",                            cb = tree_cb("refresh") },
      { key = "a",                            cb = tree_cb("create") },
      { key = "d",                            cb = tree_cb("remove") },
      { key = "r",                            cb = tree_cb("rename") },
      { key = "<C-r>",                        cb = tree_cb("full_rename") },
      { key = "x",                            cb = tree_cb("cut") },
      { key = "c",                            cb = tree_cb("copy") },
      { key = "p",                            cb = tree_cb("paste") },
      { key = "y",                            cb = tree_cb("copy_name") },
      { key = "Y",                            cb = tree_cb("copy_path") },
      { key = "gy",                           cb = tree_cb("copy_absolute_path") },
      { key = "[c",                           cb = tree_cb("prev_git_item") },
      { key = "]c",                           cb = tree_cb("next_git_item") },
      { key = "-",                            cb = tree_cb("dir_up") },
      { key = "e",                            cb = tree_cb("system_open") },
      { key = "q",                            cb = tree_cb("close") },
      { key = "?",                           cb = tree_cb("toggle_help") },
    }
EOF
"}}}
"{{{ Treesiter vim plugin
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  incremental_selection = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  textobjects = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "r",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "html",
    "scss",
    "bash",
    "lua",
    "julia",
    "regex",
    "scala",
    "python",
    "vim",
  },
}
EOF
"}}}
"{{{ Indent plugin
lua <<EOF
  require("indent_blankline").setup {
        char = "|",
        buftype_exclude = {"terminal"},
        space_char = " ",
        use_treesitter = {v = true}
      }
EOF
"}}}
"{{{ LSP plugin

lua <<EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.r_language_server.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.julials.setup{}
require'lspconfig'.diagnosticls.setup{}
EOF
" auto-format
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.r lua vim.lsp.buf.formatting_sync(nil, 100)
"}}}
"{{{ LSPsaga plugin

lua <<EOF
require'lspsaga'.init_lsp_saga()
EOF

" " -- show hover doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" " -- scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

" " -- code action
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

" " -- lsp provider to find the cursor word definition and reference
nnoremap <silent> gf <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

" " -- show signature help
nnoremap <silent> gh <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

" " -- rename
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>

" " -- preview definition
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
" " -- only show diagnostic if cursor is over the area
nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

" " -- jump diagnostic
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>

" " -- float terminal also you can pass the cli command in open_float_terminal function
nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>
tnoremap <silent> <A-d> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>
"}}}
""{{{ Cmp completion plugins

"" Setup global configuration. More on configuration below.
"lua <<EOF
"  local cmp = require('cmp')
"  cmp.setup {
"    snippet = {
"      expand = function(args)
"        -- You must install `vim-vsnip` if you use the following as-is.
"        vim.fn['vsnip#anonymous'](args.body)
"      end
"    },

"-- You must set mapping if you want.
"    mapping = {
"      ['<C-p>'] = cmp.mapping.select_prev_item(),
"      ['<C-n>'] = cmp.mapping.select_next_item(),
"      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
"      ['<C-f>'] = cmp.mapping.scroll_docs(4),
"      ['<C-Space>'] = cmp.mapping.complete(),
"      ['<C-e>'] = cmp.mapping.close(),
"      ['<CR>'] = cmp.mapping.confirm({
"        behavior = cmp.ConfirmBehavior.Insert,
"        select = true,
"      })
"    },

"    -- You should specify your *installed* sources.
"    sources = {
"      { name = 'buffer' },
"    },
"  }
"EOF

"" Setup buffer configuration (nvim-lua source only enables in Lua filetype).
"autocmd FileType lua lua require'cmp'.setup.buffer {
"\   sources = {
"\     { name = 'buffer' },
"\     { name = 'nvim_lua' },
"\   },
"\ }
""}}}
"{{{ nvim-compe autocomplete plugin
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true

inoremap <silent><expr> <C-f> compe#complete()
inoremap <silent><expr> <C-l>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

lua <<EOF
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

require'lspconfig'.rust_analyzer.setup {
  capabilities = capabilities,
}
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn["UltiSnips#CanExpandSnippet"]() == 1 or vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
    return vim.api.nvim_replace_termcodes("<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>", true, true, true)
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
    return vim.api.nvim_replace_termcodes("<C-R>=UltiSnips#JumpBackwards()<CR>", true, true, true)
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end
EOF


"{{{lsp-signature plugin
lua <<EOF
require "lsp_signature".setup()
return M
EOF
"}}}
