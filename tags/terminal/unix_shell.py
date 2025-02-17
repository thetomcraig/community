from talon import Context, Module, actions

ctx = Context()
mod = Module()
ctx.matches = r"""
tag: user.generic_unix_shell
"""

# Uncomment the following line to enable common unix utilities from unix_utilities.py
ctx.tags = ["user.unix_utilities"]


@ctx.action_class("user")
class Actions:
    # Implements the functions from terminal.py for unix shells

    def terminal_list_directories():
        """Lists directories"""
        actions.insert("ls")
        actions.key("enter")

    def terminal_list_all_directories():
        """Lists all directories including hidden"""
        actions.insert("ls -a")
        actions.key("enter")

    def terminal_change_directory(path: str):
        """Lists change directory"""
        actions.insert(f"cd {path}")
        if path:
            actions.key("enter")

    def terminal_change_directory_root():
        """Root of current drive"""
        actions.insert("cd /")
        actions.key("enter")

    def terminal_clear_screen():
        """Clear screen"""
        actions.insert("clear")
        actions.key("enter")

    def terminal_run_last():
        """Repeats the last command"""
        actions.key("up enter")

    def terminal_run_last_with_sudo():
        """Repeats the last command, prepending sudo"""
        actions.insert("sudo !!")
        actions.key("enter")
        actions.key("enter")

    def terminal_rerun_search(command: str):
        """Searches through the previously executed commands"""
        actions.key("ctrl-r")
        actions.insert(command)

    def terminal_rerun_command(command_number: str):
        """Reruns a command with a given number"""
        actions.insert("!")
        actions.insert(command_number)
        actions.key("enter")

    def terminal_word_left():
        """moves one word to the left"""
        actions.key("alt-left")

    def terminal_word_right():
        """moves one word to the right"""
        actions.key("alt-right")

    def terminal_complete_suggestion():
        """complete the suggested line,
        to be used with auto suggest zsh plugin"""
        actions.key("ctrl-j")
        actions.key("enter")

    def terminal_pre_line():
        """move the cursor to the beginning of the line"""
        actions.key("ctrl-a")

    def terminal_kill_all():
        """kills the running command"""
        actions.key("ctrl-c")
        actions.key("enter")

    def terminal_kill_word():
        """kills one word to the left"""
        actions.key("ctrl-w")

    def terminal_kill_line():
        """kills the entire line"""
        actions.key("ctrl-u")

    def terminal_kill_line_right():
        """kills from cursor to end of line"""
        actions.key("ctrl-k")

    def terminal_tree():
        """run tree command"""
        actions.insert("mytree")
        actions.key("enter")

    def terminal_history():
        """run history command"""
        actions.insert("history")
        actions.key("enter")

    def terminal_exit():
        """exit the current terminal session"""
        actions.key("ctrl-d")


