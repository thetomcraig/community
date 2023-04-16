os: windows
-
start menu: key(super)
context menu: key(super-x)

spy [<user.text>]: 
    txt = text or ""
    user.system_search()
    sleep(100ms)
    insert("{txt}")
    
spy app [<user.text>]:     
    txt = text or ""
    user.system_search()
    sleep(100ms)
    insert(".{txt}")

spy file [<user.text>]:  
    txt = text or ""   
    user.system_search()
    sleep(100ms)
    insert("?{txt}")

spy service [<user.text>]:  
    txt = text or ""   
    user.system_search()
    sleep(100ms)
    insert("!{txt}")

spy process [<user.text>]:  
    txt = text or ""   
    user.system_search()
    sleep(100ms)
    insert("<{txt}")

spy setting [<user.text>]:  
    txt = text or ""   
    user.system_search()
    sleep(100ms)
    insert("${txt}")

spy code [<user.text>]:
    txt = text or ""   
    user.system_search()
    sleep(100ms)
    insert("{{{txt}")

spy win [<user.text>]:
    txt = text or ""   
    user.system_search()
    sleep(100ms)
    insert("<{txt}")