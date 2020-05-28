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
    Plug 'tpope/vim-surround'
    Plug 'sirver/ultisnips'
" Syntax
    Plug 'tpope/vim-markdown'
    Plug 'ap/vim-css-color' "Displays a preview of colors with CSS 
    Plug 'vim-scripts/fountain.vim'
    " Bootstrap4
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

set nocompatible   " VIM-Zusätze aktivieren
"set noautoindent
setl noai nocin nosi inde=
set encoding=utf8  " UTF8 als Zeichensatz
" set spell spelllang=de_de
set backspace=indent,eol,start confirm
set incsearch      " Zeigt Suchergebnisse während dem Suchen an
set hlsearch       " Suchresultate farbig hervorheben
set ignorecase     " Ignoriert Gross/Kleinschreibung beim Suchen
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab
set colorcolumn=80  " nach 80 Zeichen Balken
highlight ColorColumn ctermbg=7
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

" Rebind mapleader
let mapleader = " "

"CtrlP
" set runtimepath^=~/.vim/bundle/ctrlp.vim

" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" if executable('ag')
" 		  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"   endif


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



" See https://medium.com/@hql287/10-vim-tips-to-ease-the-learning-curve-c8234cbdafa5

