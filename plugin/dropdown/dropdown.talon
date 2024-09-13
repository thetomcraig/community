# DEPRECATED
drop down <number_small>: user.deprecate_command("2024-05-29", "drop down", "choose")
drop down up <number_small>:
    user.deprecate_command("2024-05-29", "drop down up", "choose up")

pick <number_small>: key("down:{number_small-1} enter")
pick: key("enter")
pick up <number_small>: key("up:{number_small} enter")
