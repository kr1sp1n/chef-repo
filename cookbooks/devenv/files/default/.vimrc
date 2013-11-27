" do not make vim compatible with vi.
set nocompatible

" number the lines.
set number

" show location of cursor using a horizontal line.
set cursorline

" keep cursor in the middle of the screen while scrolling up and down.
set scrolloff=999

" show auto complete menus.
set wildmenu

" Make wildmenu behave like bash completion.
set wildmode=list:longest

" turn on syntax hightlighting.
set syntax=on

" colorscheme desert
colorscheme desert

" no ~ files
set nobackup

filetype indent on
set autoindent
set smartindent

" Auto expand tabs to spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Do not wrap lines automatically
set wrap

" Repair wired terminal/vim settings
set backspace=start,eol

map <down> <nop>
map <left> <nop>
map <right> <nop>
map <up> <nop>

imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
imap <up> <nop>