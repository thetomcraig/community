os: mac
-
^desktop$: user.dock_send_notification("com.apple.showdesktop.awake")
^tiles$: user.dock_send_notification("com.apple.expose.awake")
^apps$: user.dock_send_notification("com.apple.expose.awake")
^window$: user.dock_app_expose()
^launch pad$: user.dock_send_notification("com.apple.launchpad.toggle")
