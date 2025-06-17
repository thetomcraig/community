tag: terminal
-
# tags should be activated for each specific terminal in the respective talon file

# lisa: user.terminal_list_directories()
# lisa all: user.terminal_list_all_directories()
katie [dir] [<user.text>]: user.terminal_change_directory(text or "")
katie root: user.terminal_change_directory_root()
katie (up | back): user.terminal_change_directory("..")
go parent: user.terminal_change_directory("..")
go <user.system_path>: insert('cd "{system_path}"\n')
go home: insert('cd \n')
go back: insert('cd - \n')
go dot | dot: insert('dot \n')
go project | go projects: insert('proj \n')
remove <user.text>: user.terminal_remove_directory(text)
path <user.system_path>: insert('"{system_path}"')
clear screen: user.terminal_clear_screen()
run last: user.terminal_run_last()
sudo last: user.terminal_run_last_with_sudo()
rerun [<user.text>]: user.terminal_rerun_search(text or "")
rerun search: user.terminal_rerun_search("")
# Working on this trying to get the numeral part to work
rerun command <user.text>: user.terminal_rerun_command(text)
pre line: user.terminal_pre_line()
kill all: user.terminal_kill_all()
kill it: user.terminal_kill_all()
kill this: user.terminal_kill_all()
kill word | chuck word: user.terminal_kill_word()
kill line: user.terminal_kill_line()
kill right: user.terminal_kill_line_right()
files tree | tree | list: user.terminal_tree()
tree all | list long | long list:
    key(ctrl-c)
    insert("eza -L=1 -alT .")
    key(enter)
check out new: insert('gcb /')
check out: user.git_fuzzy_checkout()
show history | history: user.terminal_history()
exit: user.terminal_exit()

word left: user.terminal_word_left()
word right: user.terminal_word_right()
complete: user.terminal_complete_suggestion()

copy paste:
    edit.copy()
    sleep(50ms)
    edit.paste()
