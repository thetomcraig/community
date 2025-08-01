tag: user.find_and_replace
-
tag(): user.find

hunt this: user.find("")
hunt this (pace | paste):
    user.find("")
    sleep(25ms)
    edit.paste()
hunt this <user.text>: user.find(text)

hunt all: user.find_everywhere("")
hunt all (pace | paste):
    user.find_everywhere("")
    sleep(25ms)
    edit.paste()
hunt all <user.text>: user.find_everywhere(text)

scout (all | al | hall) | scouter: user.find_everywhere("")
scout (all | al | hall) (pace | paste) | scouter (pace | paste):
    user.find_everywhere("")
    sleep(25ms)
    edit.paste()
scout (all | al | hall) <user.text> | scouter <user.text>: user.find_everywhere(text)

scout (pace | paste):
    edit.find()
    sleep(25ms)
    edit.paste()
scout <user.text>: edit.find(text)

hunt case: user.find_toggle_match_by_case()
hunt word: user.find_toggle_match_by_word()
hunt expression: user.find_toggle_match_by_regex()
replace this [<user.text>]: user.replace(text or "")
replace all: user.replace_everywhere("")
replace <user.text> all: user.replace_everywhere(text)
replace confirm that: user.replace_confirm()
replace confirm all: user.replace_confirm_all()

#quick replace commands, modeled after jetbrains
clear last <user.text> [over]:
    user.select_previous_occurrence(text)
    sleep(100ms)
    edit.delete()
clear next <user.text> [over]:
    user.select_next_occurrence(text)
    sleep(100ms)
    edit.delete()
clear last clip:
    user.select_previous_occurrence(clip.text())
    edit.delete()
clear next clip:
    user.select_next_occurrence(clip.text())
    sleep(100ms)
    edit.delete()
comment last <user.text> [over]:
    user.select_previous_occurrence(text)
    sleep(100ms)
    code.toggle_comment()
comment last clip:
    user.select_previous_occurrence(clip.text())
    sleep(100ms)
    code.toggle_comment()
comment next <user.text> [over]:
    user.select_next_occurrence(text)
    sleep(100ms)
    code.toggle_comment()
comment next clip:
    user.select_next_occurrence(clip.text())
    sleep(100ms)
    code.toggle_comment()
go last <user.text> [over]:
    user.select_previous_occurrence(text)
    sleep(100ms)
    edit.right()
go last clip:
    user.select_previous_occurrence(clip.text())
    sleep(100ms)
    edit.right()
go next <user.text> [over]:
    user.select_next_occurrence(text)
    edit.right()
go next clip:
    user.select_next_occurrence(clip.text())
    edit.right()
paste last <user.text> [over]:
    user.select_previous_occurrence(text)
    sleep(100ms)
    edit.right()
    edit.paste()
paste next <user.text> [over]:
    user.select_next_occurrence(text)
    sleep(100ms)
    edit.right()
    edit.paste()
replace last <user.text> [over]:
    user.select_previous_occurrence(text)
    sleep(100ms)
    edit.paste()
replace next <user.text> [over]:
    user.select_next_occurrence(text)
    sleep(100ms)
    edit.paste()
select last <user.text> [over]: user.select_previous_occurrence(text)
select next <user.text> [over]: user.select_next_occurrence(text)
select last clip: user.select_previous_occurrence(clip.text())
select next clip: user.select_next_occurrence(clip.text())
