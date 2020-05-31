"Plug-ins
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin('~/.config/nvim/plugged')

" Tools
    Plug 'junegunn/goyo.vim'
    Plug 'borissov/fugitive-gitea'
    Plug 'vifm/vifm.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-commentary'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'vimwiki/vimwiki' " ViMWIKI
    Plug 'tpope/vim-surround'   " T-Pope / Comment out code in a variety of langs
    Plug 'sirver/ultisnips'     " Code Snippets Engine
    Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
    Plug 'voldikss/vim-floaterm'

" Syntax
    Plug 'PotatoesMaster/i3-vim-syntax' " i3 Config Syntax highlighting
    Plug 'tpope/vim-markdown'   " T-Pope / For markdown fenced langs syntax highlighting
    Plug 'ap/vim-css-color' "Displays a preview of colors with CSS 
    Plug 'vim-scripts/fountain.vim'
    Plug 'jvanja/vim-bootstrap4-snippets'

" Color-schemes
    Plug 'itchyny/lightline.vim'                      " Customize statusline and tabline
    " Plug 'morhetz/gruvbox' "My favorite theme
    " Plug 'kristijanhusak/vim-hybrid-material'
    " Plug 'NLKNguyen/papercolor-theme'
    " Plug 'ajh17/Spacegray.vim'
    " Plug 'chriskempson/base16-vim'
call plug#end() 


" General Settings


" Rebind mapleader
let mapleader = ","


set nocompatible   " VIM-Zusätze aktivieren
"set noautoindent
setl noai nocin nosi inde=
set encoding=utf8  " UTF8 als Zeichensatz
" set spell spelllang=de_de
set backspace=indent,eol,start confirm
" set incsearch      " Zeigt Suchergebnisse während dem Suchen an
" set hlsearch       " Suchresultate farbig hervorheben
" set ignorecase     " Ignoriert Gross/Kleinschreibung beim Suchen
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab


" Colorcolumn
set colorcolumn=80  " nach 80 Zeichen Balken
" highlight ColorColumn ctermbg=235 guibg=#2c2d2j
" let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

syntax on
set number relativenumber
" Automatic number toggle
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
filetype plugin on
" keine backup/swap
set nobackup
set nowritebackup
set noswapfile

set cursorline

set mouse=a " Enable mouse support

set title " Set title of terminal window to the current file name
set t_Co=256 " Use all 256 colors

set lazyredraw " Redraw only when needed


" Tab == 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent


" Searching
set incsearch " Start searching on character press
set hlsearch " Highlight matched characters
set ignorecase " Ignore case when searching with lowercase characters
set smartcase " Do not ignore case when searching with mixed characters


" set noshowmode " Airline shows the current mode so we dont need to see -- INSERT --- anymore



" Highlight trailing spaces
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/


" X Clipboard
:set clipboard=unnamedplus

" Slow switching modes
" set ttimeoutlen=50
set timeoutlen=1000 ttimeoutlen=0
" set noesckeys

" natural split opening
set splitbelow
set splitright

" Unbind the cursor keys in insert, normal and visual modes.
 "for prefix in ['i', 'n', 'v']
 for prefix in ['n', 'v']
   for key in ['<Up>', '<Down>', '<Left>', '<Right>']
       exe prefix . "noremap " . key . " <Nop>"
   endfor
 endfor

" simple split navigation
" nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" @todo Conflicts
" nnoremap <leader>h <C-W>h
" nnoremap <leader>j <C-W>j
" nnoremap <leader>k <C-W>k
" nnoremap <leader>l <C-W>l

" vim Fugitive Einstellungen


"fugitive command :Gbrowse will now work with gitlab URL

"let g:fugitive_gitlab_domains = ['https://my.gitlab.com']
" let g:fugitive_gitlab_domains = ['https://10.10.10.101']
let g:fugitive_gitea_domains = ['https://git.aeschma.de']
" IndentLine Plugin
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
"let g:indentLine_bgcolor_term = 202
"let g:indentLine_bgcolor_gui = '#FF5F00'

" Colorschemes
"colorscheme zenburn

"colorscheme gruvbox




" Use termguicolors if supported
if has('termguicolors')
    set termguicolors
endif

" Truecolor inside tmux
"Credit joshdick
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







