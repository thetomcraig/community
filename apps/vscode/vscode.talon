#custom vscode commands go here
app: vscode
-
tag(): user.find_and_replace
tag(): user.line_commands
tag(): user.multiple_cursors
tag(): user.splits
tag(): user.tabs
tag(): user.command_search

window reload: user.vscode("workbench.action.reloadWindow")
window close: user.vscode("workbench.action.closeWindow")
#multiple_cursor.py support end


settings():
    key_wait = 4
    insert_wait = 7

please [<user.text>]:
    user.vscode("workbench.action.showCommands")
    insert(user.text or "")

go view [<user.text>]:
    user.vscode("workbench.action.openView")
    insert(user.text or "")
# Vim
toggle vim | vim toggle | switch vim | vim switch:
    user.vscode("toggleVim")

toggle hats | toggle hints | hints on:
    user.vscode("cursorless.toggleDecorations")
# Sidebar
bar explore: user.vscode("workbench.view.explorer")
bar file: user.vscode("workbench.view.explorer")
bar extensions: user.vscode("workbench.view.extensions")
bar outline: user.vscode("outline.focus")
bar run: user.vscode("workbench.view.debug")
bar debug: user.vscode("workbench.view.debug")
bar remote: user.vscode("workbench.action.remote.showMenu")
bar source: user.vscode("workbench.view.scm")
bar test: user.vscode("workbench.view.testing.focus")
bar chat: user.vscode("workbench.action.chat.openInSidebar")
bar tabs: user.vscode("andreas.tabs.focus")
bar PRs: user.vscode("pr:github.focus")
bar switch: user.vscode("workbench.action.toggleSidebarVisibility")
switch right | bar close right | bar switch right: user.vscode("workbench.action.closeAuxiliaryBar")
bar hide: user.vscode("workbench.action.closeSidebar")

show include | show exclude:
    user.vscode("workbench.action.search.toggleQueryDetails")

# Symbol search
symbol hunt [<user.text>]:
    user.vscode("workbench.action.gotoSymbol")
    sleep(50ms)
    insert(text or "")

symbol hunt all [<user.text>]:
    user.vscode("workbench.action.showAllSymbols")
    sleep(50ms)
    insert(text or "")

# Panels
panel control: user.vscode("workbench.panel.repl.view.focus")
panel output: user.vscode("workbench.panel.output.focus")
panel problems: user.vscode("workbench.panel.markers.view.focus")
panel switch: user.vscode("workbench.action.togglePanel")
panel terminal | panel term: user.vscode("workbench.action.terminal.toggleTerminal")
focus editor: user.vscode("workbench.action.focusActiveEditorGroup")

# Settings
show settings: user.vscode("workbench.action.openGlobalSettings")
show settings json: user.vscode("workbench.action.openSettingsJson")
show settings folder: user.vscode("workbench.action.openFolderSettings")
show settings folder json: user.vscode("workbench.action.openFolderSettingsFile")
show settings workspace: user.vscode("workbench.action.openWorkspaceSettings")
show settings workspace json: user.vscode("workbench.action.openWorkspaceSettingsFile")
show (shortcuts | hotkeys): user.vscode("workbench.action.openGlobalKeybindings")
show (shortcuts | hotkeys) json: user.vscode("workbench.action.openGlobalKeybindingsFile")
show snippets: user.vscode("workbench.action.openSnippets")

# VSCode Snippets
snip (last | previous): user.vscode("jumpToPrevSnippetPlaceholder")
snip next: user.vscode("jumpToNextSnippetPlaceholder")

# Display
centered switch: user.vscode("workbench.action.toggleCenteredLayout")
fullscreen switch: user.vscode("workbench.action.toggleFullScreen")
theme switch: user.vscode("workbench.action.selectTheme")
wrap switch: user.vscode("editor.action.toggleWordWrap")
zen switch: user.vscode("workbench.action.toggleZenMode")

# File Commands
doc [<user.text>]:
    user.vscode("workbench.action.quickOpen")
    sleep(50ms)
    insert(text or "")
file hunt (pace | paste):
    user.vscode("workbench.action.quickOpen")
    sleep(50ms)
    edit.paste()
doc (pace | paste):
    user.vscode("workbench.action.quickOpen")
    sleep(50ms)
    edit.paste()
doc pop [<user.text>]:
    user.vscode("workbench.action.quickOpen")
    sleep(100ms)
    insert(text or "")
    sleep(100ms)
    key(enter)
toggle regex:
    user.vscode("toggleSearchEditorRegex")
toggle case:
    user.vscode("toggleSearchEditorCaseSensitive")
toggle word:
    user.vscode("toggleSearchEditorWholeWord")
res next:
    user.vscode("search.action.focusNextSearchResult")
