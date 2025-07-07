os: mac
mode: command
-
launcher | alfred: user.alfred_search()
(clip | clipboard): user.alfred_clipboard()
(clip | clipboard) search [<user.text>]: user.alfred_clipboard("{text}")
