from talon import Context, Module, actions

mod = Module()
mod.apps.postman = "app.name: Postman"
mod.apps.postman = """
os: mac
and app.bundle: com.postmanlabs.mac
"""

ctx = Context()
ctx.matches = r"""
os: mac
"""


@ctx.action_class("app")
class AppActions:
    # app.tabs
    def tab_previous():
        actions.key("cmd-shift-[")

    def tab_next():
        actions.key("cmd-shift-]")