res second:
    user.vscode("search.action.focusNextSearchResult")
    user.vscode("search.action.focusNextSearchResult")
res third:
    user.vscode("search.action.focusNextSearchResult")
    user.vscode("search.action.focusNextSearchResult")
    user.vscode("search.action.focusNextSearchResult")
res last:
    user.vscode("search.action.focusLastSearchResult")

file copy name: user.vscode("fileutils.copyFileName")
file copy path: user.vscode("copyFilePath")
file copy local [path]: user.vscode("copyRelativeFilePath")
file create sibling: user.vscode_and_wait(".newFile")
file create: user.vscode("workbench.action.files.newUntitledFile")
file create relative: user.vscode("fileutils.newFile")
file create root: user.vscode("fileutils.newFileAtRoot")
file rename:
    user.vscode("fileutils.renameFile")
    sleep(150ms)
file move:
    user.vscode("fileutils.moveFile")
    sleep(150ms)
file clone:
    user.vscode("fileutils.duplicateFile")
    sleep(150ms)
file duplicate:
    user.vscode("fileutils.duplicateFile")
    sleep(150ms)
file delete:
    user.vscode("fileutils.removeFile")
    sleep(150ms)
file new: user.vscode("welcome.showNewFileEntries")
file open folder: user.vscode("revealFileInOS")
file show: user.vscode("revealFileInOS")
file reveal: user.vscode("workbench.files.action.showActiveFileInExplorer")
# TODO
#Works except for the first and last file on a list does not loop...
file last:
    user.vscode("workbench.files.action.showActiveFileInExplorer")
    key(up)
    user.vscode("explorer.openAndPassFocus")
file next:
    user.vscode("workbench.files.action.showActiveFileInExplorer")
    key(down)
    user.vscode("explorer.openAndPassFocus")

folder new: user.vscode("explorer.newFolder")

save ugly: user.vscode("workbench.action.files.saveWithoutFormatting")
save all: user.vscode("workbench.action.files.saveAll")

# Language Features
suggest show: user.vscode("editor.action.triggerSuggest")
hint show: user.vscode("editor.action.triggerParameterHints")
definition show: user.vscode("editor.action.revealDefinition")
definition peek: user.vscode("editor.action.peekDefinition")
definition side: user.vscode("editor.action.revealDefinitionAside")
references show: user.vscode("editor.action.goToReferences")
hierarchy peek: user.vscode("editor.showCallHierarchy")
references find: user.vscode("references-view.find")
format that: user.vscode("editor.action.formatDocument")
format selection: user.vscode("editor.action.formatSelection")
imports fix: user.vscode("editor.action.organizeImports")
problem next: user.vscode("editor.action.marker.nextInFiles")
problem last: user.vscode("editor.action.marker.prevInFiles")
problem fix: user.vscode("problems.action.showQuickFixes")
rename that: user.vscode("editor.action.rename")
refactor that: user.vscode("editor.action.refactor")
whitespace trim: user.vscode("editor.action.trimTrailingWhitespace")
language switch: user.vscode("workbench.action.editor.changeLanguageMode")
refactor rename: user.vscode("editor.action.rename")
refactor this: user.vscode("editor.action.refactor")

#code navigation
(go declaration | follow): user.vscode("editor.action.revealDefinition")
go back: user.vscode("workbench.action.navigateBack")
go forward: user.vscode("workbench.action.navigateForward")

go implementation: user.vscode("editor.action.goToImplementation")
go type: user.vscode("editor.action.goToTypeDefinition")
go usage: user.vscode("references-view.find")
go recent [<user.text>]:
    user.vscode("workbench.action.openRecent")
    sleep(50ms)
    insert(text or "")
    sleep(250ms)
go edit: user.vscode("workbench.action.navigateToLastEditLocation")

# Bookmarks. Requires Bookmarks plugin
bar marks: user.vscode("workbench.view.extension.bookmarks")
go marks:
    user.deprecate_command("2023-06-06", "go marks", "bar marks")
    user.vscode("workbench.view.extension.bookmarks")
toggle mark: user.vscode("bookmarks.toggle")
go next mark: user.vscode("bookmarks.jumpToNext")
go last mark: user.vscode("bookmarks.jumpToPrevious")

# Project Manager Plugin
bar projects: user.vscode("workbench.view.extension.project-manager")
(go project | go projects):
    user.vscode("projectManager.listProjects")


# Docker
bar docker: user.vscode("workbench.view.extension.dockerView")

# Azure
bar azure: user.vscode("workbench.view.extension.azure")

# AI chat
# pilot chat: user.vscode("continue.quickEdit")
# chat ask | chat this: user.vscode("continue.focusContinueInput")

