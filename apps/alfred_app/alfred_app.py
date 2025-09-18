from talon import Context, Module, actions

ctx = Context()
mod = Module()

@ctx.action_class("user")
class UserActions:
    def alfred_search():
        actions.key("cmd-space")

    def alfred_clipboard(text: str = None):
        actions.key("alt-space")
        if text is not None:
            actions.sleep("100ms")
            actions.insert(text)

@mod.action_class
class Actions:
    def alfred_search():
        """Search with Alfred"""

    def alfred_clipboard(text: str = None):
        """Search Alfred clipboard"""