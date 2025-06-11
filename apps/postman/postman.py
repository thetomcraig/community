from talon import Context, Module, actions

ctx = Context()
mod = Module()

mod.apps.postman = "app.name: Postman"
mod.apps.postman = r"""
os: mac
and app.bundle: com.postmanlabs.mac
"""
ctx.matches = r"""
os: mac
app: postman
"""


@mod.action_class
class Actions:
    def send():
        """Sends the current request in Postman"""
        actions.key("cmd-enter")

@ctx.action_class("app")
class AppActions:
    def tab_previous():
        actions.key("cmd-shift-[")

    def tab_next():
        actions.key("cmd-shift-]")
