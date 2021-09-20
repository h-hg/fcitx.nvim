# Fcitx.nvim

## What is it

A Neovim plugin writing in Lua to switch and restore fcitx state for each buffer. For example, switching to English input when leaving the INSERT mode, and restore Non-Latin input (like Chinese input) when enter the INSERT mode or COMMAND mode (for searching).

## Requirements

- This plugin requires neovim >= 0.5.0
- `fcitx-remote` or `fcitx5-remote`
- Please confirm in `fcitx-configtool` (or `fcitx5-configtool`) that English is the first input method and Non-Latin (like Chinese) is the second input method. For rime users, please note that there must be two input methods in `fcitx` (or `fcitx5`).

## Installation

For [packer](https://github.com/wbthomason/packer.nvim) user:

```lua
require('packer').startup(function()
  use 'h-hg/fcitx.nvim'
end)
```

## Alternative

- [fcitx.vim](https://github.com/lilydjwg/fcitx.vim)
- [vim-barbaric](https://github.com/rlue/vim-barbaric)

