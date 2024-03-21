# Custom configuration

Custom configuration for NVim [NvChad](https://nvchad.com) distribution.

To use this you need to clone it to `~/.config/nvim/lua/custom/` folder, like this:

```bash
mv ~/.config/nvim/lua/custom ~/.config/nvim/lua/custom-bkp
git clone https://github.com/kennedyoliveira/nvchad-custom-config ~/.config/nvim/lua/custom
```

## NvChad

### Installation Requirements

* Neovim 0.9.5.
* Nerd Font as your terminal font.
    - Make sure the nerd font you set doesn't end with Mono to prevent small icons.
    - Example : JetbrainsMono Nerd Font and not JetbrainsMono Nerd Font Mono
* Ripgrep is required for grep searching with Telescope (OPTIONAL).
* GCC, Windows users must have mingw installed and set on path.
* Make, Windows users must have GnuWin32 installed and set on path.

Run `:MasonInstallAll` after opening Neovim for the first time.

### Updating

Run `:Lazy sync` or `nvchadupdate` command.

## Extra plugins

Here are the other plugins that have been added, besides the ones already built in by the dist, what feature they provide, their commands and custom shortcuts for easy to use.

### Rustaceanvim

Setup the LSP for rust development, should be a one shot thing, no need to manually setup all the custom configuration, must have rust and cargo installed.

### vim-tmux-nagivator

Allow to use tmux navigator to jump between tmux and nvim windows/panes

#### Keymaps

* `<C-h>` Move left
* `<C-j>` Move down
* `<C-k>` Move Up
* `<C-l>` Move right
* `<C-\\>` Previous

### nvim-web-devicons

Allow for adding custom icons, this is basically a dependency plugin for other plugins, like to show a file icon and other stuff.

### trouble

Quickfix plugin for navigating through issues in the code, also has support for Telescope

#### Commands

* `Trouble [mode]` show the Quickfix pane
* `TroubleClose [mode]` close the Quickfix pane
* `TroubleToggle [mode]` toggle the Quickfix pane
* `TroubleRefresh` refreshes the Quickfix pane

Modes

* `document_diagnostics`: document diagnostics from the builtin LSP client
* `workspace_diagnostics`: workspace diagnostics from the builtin LSP client
* `lsp_references`: references of the word under the cursor from the builtin LSP client
* `lsp_definitions`: definitions of the word under the cursor from the builtin LSP client
* `lsp_type_definitions`: type definitions of the word under the cursor from the builtin LSP client


