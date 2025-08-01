import os

from talon import Context, Module, actions, app, ui

is_mac = app.platform == "mac"

ctx = Context()
mac_ctx = Context()
mod = Module()
# com.todesktop.230313mzl4w4u92 is for Cursor - https://www.cursor.com/
mod.apps.vscode = """
os: mac
and app.bundle: com.microsoft.VSCode
os: mac
and app.bundle: com.microsoft.VSCodeInsiders
os: mac
and app.bundle: com.vscodium
os: mac
and app.bundle: com.visualstudio.code.oss
os: mac
and app.bundle: com.todesktop.230313mzl4w4u92
"""
mod.apps.vscode = """
os: linux
and app.name: Code
os: linux
and app.name: code-oss
os: linux
and app.name: code-insiders
os: linux
and app.name: VSCodium
os: linux
and app.name: Codium
os: linux
and app.name: Cursor
"""
mod.apps.vscode = r"""
os: windows
and app.name: Visual Studio Code
os: windows
and app.name: Visual Studio Code Insiders
os: windows
and app.name: Visual Studio Code - Insiders
os: windows
and app.exe: /^code\.exe$/i
os: windows
and app.exe: /^code-insiders\.exe$/i
os: windows
and app.name: VSCodium
os: windows
and app.exe: /^vscodium\.exe$/i
os: windows
and app.name: Azure Data Studio
os: windows
and app.exe: /^azuredatastudio\.exe$/i
os: windows
and app.exe: positron.exe
os: windows
and app.exe: Cursor.exe
"""

ctx.matches = r"""
app: vscode
"""
mac_ctx.matches = r"""
os: mac
app: vscode
"""


@ctx.action_class("app")
class AppActions:
    # talon app actions
    def tab_open():
        actions.user.vscode("workbench.action.files.newUntitledFile")

    def tab_close():
        actions.user.vscode("workbench.action.closeActiveEditor")

    def tab_next():
        actions.user.vscode("workbench.action.nextEditorInGroup")

    def tab_previous():
        actions.user.vscode("workbench.action.previousEditorInGroup")

    def tab_reopen():
        actions.user.vscode("workbench.action.reopenClosedEditor")

    def window_close():
        actions.user.vscode("workbench.action.closeWindow")

    def window_open():
        actions.user.vscode("workbench.action.newWindow")


@ctx.action_class("code")
class CodeActions:
    # talon code actions
    def toggle_comment():
        actions.user.vscode("editor.action.commentLine")


@ctx.action_class("edit")
class EditActions:
    # talon edit actions
    def indent_more():
        actions.user.vscode("editor.action.indentLines")

    def indent_less():
        actions.user.vscode("editor.action.outdentLines")

    def save_all():
        actions.user.vscode("workbench.action.files.saveAll")

    def save():
        actions.user.vscode("workbench.action.files.save")

    def find_next():
        actions.user.vscode("editor.action.nextMatchFindAction")

    def find_previous():
        actions.user.vscode("editor.action.previousMatchFindAction")

    def line_swap_up():
        actions.key("alt-up")

    def line_swap_down():
        actions.key("alt-down")

    def line_clone():
        actions.key("shift-alt-down")

    def line_insert_down():
        actions.user.vscode("editor.action.insertLineAfter")

    def line_insert_up():
        actions.user.vscode("editor.action.insertLineBefore")

    def jump_line(n: int):
        actions.user.vscode("workbench.action.gotoLine")
        actions.insert(str(n))
        actions.key("enter")
        actions.edit.line_start()

    def zoom_reset():
        actions.user.vscode("workbench.action.zoomReset")


@ctx.action_class("win")
class WinActions:
    def filename():
        title = actions.win.title()
        # this doesn't seem to be necessary on VSCode for Mac
        # if title == "":
        #    title = ui.active_window().doc

        if is_mac:
            result = title.split(" — ")[0]
        else:
            result = title.split(" - ")[0]

        if "." in result:
            return result

        return ""


@mod.action_class
class Actions:
    def vscode_terminal(number: int):
        """Activate a terminal by number"""
        actions.user.vscode(f"workbench.action.terminal.focusAtIndex{number}")

    def command_palette():
        """Show command palette"""
        actions.key("ctrl-shift-p")

@mac_ctx.action_class("edit")
class MacEditActions:
    def find(text: str = None):
        actions.key("cmd-f")
        if text:
            actions.insert(text)

@mac_ctx.action_class("user")
class MacUserActions:
    def command_palette():
        actions.key("cmd-shift-p")


