# vimlab
Configuration Files for integrating REPL editor of your choice and vim, replacing the bloated guis

1) Put `pylab` or `vimlab` in ~/.tmux
2) Put `.vimrc` in ~/
3) Put alex.vim in ~/.vim/colors (optional)
4) append your ~/.bashrc with:
    alias pylab='tmux -f ~/.tmux/pylab attach
    alias vimlab='tmux -f ~/.tmux/vimlab attach
5) Put `.tmux.conf` in ~/
6) Fire up vimlab! 
