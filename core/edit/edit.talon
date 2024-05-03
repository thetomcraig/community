# Zoom
zoom in: edit.zoom_in()
zoom out: edit.zoom_out()
zoom reset: edit.zoom_reset()

# Searching
find it: edit.find()
unfind:
    edit.find()
    user.escape()
next one: edit.find_next()

# Navigation

# The reason for these spoken forms is that "page up" and "page down" are globally defined as keys.
scroll up: edit.page_up()
scroll down: edit.page_down()

go word left: edit.word_left()
go word right: edit.word_right()

go left: edit.left()
tug: edit.word_left()
go right: edit.right()
push: edit.word_right()
go up: edit.up()
north: edit.up()
go down: edit.down()
south: edit.down()

go way left | go line start | pre line | head::
    edit.line_start()
    edit.line_start()
go way right | go line end | post line | tail: edit.line_end()
go way up: edit.file_start()
go way down: edit.file_end()

go top: edit.file_start()
go bottom: edit.file_end()

go page up: edit.page_up()
go page down: edit.page_down()

# Selecting
select all: edit.select_all()
select line: edit.select_line()
select line start: user.select_line_start()
select line end: user.select_line_end()

select left: edit.extend_left()
select right: edit.extend_right()
select up: edit.extend_line_up()
select down: edit.extend_line_down()

select word: edit.select_word()
select word left: edit.extend_word_left()
select word right: edit.extend_word_right()

select way left: edit.extend_line_start()
select way right: edit.extend_line_end()
select way up: edit.extend_file_start()
select way down: edit.extend_file_end()

# Indentation
indent [more]: edit.indent_more()
(indent less | out dent): edit.indent_less()

# Delete
clear all: user.delete_all()
clear line | chuck  line: edit.delete_line()
clear line start | chuck  line start: user.delete_line_start()
clear line end | chuck line end: user.delete_line_end()
clear left | left: edit.delete()
clear right | right: user.delete_right()

clear up:
    edit.extend_line_up()
    edit.delete()

clear down:
    edit.extend_line_down()
    edit.delete()

clear word: edit.delete_word()

clear word left:
    edit.extend_word_left()
    edit.delete()

clear word right:
    edit.extend_word_right()
    edit.delete()

clear way left:
    edit.extend_line_start()
    edit.delete()

clear way right:
    edit.extend_line_end()
    edit.delete()

clear way up:
    edit.extend_file_start()
    edit.delete()

clear way down:
    edit.extend_file_end()
    edit.delete()

# Copy
copy that: edit.copy()
snag | snag that: edit.copy()
copy all | snag all that: user.copy_all()
copy line | a snag line: user.copy_line()
copy line start: user.copy_line_start()
copy line end: user.copy_line_end()
copy word : user.copy_word()
snag this: user.copy_word()
copy word left: user.copy_word_left()
copy word right: user.copy_word_right()

#to do: do we want these variants, seem to conflict
# copy left:
#      edit.extend_left()
#      edit.copy()
# copy right:
#     edit.extend_right()
#     edit.copy()
# copy up:
#     edit.extend_up()
#     edit.copy()
# copy down:
#     edit.extend_down()
#     edit.copy()

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

#to do: do we want these variants
# cut left:
#      edit.select_all()
#      edit.cut()
# cut right:
#      edit.select_all()
#      edit.cut()
# cut up:
#      edit.select_all()
#     edit.cut()
# cut down:
#     edit.select_all()
#     edit.cut()

# Paste
(pace | paste) that: edit.paste()
slam: edit.paste()
slammer:
    edit.paste()
    key(enter)
(pace | paste) enter:
    edit.paste()
    key(enter)
paste match: edit.paste_match_style()
(pace | paste) all: user.paste_all()
(pace | paste) line: user.paste_line()
(pace | paste) line start: user.paste_line_start()
(pace | paste) line end: user.paste_line_end()
(pace | paste) word: user.paste_word()

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
(pad | padding): user.insert_between(" ", " ")
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
disk all: edit.save_all()

# Misc Edit
scrape: user.escape()
abort: user.escape()
