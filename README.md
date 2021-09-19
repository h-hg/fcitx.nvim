# Fcitx.nvim

## What is it

A Neovim plugin writing in Lua to switch and restore fcitx state for each buffer. For example, switching to English input when leaving the Insert mode, and restore Non-Latin input (like Chinese input) when enter the Insert mode or Command mode (for searching).

## Requirements

- `fcitx-remote` or `fcitx5-remote`
- Please confirm in `fcitx-configtool` (or `fcitx5-configtool`) that English is the first input method and Non-Latin (liek Chinese) is the second input method. For rime users, please note that there must be two input methods in `fcitx` (or `fcitx5`).

## Installation

[packer](https://github.com/wbthomason/packer.nvim) user:

```lua
require('packer').startup(function()
  use 'h-hg/fcitx.nvim'
end)
```

## Alternative

- [fcitx.vim](https://github.com/lilydjwg/fcitx.vim)
- [vim-barbaric](https://github.com/rlue/vim-barbaric)
