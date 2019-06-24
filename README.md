# Quickfix Conflicts

`vim-quickfix-conflicts` is a vim plugin that allows you to find and hop between git conflict markers using vim's built-in quickfix list. (`:h quickfix`)

## Installation

Follow your plugin manager's instructions, or simply clone to `$VIMDIR/pack/all/start/vim-quickfix-conflicts` to use vim's (v8+) built-in management.

By default we use [ripgrep](//github.com/BurntSushi/ripgrep), so either:
  - make sure `rg` is installed and available to vim's shell
  - see (#Configuration) to change the default to something that is available on your system

## Usage

Because we use the built-in quickfix list feature, all usual (`:h cc`) quickfix list commands are available, once the list has been populated by either `:Conflicts` or `:ConflictsNext`.

### `:Conflicts`

Populate your quickfix list with all current git conflicts.

### `:ConflictsNext` (`:Cn`)

Jump to next conflict marker. (The quickfix list will be automatically populated, no need to call `:Conflicts` first.)

## Configuration

Instead of using the default grep command, you may wish to change it for some reason:
```viml
let conflicts#grep_cmd='mygrep --args-needed'
```

Having done that, unless its output is the same (or similar enough) to the default, you'll also need to provide the functions:
```viml
function conflicts#grep_cmd_fname_extract_fn(line)
    " parse a:line
    return 'whatever the file name is'
endfunction

function conflicts#grep_cmd_lnum_extract_fn(line)
    " parse a:line
    return 'whatever the line number is'
endfunction
```
