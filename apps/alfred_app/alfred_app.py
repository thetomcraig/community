from talon import Context, Module, actions

ctx = Context()
mod = Module()

# mod.tag("alfred_clipboard")

@ctx.action_class("user")
class UserActions:
    def alfred_search():
        actions.key("cmd-space")

    def alfred_clipboard(text: str = None):
        actions.key("alt-space")
        if text is not None:
            actions.sleep("100ms")
            actions.insert(text)

    def alfred_clipboard_append():
        actions.key("cmd-c-c")


@mod.action_class
class Actions:
    def alfred_search():
        """Search with Alfred"""

    def alfred_clipboard(text: str = None):
        """Search Alfred clipboard"""

    def alfred_clipboard_append():
        """Append to Alfred clipboard"""
