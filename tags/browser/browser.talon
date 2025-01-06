tag: browser
-
tag(): user.address
tag(): user.find
tag(): user.navigation

address bar | go address | go url: browser.focus_address()
search address <user.text>$:
    browser.focus_address()
    insert("{text}")
    key(enter)
search for <user.text>$:
    app.tab_open()
    insert("{text}")
    key(enter)
hunt this <user.text>: user.find(text)
# hunter <user.text>: user.find(text)
go page | page focus: browser.focus_page()

go home: browser.go_home()
go private: browser.open_private_window()

bookmark it: browser.bookmark()
bookmark tabs: browser.bookmark_tabs()
(refresh | reload) it: browser.reload()
tab reload: browser.reload()
(refresh | reload) it hard: browser.reload_hard()

bookmark show: browser.bookmarks()
bookmark bar [show]: browser.bookmarks_bar()
downloads show: browser.show_downloads()
extensions show: browser.show_extensions()
history show: browser.show_history()
cache show: browser.show_clear_cache()
dev tools [show]: browser.toggle_dev_tools()
dev tools redock: user.toggle_dev_tools_dock()
dev tools clear: user.clear_dev_tools()
dev tools inspect: user.toggle_inspector()

# Legacy [verb noun] commands to be removed at a later time
show downloads: browser.show_downloads()
show extensions: browser.show_extensions()
show history: browser.show_history()
show cache: browser.show_clear_cache()
