set-option -g status-utf8 on
set -g default-command /bin/zsh

unbind '\'
bind '"' split-window -v
unbind '-'
bind '%' split-window -h

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