close other tabs | tab only | tab own: user.vscode("workbench.action.closeOtherEditors")
close tabs way right: user.vscode("workbench.action.closeEditorsToTheRight")
close tabs way left: user.vscode("workbench.action.closeEditorsToTheLeft")
tab {self.letter} [{self.letter}]:
    user.run_rpc_command("andreas.focusTab", "{letter_1}{letter_2 or ''}")
tab close {self.letter} [{self.letter}]:
    user.run_rpc_command_and_wait("andreas.focusTab", "{letter_1}{letter_2 or ''}")
    key("cmd-w")

# Close splits other than the current one
split only | own | only: user.vscode("workbench.action.closeEditorsInOtherGroups")
split go left: user.vscode("workbench.action.moveActiveEditorGroupLeft")
split go right: user.vscode("workbench.action.moveActiveEditorGroupRight")

# Folding
fold that | fold this: user.vscode("editor.fold")
unfold that: user.vscode("editor.unfold")
fold those: user.vscode("editor.foldAllMarkerRegions")
unfold those: user.vscode("editor.unfoldRecursively")
fold all: user.vscode("editor.foldAll")
unfold all: user.vscode("editor.unfoldAll")
fold comments: user.vscode("editor.foldAllBlockComments")
fold one: user.vscode("editor.foldLevel1")
fold two: user.vscode("editor.foldLevel2")
fold three: user.vscode("editor.foldLevel3")
fold four: user.vscode("editor.foldLevel4")
fold five: user.vscode("editor.foldLevel5")
fold six: user.vscode("editor.foldLevel6")
fold seven: user.vscode("editor.foldLevel7")

# Git / Github (not using verb-noun-adjective pattern, mirroring terminal commands.)
git branch: user.vscode("git.branchFrom")
git branch this: user.vscode("git.branch")
git checkout [<user.text>]:
    user.vscode("git.checkout")
    sleep(50ms)
    insert(text or "")
# WIP TODO: working on commit flow
git commit [<user.text>]:
    user.vscode("git.commitStaged")
    # There needed to be more of a delay for this to work
    sleep(300ms)
    user.insert_formatted(text or "", "CAPITALIZE_FIRST_WORD")
commit done | finish commit:
    user.vscode("workbench.action.files.save")
    sleep(50ms)
    user.vscode("workbench.action.closeWindow")
git commit undo: user.vscode("git.undoCommit")
git commit amend: user.vscode("git.commitStagedAmend")
git publish: user.vscode("git.publish")
git diff: user.vscode("git.openChange")
git changes: user.vscode("git.viewChanges")
git fetch: user.vscode("git.fetch")
git fetch all: user.vscode("git.fetchAll")
git ignore: user.vscode("git.ignore")
git merge: user.vscode("git.merge")
git take both: user.vscode("merge-conflict.accept.both")
[git] conflict next: user.vscode("merge-conflict.next")
[git] conflict (previous | last): user.vscode("merge-conflict.previous")
git output: user.vscode("git.showOutput")
git pull: user.vscode("git.pullRebase")
git push: user.vscode("git.push")
git push force: user.vscode("git.pushForce")
git rebase abort: user.vscode("git.rebaseAbort")
git reveal: user.vscode("git.revealInExplorer")
git revert$: user.vscode("git.revertChange")
git revert all: user.vscode("git.cleanAll")
git stash: user.vscode("git.stash")
git stash pop: user.vscode("git.stashPop")
git status: user.vscode("workbench.scm.focus")
git stage: user.vscode("git.stage")
git stage all: user.vscode("git.stageAll")
git sync: user.vscode("git.sync")
git unstage: user.vscode("git.unstage")
git unstage all: user.vscode("git.unstageAll")
pull request | pr create: user.vscode("pr.create")
pr (refresh | reload): user.vscode("pr.refreshChanges")
pull request link:
    user.run_rpc_command("andreas.getGitPullRequestsURL")

# TODO: Why doesn't this work?
# Would like to always be able to always have a choice of what branch to use
# git open file: user.git_open_remote_file_url(false, false)
git open file: user.vscode("gitlens.openFileOnRemote")
git open working file: user.vscode("gitlens.openWorkingFile")
git file history: user.vscode("gitlens.openFileHistory")
git copy file: user.git_copy_remote_file_url(false, false)
git open branch: user.git_open_remote_file_url(false, true)
git copy branch: user.git_copy_remote_file_url(false, true)
git cherry pick: user.vscode("git.cherryPick")

# Use keyboard shortcuts because VSCode relies on when clause contexts to choose the appropriate
# action: https://code.visualstudio.com/api/references/when-clause-contexts
change next: key(alt-f5)
change last: key(shift-alt-f5)

