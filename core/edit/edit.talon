# Compound of action(select, clear, copy, cut, paste, etc.) and modifier(word, line, etc.) commands for editing text.
# eg: "select line", "clear all"
<user.edit_action> <user.edit_modifier>: user.edit_command(edit_action, edit_modifier)

# Zoom
zoom in: edit.zoom_in()
zoom out: edit.zoom_out()
zoom reset: edit.zoom_reset()

# Searching
find it: edit.find()
scout: edit.find()
scout <user.text>: edit.find(text)
unfind:
    edit.find()
    user.escape()
next one: edit.find_next()
nexter: edit.find_next()
last one: edit.find_previous()

# Navigation

# The reason for these spoken forms is that "page up" and "page down" are globally defined as keys.
scroll up: edit.page_up()
scroll down: edit.page_down()

go word left: edit.word_left()
go word right: edit.word_right()

go left: edit.left()
go right: edit.right()
go up: edit.up()
north: edit.up()
go down: edit.down()
south: edit.down()
# go left, go left left down, go 5 left 2 down
# go word left, go 2 words right
go <user.navigation_step>+: user.perform_navigation_steps(navigation_step_list)

go line start | head: edit.line_start()
pre line: edit.line_start()
go line end | tail: edit.line_end()
post line: edit.line_end()
go way left:
    edit.line_start()
    edit.line_start()
go way right: edit.line_end()
go way up: edit.file_start()
go way down: edit.file_end()

go top: edit.file_start()
go bottom: edit.file_end()

go page up: edit.page_up()
go page down: edit.page_down()

# Indentation
indent [more]: edit.indent_more()
push: edit.indent_more()
(indent less | out dent): edit.indent_less()
tug: edit.indent_less()

# Delete
clear all: user.delete_all()
clear line: edit.delete_line()
chuck  line: edit.delete_line()
blast: edit.delete_line()
clear line start: user.delete_line_start()
chuck  line start: user.delete_line_start()
clear line end: user.delete_line_end()
chuck line end: user.delete_line_end()
clear left: edit.delete()
chuck left: edit.delete()
clear right: user.delete_right()
chuck right: user.delete_right()

clear up:
    edit.extend_line_up()
    edit.delete()

clear down:
    edit.extend_line_down()
    edit.delete()

clear word left:
    edit.extend_word_left()
    edit.delete()
chuck word:
    edit.extend_word_left()
    edit.delete()

clear word right:
    edit.extend_word_right()
    edit.delete()



# Copy
copy that: edit.copy()
snag | snag that: edit.copy()
# copy all: user.copy_all()
# snag all: user.copy_all()
# copy line: user.copy_line()
# snag line: user.copy_line()
# copy line start: user.copy_line_start()
# copy line end: user.copy_line_end()
# copy word: user.copy_word()
# snag this: user.copy_word()
# copy word left: user.copy_word_left()
# copy word right: user.copy_word_right()

# Cut
cut that: edit.cut()
carve that: edit.cut()
cut all: user.cut_all()
carve all: user.cut_all()
cut line: user.cut_line()
carve line: user.cut_line()
cut line start: user.cut_line_start()
cut line end: user.cut_line_end()
cut word: user.cut_word()
cut word left: user.cut_word_left()
cut word right: user.cut_word_right()

# Paste
(pace | paste) that: edit.paste()

(pace | paste) enter:
    edit.paste()
    key(enter)
paste match: edit.paste_match_style()

# Duplication
clone that: edit.selection_clone()
clone line: edit.line_clone()

# Insert new line
new line above: edit.line_insert_up()
new line below | slap: edit.line_insert_down()
slapper:
    edit.line_insert_down()
    edit.line_insert_down()


okay: edit.line_insert_down()

# Insert padding with optional symbols
padding: user.insert_between(" ", " ")
(pad | padding) <user.symbol_key>+:
    insert(" ")
    user.insert_many(symbol_key_list)
    insert(" ")

# Undo/redo
undo that: edit.undo()
revert | vert | fuck: edit.undo()
redo that: edit.redo()
devert: edit.redo()


# Save
file save: edit.save()
disk: edit.save()
file save all: edit.save_all()

[go] line mid: user.line_middle()
disk all: edit.save_all()
disker: edit.save_all()
