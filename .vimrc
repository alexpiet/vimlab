" Save Fold Views Automatically
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

" Disable trackpad scrolling
set mouse=nvhi
imap <ScrollWheelUp> <Nop>
imap <S-ScrollWheelUp> <Nop>
imap <C-ScrollWheelUp> <Nop>
imap <ScrollWheelDown> <Nop>
imap <S-ScrollWheelDown> <Nop>
imap <C-ScrollWheelDown> <Nop>
imap <ScrollWheelLeft> <Nop>
imap <S-ScrollWheelLeft> <Nop>
imap <C-ScrollWheelLeft> <Nop>
imap <ScrollWheelRight> <Nop>
imap <S-ScrollWheelRight> <Nop>
imap <C-ScrollWheelRight> <Nop>

" Turn on Line Numbers
set number

" Set Copy Paste Functionality
imap <C-c> <C-o>v
vmap <C-c> y
nmap <C-c> v
imap <C-v> <Esc>"*pi
nmap <C-v> "*p
set clipboard=unnamed

" set up visual block mode to ctrl-Q
" Doesn't work because tmux uses C-q as a hotkey
nmap <C-q> v<C-v>
imap <C-q> <C-o>v<C-v>
vmap <C-q> <C-v>

" Map a to i, because its more natural
nmap a i
vmap a i

" Ctrl-d for select all
nmap <C-d> gg<C-c>G$
imap <C-d> <C-o>gg<C-c>G$

" Set Control-S to save, and return to mode
:nmap <C-s> :w<CR>
:imap <C-s> <Esc><C-s>
":imap <C-s><C-s> <Esc><C-s>
:vmap <C-s> <Esc><C-s>

" Setting Undo things
:imap <C-z> <C-o>u
:nmap <C-z> u  

" Latex Compile and open. Saves files before compiling
:nmap <C-b> <C-s>:! pdflatex <C-R>=expand("%:t:r")<CR>.tex; gnome-open <C-R>=expand("%:t:r")<CR>.pdf<CR><CR>
:imap <C-b> <Esc><C-s>:! pdflatex <C-R>=expand("%:t:r")<CR>.tex; gnome-open <C-R>=expand("%:t:r")<CR>.pdf<CR><CR>i

" Something for latex compile. I think Ctrl-B happened to be some bash hotkey.
:set shellcmdflag=-ic

" For word wrap treat lines visually. 
noremap <Up> g<Up>
noremap <Down> g<Down>
inoremap <Up> <C-o>g<Up>
inoremap <Down> <C-o>g<Down>
noremap <Home> g<Home>
noremap <End> g<End>
inoremap <Home> <C-o>g<Home>
inoremap <End> <C-o>g<End>

" Tab Things
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" Easy escape from Visual Mode
vmap i <Esc>i


" Spell Check Notes
autocmd BufNewFile,BufRead *.tex setlocal spell spelllang=en_us
" ]s goto next bad word
" zg add word to word list

" Save file and put current filename with full path in buffer
nmap <C-f> <C-s>:let @* = expand("%:p")<CR>
imap <C-f> <Esc><C-s>:let @* = expand("%:p")<CR>i

"colorscheme delek
colorscheme alex

set nomodeline
"highlight ColorColumn ctermbg=black
"set colorcolumn=80

" If a line is long and wraps on multiple lines, this shows as many of those
" lines as possible without resorting to a list of @ columns
set display+=lastline



