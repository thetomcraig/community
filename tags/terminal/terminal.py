from talon import Module

mod = Module()


@mod.action_class
class Actions:
    def terminal_list_directories():
        """Lists directories"""

    def terminal_list_all_directories():
        """Lists all directories including hidden"""

    def terminal_change_directory(path: str):
        """Lists change directory"""

    def terminal_change_directory_root():
        """Root of current drive"""

    def terminal_remove_directory(path: str):
        """Remove a directory"""

    def terminal_clear_screen():
        """Clear screen"""

    def terminal_run_last():
        """Repeats the last command"""

    def terminal_run_last_with_sudo():
        """Repeats the last command, prepending sudo"""

    def terminal_rerun_search(command: str):
        """Searches through the previously executed commands"""

    def terminal_rerun_command(command_number: str):
        """Reruns a command with a given number"""

    def terminal_word_left():
        """moves one word to the left"""

    def terminal_word_right():
        """moves one word to the left"""

    def terminal_complete_suggestion():
        """Complete the ZSH suggested command"""

    def terminal_pre_line():
        """move the cursor to the beginning of the line"""

    def terminal_kill_all():
        """kills the running command"""

    def terminal_kill_word():
        """kills one word to the left"""

    def terminal_kill_line():
        """kills the entire line"""

    def terminal_tree(args: str = ""):
        """run tree command"""

    def git_fuzzy_checkout():
        """run custom get checkout command using fzf"""

    def terminal_history():
        """run history command"""

    def terminal_kill_line_right():
        """kills from cursor to end of line"""

    def terminal_exit():
        """exit the current terminal session"""
