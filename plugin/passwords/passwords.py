from talon import Module, actions, app, Module, Context

mod = Module()

ctx = Context()
@mod.action_class
class Actions:
    def enter_password_2():
        """testing"""



@ctx.action_class("user")
class UserActions:
    def enter_password_2():
        """testing"""
        # actions.insert(password_key)
        actions.key("enter")