# Testing
test run: user.vscode("testing.runAtCursor")
test run file: user.vscode("testing.runCurrentFile")
test run all: user.vscode("testing.runAll")
test run failed: user.vscode("testing.reRunFailTests")
test run last: user.vscode("testing.reRunLastRun")

test debug: user.vscode("testing.debugAtCursor")
test debug file: user.vscode("testing.debugCurrentFile")
test debug all: user.vscode("testing.debugAll")
test debug failed: user.vscode("testing.debugFailTests")
test debug last: user.vscode("testing.debugLastRun")
test cancel: user.vscode("testing.cancelRun")

# Debugging
break point: user.vscode("editor.debug.action.toggleBreakpoint")
break point <number>$:
    edit.jump_line(number)
    sleep(50ms)
    user.vscode("editor.debug.action.toggleBreakpoint")
no breaks | toggle breaks: user.vscode("workbench.debug.viewlet.action.toggleBreakpointsActivatedAction")
step over: user.vscode("workbench.action.debug.stepOver")
bug over: user.vscode("workbench.action.debug.stepOver")
debug step into: user.vscode("workbench.action.debug.stepInto")
debug step out [of]: user.vscode("workbench.action.debug.stepOut")
debug start: user.vscode("workbench.action.debug.start")
bug start: user.vscode("workbench.action.debug.start")
debug pause: user.vscode("workbench.action.debug.pause")
debug stopper: user.vscode("workbench.action.debug.stop")
bug stop: user.vscode("workbench.action.debug.stop")
debug continue: user.vscode("workbench.action.debug.continue")
bug next: user.vscode("workbench.action.debug.continue")
debug restart: user.vscode("workbench.action.debug.restart")
bug restart: user.vscode("workbench.action.debug.restart")
debug console: user.vscode("workbench.debug.action.toggleRepl")
bug console: user.vscode("workbench.debug.action.toggleRepl")
panel debug: user.vscode("workbench.debug.action.toggleRepl")
debug clean: user.vscode("workbench.debug.panel.action.clearReplAction")

# Terminal
terminal external: user.vscode("workbench.action.terminal.openNativeConsole")
terminal new: user.vscode("workbench.action.terminal.new")
terminal next: user.vscode("workbench.action.terminal.focusNext")
terminal last: user.vscode("workbench.action.terminal.focusPrevious")
terminal split: user.vscode("workbench.action.terminal.split")
terminal zoom: user.vscode("workbench.action.toggleMaximizedPanel")
terminal trash: user.vscode("workbench.action.terminal.kill")
kill this: user.vscode("workbench.action.terminal.kill")
terminal toggle: user.vscode_and_wait("workbench.action.terminal.toggleTerminal")
terminal scroll up: user.vscode("workbench.action.terminal.scrollUp")
terminal scroll down: user.vscode("workbench.action.terminal.scrollDown")
terminal <number_small>: user.vscode_terminal(number_small)

task run [<user.text>]:
    user.vscode("workbench.action.tasks.runTask")
    insert(user.text or "")
#TODO: should this be added to linecommands?
copy line down: user.vscode("editor.action.copyLinesDownAction")
copy line up: user.vscode("editor.action.copyLinesUpAction")

#Expand/Shrink AST Selection
select less: user.vscode("editor.action.smartSelect.shrink")
select (more | this): user.vscode("editor.action.smartSelect.expand")

minimap: user.vscode("editor.action.toggleMinimap")
maximize: user.vscode("workbench.action.minimizeOtherEditors")
restore | equalize: user.vscode("workbench.action.evenEditorWidths")

#breadcrumb
select breadcrumb: user.vscode("breadcrumbs.focusAndSelect")
# Use `alt-left` and `alt-right` to navigate the bread crumb

replace here:
    user.replace("")
    key(cmd-alt-l)

hover show: user.vscode("editor.action.showHover")

join lines: user.vscode("editor.action.joinLines")

full screen: user.vscode("workbench.action.toggleFullScreen")

isolate | iso :
    user.vscode("workbench.action.closeSidebar")
    user.vscode("workbench.action.closePanel")
    user.vscode("workbench.action.closeAuxiliaryBar")

curse undo: user.vscode("cursorUndo")
curse redo: user.vscode("cursorRedo")

select word: user.vscode("editor.action.addSelectionToNextFindMatch")
skip word: user.vscode("editor.action.moveSelectionToNextFindMatch")

# jupyter
cell next: user.vscode("notebook.focusNextEditor")
cell last: user.vscode("notebook.focusPreviousEditor")
cell run above: user.vscode("notebook.cell.executeCellsAbove")
cell run: user.vscode("notebook.cell.execute")

install local: user.vscode("workbench.extensions.action.installVSIX")
preview markdown: user.vscode("markdown.showPreview")
split markdown | split preview: user.vscode("markdown.showPreviewToSide")
