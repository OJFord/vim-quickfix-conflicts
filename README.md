# Quickfix Conflicts

`vim-quickfix-conflicts` is a vim plugin that allows you to find and hop between git conflict markers using vim's built-in quickfix list. (`:h quickfix`)

## Installation

Follow your plugin manager's instructions, or simply clone to `$VIMDIR/pack/all/start/vim-quickfix-conflicts` to use vim's (v8+) built-in management.

## Usage

Because we use the built-in quickfix list feature, all usual (`:h cc`) quickfix list commands are available, once the list has been populated by either `:Conflicts` or `:ConflictsNext`.

### `:Conflicts`

Populate your quickfix list with all current git conflicts.

### `:ConflictsNext` (`:Cn`)

Jump to next conflict marker. (The quickfix list will be automatically populated, no need to call `:Conflicts` first.)

## Configuration

None!
