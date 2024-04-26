window (new | open): app.window_open()
tile new: app.window_open()
window next: app.window_next()
next win | tile next: app.window_next()
window last | tile last: app.window_previous()
last win: app.window_previous()
window close: app.window_close()
win close: app.window_close()
window hide: app.window_hide()
win min | tile min | min win | win min: app.window_hide()
focus <user.running_applications>: user.switcher_focus(running_applications)
# following only works on windows. Can't figure out how to make it work for mac. No idea what the equivalent for linux would be.
focus$: user.switcher_menu()
focus last: user.switcher_focus_last()

coder : user.switcher_focus("code")
terminal | term: user.switcher_focus("term")
brave : user.switcher_focus("brave")
outlook : user.switcher_focus("outlook")
teams: user.switcher_focus("teams")
mail: user.switcher_focus("mail")
merge: user.switcher_focus("Araxis Merge")

running list: user.switcher_toggle_running()
running close: user.switcher_hide_running()
launch <user.launch_applications>: user.switcher_launch(launch_applications)

# move to one: user.snap_screen_and_full(1)
# move to two: user.snap_screen_and_full(2)
# move to three: user.snap_screen_and_full(3)

# snap <user.window_snap_position>: user.snap_window(window_snap_position)
tile <user.window_snap_position>: user.snap_window(window_snap_position)
# snap next [screen]: user.move_window_next_screen()
# snap last [screen]: user.move_window_previous_screen()
snap screen <number> | splay <number>: user.move_window_to_screen(number)

snap <user.running_applications> <user.window_snap_position>:
    user.snap_app(running_applications, window_snap_position)
snap <user.running_applications> [screen] <number>:
    user.move_app_to_screen(running_applications, number)
