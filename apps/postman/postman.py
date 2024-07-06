from talon import Context, actions

ctx = Context()

@ctx.action_class("app")
class AppActions:
    # app.tabs
    def tab_last():
        actions.key("cmd-shift-[")

    def tab_next():
        actions.key("cmd-shift-]")