@ctx.action_class("user")
class UserActions:
    def tab_abandon():
        actions.user.vscode("workbench.action.closeActiveEditor")
        actions.key("space")

    # splits.py support begin
    def split_clear_all():
        actions.user.vscode("workbench.action.editorLayoutSingle")

    def split_clear():
        actions.user.vscode("workbench.action.joinTwoGroups")

    def split_flip():
        actions.user.vscode("workbench.action.toggleEditorGroupLayout")

    def split_maximize():
        actions.user.vscode("workbench.action.toggleMaximizeEditorGroup")

    def split_reset():
        actions.user.vscode("workbench.action.evenEditorWidths")

    def split_last():
        actions.user.vscode("workbench.action.focusLeftGroup")

    def split_next():
        actions.user.vscode_and_wait("workbench.action.focusRightGroup")

    def split_window_down():
        actions.user.vscode("workbench.action.moveEditorToBelowGroup")

    def split_window_horizontally():
        actions.user.vscode("workbench.action.splitEditorOrthogonal")

    def split_window_left():
        actions.user.vscode("workbench.action.moveEditorToLeftGroup")

    def split_window_right():
        actions.user.vscode("workbench.action.moveEditorToRightGroup")

    def split_window_up():
        actions.user.vscode("workbench.action.moveEditorToAboveGroup")

    def split_window_vertically():
        actions.user.vscode("workbench.action.splitEditor")

    def split_window():
        actions.user.vscode("workbench.action.splitEditor")

    def split_number(index: int):
        supported_ordinals = [
            "First",
            "Second",
            "Third",
            "Fourth",
            "Fifth",
            "Sixth",
            "Seventh",
            "Eighth",
        ]

        if 0 <= index - 1 < len(supported_ordinals):
            actions.user.vscode(
                f"workbench.action.focus{supported_ordinals[index - 1]}EditorGroup"
            )

    # splits.py support end

    # multiple_cursor.py support begin
    # note: vscode has no explicit mode for multiple cursors
    def multi_cursor_add_above():
        actions.user.vscode("editor.action.insertCursorAbove")

    def multi_cursor_add_below():
        actions.user.vscode("editor.action.insertCursorBelow")

    def multi_cursor_add_to_line_ends():
        actions.user.vscode("editor.action.insertCursorAtEndOfEachLineSelected")

    def multi_cursor_disable():
        actions.key("escape")

    def multi_cursor_enable():
        actions.skip()

    def multi_cursor_select_all_occurrences():
        actions.user.vscode("editor.action.selectHighlights")

    def multi_cursor_select_fewer_occurrences():
        actions.user.vscode("cursorUndo")

    def multi_cursor_select_more_occurrences():
        actions.user.vscode("editor.action.addSelectionToNextFindMatch")

    def multi_cursor_skip_occurrence():
        actions.user.vscode("editor.action.moveSelectionToNextFindMatch")

    # multiple_cursor.py support end

    def command_search(command: str = ""):
        actions.user.vscode("workbench.action.showCommands")
        if command != "":
            actions.insert(command)

    # tabs.py support begin
    def tab_jump(number: int):
        if number < 10:
            if is_mac:
                actions.user.vscode_with_plugin(
                    f"workbench.action.openEditorAtIndex{number}"
                )
            else:
                actions.key(f"alt-{number}")
        else:
            actions.user.vscode_with_plugin(
                "workbench.action.openEditorAtIndex", number
            )

    def tab_final():
        if is_mac:
            actions.user.vscode("workbench.action.lastEditorInGroup")
        else:
            actions.key("alt-0")

    def tab_duplicate():
        # Duplicates the current tab into a new tab group
        # vscode does not allow duplicate tabs in the same tab group, and so is implemented through splits
        actions.user.split_window_vertically()

    # tabs.py support end

    # find_and_replace.py support begin

    def find_everywhere(text: str):
        """Triggers find across project"""
        if is_mac:
            actions.key("cmd-shift-f")
        else:
            actions.key("ctrl-shift-f")

        if text:
            actions.insert(text)

    def find_toggle_match_by_case():
        """Toggles find match by case sensitivity"""
        if is_mac:
            actions.key("alt-cmd-c")
        else:
            actions.key("alt-c")

    def find_toggle_match_by_word():
        """Toggles find match by whole words"""
        if is_mac:
            actions.key("cmd-alt-w")
        else:
            actions.key("alt-w")

    def find_toggle_match_by_regex():
        """Toggles find match by regex"""
        if is_mac:
            actions.key("cmd-alt-r")
        else:
            actions.key("alt-r")

    def replace(text: str):
        """Search and replaces in the active editor"""
        if is_mac:
            actions.key("alt-cmd-f")
        else:
            actions.key("ctrl-h")

        if text:
            actions.insert(text)

    def replace_everywhere(text: str):
        """Search and replaces in the entire project"""
        if is_mac:
            actions.key("cmd-shift-h")
        else:
            actions.key("ctrl-shift-h")

        if text:
            actions.insert(text)

    def replace_confirm():
        """Confirm replace at current position"""
        if is_mac:
            actions.key("shift-cmd-1")
        else:
            actions.key("ctrl-shift-1")

    def replace_confirm_all():
        """Confirm replace all"""
        if is_mac:
            actions.key("cmd-enter")
        else:
            actions.key("ctrl-alt-enter")

    def select_previous_occurrence(text: str):
        actions.edit.find(text)
        actions.sleep("100ms")
        actions.key("shift-enter esc")

    def select_next_occurrence(text: str):
        actions.edit.find(text)
        actions.sleep("100ms")
        actions.key("esc")

    def insert_snippet(body: str):
        actions.user.run_rpc_command("editor.action.insertSnippet", {"snippet": body})
