# NVIM Configuration

This repository contains my Neovim (NVIM) configuration, organized to provide a
modular and customizable setup. Below is the structure of the configuration and
instructions on how to use it.

## Installation

### Prerequisites

- Neovim (v0.8 or later recommended)
- Git
- A terminal emulator with Nerd Fonts installed (for proper UI rendering)

### Steps

1. ""Clone the Repository:""

```bash
git clone https://github.com/your-repo/nvim-config.git ~/.config/nvim
```

2. ""Install Plugins:""

Open Neovim and run:

```vim
:Lazy
```

This will install all plugins defined in the configuration.

3. ""Verify the Setup:"" 

Ensure plugins and configurations are working as expected by restarting Neovim
and testing key features.

## Key Files

- `init.lua`: Main entry point for the configuration.
- `mappings.lua`: Defines custom key mappings.
- `settings.lua`: Contains core Neovim settings (e.g., line numbers, tab width).
- `plugins/init.lua`: Manages plugin loading using Lazy.nvim.

## Features

- **Plugin Management**: Efficiently manage plugins with Lazy.nvim.
- **LSP Support**: Integrated Language Server Protocol (LSP) setup with Mason
  and Mason-LSPConfig.
- **File Explorer**: Manage files using a tree-style interface (e.g.,
  NvimTree).
- **Debugging**: Debug applications with nvim-dap.
- **Git Integration**: Enhanced Git workflows with git-related plugins.
- **Search and Navigation**: Quick file and text search using FZF and Harpoon.
- **Undo History**: Visualize undo history with UndoTree.

## Customization

You can customize this configuration by:

- Modifying `lua/settings.lua` to change default behaviors.
- Adding or removing plugins in `lua/plugins/init.lua`.
- Updating `lua/mappings.lua` to configure key bindings.

## Contributing

Feel free to fork this repository and submit pull requests for improvements or
bug fixes. All contributions are welcome!

## License

This configuration is licensed under the MIT License. See the LICENSE file for
details.

## Acknowledgments

Thanks to the Neovim community and plugin developers for their contributions to
the ecosystem!

