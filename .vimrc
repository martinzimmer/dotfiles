"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'


"Plugins
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'jreybert/vimagit'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'Yggdroot/indentLine'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

set nocompatible   " VIM-Zusätze aktivieren
"set noautoindent 
setl noai nocin nosi inde=
set encoding=utf8  " UTF8 als Zeichensatz
set incsearch      " Zeigt Suchergebnisse während dem Suchen an
set hlsearch       " Suchresultate farbig hervorheben
set ignorecase     " Ignoriert Gross/Kleinschreibung beim Suchen
set tabstop=4       " number of visual spaces per TAB
set shiftwidth=4
set expandtab
set softtabstop=4   " number of spaces in tab when editing
syntax on
set number relativenumber
" Automatic number toggle
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
filetype plugin on


silent! nmap <C-n> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

" Airline
let g:airline#extensions#tabline#enabled = 1 
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
set laststatus=2


" Instant-Markdown autostart beim öffnen deaktivieren
let g:instant_markdown_autostart = 0
"Instant Markdown mit :InstantMarkdownPreview öffnen 

" Unbind the cursor keys in insert, normal and visual modes.
 "for prefix in ['i', 'n', 'v']
 for prefix in ['n', 'v']
   for key in ['<Up>', '<Down>', '<Left>', '<Right>']
       exe prefix . "noremap " . key . " <Nop>"
   endfor
 endfor

" simple split navigation
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>



" natural split opening
set splitbelow
set splitright

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" Fugitive Einstellungen


"fugitive command :Gbrowse will now work with gitlab URL
"let g:fugitive_gitlab_domains = ['https://my.gitlab.com']
let g:fugitive_gitlab_domains = ['https://10.10.10.101']

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


colorscheme zenburn

" Rebind mapleader
let mapleader = ","

" keine backup/swap
set nobackup
set nowritebackup
set noswapfile
"CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
		  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif


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
 nmap <leader>g :Ag<cr>


 let g:indentLine_char = '⦙'
 autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

