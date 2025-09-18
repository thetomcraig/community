os: mac
app: iterm2
title: /^default/
-
tag(): user.tmux
tag(): terminal
# todo: filemanager support
#tag(): user.file_manager
tag(): user.generic_unix_shell
tag(): user.git
tag(): user.kubectl
tag(): user.tabs
tag(): user.readline

AI think | think: key("cmd-y")
big tab (last | previous): user.gui_tab_previous()
big tab next: user.gui_tab_next()
big tab new: user.gui_tab_new()
open here: user.open_file_manager_here()
