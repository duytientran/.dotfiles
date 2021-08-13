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
" Display extra whitespace
 " set list listchars=tab:>·,trail:·,nbsp:·
" Spelling check for Filetype
"autocmd FileType markdown setlocal spell
"}}}

"{{{ Interface configuration
set conceallevel=0
set laststatus=2                      "Always display the status bar.
set ruler                      "Always show cursor position.
set wildmenu                      "Display command line’s tab complete options as a menu.
set tabpagemax=40                      "Maximum number of tab pages that can be opened from the command line.
colorscheme desert                      "Change color scheme.
"set cursorline                      "Highlight the line currently under cursor.
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
" set undofile " Maintain undo history between sessions
set undodir=~/.config/nvim/undodir
"}}}

"{{{ Vim vanilla windows navigation configuration
" nnoremap <C-H> <C-W><C-H>
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
"}}}

"{{{Vim visual mode mapping
vnoremap . :normal.<CR> " Dot command
vnoremap J :m '>+1<CR>gv=gv " Move visual selection
vnoremap K :m '<-2<CR>gv=gv " Move visual selection
"}}}

"{{{ Vim folding configuration

set foldmethod=marker "Defines the type of folding.
set foldlevel=20 "Open fold when open a file

"}}}

"{{{Vim syntax folding configuration

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
:autocmd BufNewFile *.html 0r ~/.vim/templates/html.tpl
"}}}

"{{{Vim buffer mapping

noremap <leader>db :bd<CR>      " Close the buffer.
" noremap <C-S-K> :bn<CR>          " Next buffer.
noremap <S-L> :bn<CR>          " Next buffer.
noremap <S-H> :bp<CR>          " Next buffer.
" noremap <leader>nb :bn<CR>          " Next buffer.
" noremap <leader>pb :bp<CR>          " Previous buffer.
" noremap <C-S-J> :bp<CR>          " Previous buffer.
noremap <leader>bb :b#<CR>          " Toggle to most recently used buffer.
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
" Plug 'masukomi/vim-markdown-folding'
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
" Plug 'christoomey/vim-tmux-navigator'
Plug 'joshdick/onedark.vim' " Theme for vim
" Plug 'vim-airline/vim-airline' " Status line for vim
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
" Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'numshub/vim-mapping-conflicts'
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
Plug 'dhruvasagar/vim-table-mode' " For creating tables
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'vimwiki/vimwiki', {'branch': 'dev'}
Plug 'mattn/calendar-vim'
" Plug 'michal-h21/vim-zettel'
Plug 'majutsushi/tagbar'
"--------Language packs------
"Plug 'elzr/vim-json'
" Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
"--------------------------------
Plug 'dkarter/bullets.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'matze/vim-move' " For moving text
Plug 'dpelle/vim-LanguageTool'
Plug 'kshenoy/vim-signature'  " Marking the file and move to marks
Plug 'gioele/vim-autoswap' " For controlling swapfile
Plug 'junegunn/vim-easy-align'
Plug 'jremmen/vim-ripgrep'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'roosta/fzfolds.vim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-lua/popup.nvim'
" Plug 'windwp/nvim-spectre'
" Plug 'kyazdani42/nvim-web-devicons'
call plug#end()
"}}}

"{{{ Fzf folds Plugin
nnoremap <leader>jf :Folds<CR>
let g:fzfolds_open = 1
"}}}

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
nmap <Leader>fh :History<CR>
nmap <Leader>ft :BTags<CR>
nmap <Leader>fT :Tags<CR>
nmap <Leader>fl :BLines<CR>
nmap <Leader>fL :Lines<CR>
nmap <Leader>f' :Marks<CR>
nmap <Leader>f/ :Rg<Space>
nmap <Leader>fc :History:<CR>
nmap <Leader>fk :Maps<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <c-x><c-w> <plug>(fzf-complete-word)
imap <c-x><c-p> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
" inoremap <c-x><c-f> <plug>(fzf-complete-file)
"}}}

"{{{ Airline Plugin
let g:airline_powerline_fonts = 1
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
" let g:UltiSnipsExpandTrigger="<c-f>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsListSnippets= "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="normal"
" let g:UltiSnipsSnippetDirectories=['/home/arenberg/MEGA/resource_tientran/linux_tool/snippet/']
" nnoremap <Leader>se :UltiSnipsEdit<CR>
" nnoremap <Leader>sa :UltiSnipsAddFiletypes<space>
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

"{{{ Incsearch Plugin
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
" set hlsearch
" let g:incsearch#auto_nohlsearch = 1
" map n  <Plug>(incsearch-nohl-n)
" map N  <Plug>(incsearch-nohl-N)
" map *  <Plug>(incsearch-nohl-*)
" map #  <Plug>(incsearch-nohl-#)
" map g* <Plug>(incsearch-nohl-g*)
" map g# <Plug>(incsearch-nohl-g#)
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
nmap <F21> <Plug>VimwikiNextLink
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
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
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

"{{{ COC-snippets
imap <C-f> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-n>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-p>'
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

"{{{ Prettier Plugin
nmap <Leader>py <Plug>(Prettier)
" Allow auto formatting for files without "@format" or "@prettier" tag
let g:prettier#autoformat_require_pragma = 0
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
nmap <space>ce :CocCommand explorer<CR>
" nmap <space>f :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
"}}}

"{{{ COC-Actions
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
"}}}

"{{{ COC-General
nmap <Leader>cc :CocConfig<space><CR>
nmap <Leader>ol :CocList<space><CR>
" nnoremap <silent> <Leader>yy  :<C-u>CocList -A --normal yank<cr>
" nnoremap <silent> <Leader>yc  :CocCommand yank.clean<cr>
" nnoremap <Leader>rw :CocCommand document.renameCurrentWord<cr>
 nnoremap <Leader>es :CocCommand snippets.editSnippets<cr>
 nnoremap <Leader>eo :CocCommand snippets.openSnippetFiles<cr>
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
let g:calendar_monday = 1
let g:calendar_weeknm = 1 " WK01
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
nmap <Leader>in  <Plug>(qf_qf_next)
nmap <Leader>op   <Plug>(qf_loc_previous)
nmap <Leader>on   <Plug>(qf_loc_next)
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
colorscheme onedark
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

"{{{ Move up and down navigation
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
"}}}

"{{{ vim-ripgrep plugin
"Set smartcase search for ripgrep
let g:rg_command = 'rg --vimgrep -S'
let g:rg_highlight = 'True'
"}}}