"CtrlP
" set runtimepath^=~/.vim/bundle/ctrlp.vim

" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" if executable('ag')
" 		  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"   endif

" Floaterm leader mappings
"" Open ranger in floaterm
nnoremap <leader>R :FloatermNew ranger<cr>

"" Open fzf in floaterm
nnoremap <leader>f :FloatermNew fzf<cr>

"" NERDTree toggle
nnoremap <leader>n :NERDTreeToggle<cr>

" Integrations
command! FZF FloatermNew fzf
command! Ranger FloatermNew ranger
command! PythonREPL FloatermNew python

" fzf
" Search and switch buffers
 nmap <leader>b :Buffers<cr>
" " Find files by name under the current directory
 nmap <leader>f :Files<cr>
" " Find files by name under the home directory
 nmap <leader>h :Files ~/<cr>
" " Search content in the current file
 nmap <leader>l :BLines<cr>
" " Search content in the current file and in files under the current
" directory
 nmap <leader>g :Rg<cr>


 let g:indentLine_char = '⦙'
 autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


" Speed optimization
set ttyfast
set lazyredraw

 """"""""""""""""""""""""""
 " Custom bindings
 """""""""""""""""""""""""""
 
" jk als ESC um vom INert mode in normal mode
inoremap jk <ESC>
inoremap kj <ESC>

 " Comment block
 vnoremap <silent> <C-k> :Commentary<cr>
 nnoremap <silent> <C-k> :Commentary<cr>

" Quickly source .vimrc
nnoremap <leader>r :source $HOME/.config/nvim/init.vim<CR>
" Quickly open .vimrc in new tab
nnoremap <leader>v :tabedit ~/.config/nvim/init.vim<CR>
" Quickly quit editting without save
nnoremap <leader>q :q!<CR>
" Quickly Save File
nnoremap <leader>w :w<CR>
" Quickly Save File
noremap <C-S> :w<CR>
" Saves the file (handling the permission-denied error)
cnoremap w!! w !sudo tee % >/dev/null 

" Easily create a new tab.
noremap <Leader>tN :tabnew<CR>
" Easily close a tab.
noremap <Leader>tc :tabclose<CR>
" Easily move a tab.
noremap <Leader>tm :tabmove<CR>
" Easily go to next tab.
noremap <Leader>tn :tabnext<CR>
" Easily go to previous tab.
noremap <Leader>tp :tabprevious<CR>
" Switch between tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt

" UltiSnips config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'my_snippets']


" Remap Zeilenanfang /Zelenende
:map <C-a> <Home>
:map <C-e> <End>
" inoremap <C-A> <Home>
" inoremap <C-E> <End>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        let g:vimwiki_global_ext = 0

        let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
        let g:vimwiki_root = '~/repos/wiki'
        let g:vimwiki_listsyms = '✗○◐●✓'


      "  let g:vimwiki_table_mappins = 0

let g:vimwiki_list = [
        \{'path': '~/repos/wiki/', 'syntax': 'markdown', 'ext': '.md'},
        \{'path': '~/repos/wiki/todo', 'syntax': 'markdown', 'ext': '.md'},
        \{'path': '~/repos/wiki/linux', 'syntax': 'markdown', 'ext': '.md'},
        \{'path': '~/repos/wiki/homelab', 'syntax': 'markdown', 'ext': '.md'},
        \{'path': '~/repos/wiki/privat', 'syntax': 'markdown', 'ext': '.md'} ]

   " ~~~~~ This inputs a NOW() timestamp
autocmd Filetype markdown inoremap <leader>now *<CR><Esc>!!date<CR>A*<Esc>kJxA<CR><CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vifm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>vv :Vifm<CR>
map <Leader>vs :VsplitVifm<CR>
map <Leader>sp :SplitVifm<CR>
map <Leader>dv :DiffVifm<CR>
map <Leader>tv :TabVifm<CR>


" INstant Markdown
" let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
" let g:instant_markdown_autoscroll = 0
" let g:instant_markdown_port = 3888
" let g:instant_markdown_python = 1
"" let g:instant_markdown_browser = "firefox --new-window"

map <leader>md :InstantMarkdownPreview<CR>

" See https://medium.com/@hql287/10-vim-tips-to-ease-the-learning-curve-c8234cbdafa5

