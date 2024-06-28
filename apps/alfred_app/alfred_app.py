from talon import Context, Module, actions

ctx = Context()
mod = Module()

mod.tag("alfred_clipboard_search")

@ctx.action_class("user")
class UserActions:
    def alfred_search():
        actions.key("cmd-space")
        
    def alfred_clipboard_search():
        actions.key("alt-space")

@mod.action_class
class Actions:
    def alfred_search():
        """Search with Alfred"""
        
    def alfred_clipboard_search():
        """Search Alfred clipboard"""