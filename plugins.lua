local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- better messages and floating windows for cmd
  -- add virtual text as well
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  -- Install a plugin
  -- press jj or jk fast to escape insert mode
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }

  -- vim LSP + Debugger and other stuff
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust" },
  },

  -- config to use with tmux to allow jumping between panes of nvim and tmux
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -- custom icons and colors for nvtree
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup {
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true,
        -- globally enable different highlight colors per icon (default to true)
        -- if set to false all icons will have the default icon's color
        color_icons = true,
      }
    end,
  },

  -- https://github.com/folke/trouble.nvim?tab=readme-ov-file
  -- TODO add integration to telescope
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = {
      "Trouble",
      "TroubleClose",
      "TroubleToggle",
      "TroubleRefresh",
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>tt",
        mode = { "n" },
        function()
          require("trouble").toggle()
        end,
        desc = "Trouble toggle quick list",
      },
      {
        "<leader>tw",
        mode = { "n" },
        function()
          require("trouble").toggle "workspace_diagnostics"
        end,
        desc = "Trouble toggle quick list for workspace",
      },
      {
        "<leader>td",
        mode = { "n" },
        function()
          require("trouble").toggle "document_diagnostics"
        end,
        desc = "Trouble toggle quick list for document",
      },
      {
        "<leader>tq",
        mode = { "n" },
        function()
          require("trouble").toggle "quickfix"
        end,
        desc = "Trouble toggle quickfix",
      },
      {
        "<leader>tl",
        mode = { "n" },
        function()
          require("trouble").toggle "loclist"
        end,
        desc = "Trouble toggle loc list",
      },
      {
        "<leader>gR",
        mode = { "n" },
        function()
          require("trouble").toggle "lsp_references"
        end,
        desc = "Trouble toggle LSP references",
      },
    },
  },

  -- Support for YAML files with syntax highlight and snippets
  {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
    },
  },

  -- Neogit https://github.com/NeogitOrg/neogit?tab=readme-ov-file
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua",              -- optional
    },
    config = true,
    cmd = {
      "Neogit",
    },
  },

  -- Allow quickly jumping to any part of the screen with a few keystrokes
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = true,
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },

  -- add IDE like breadcumps
  -- Required neovim 0.10.0-dev
  -- {
  --   {
  --     "Bekaboo/dropbar.nvim",
  --     -- optional, but required for fuzzy finder support
  --     dependencies = {
  --       "nvim-telescope/telescope-fzf-native.nvim",
  --     },
  --     lazy = false,
  --   },
  -- },

  -- Highlight the line and word in the cursor
  {
    "yamatsum/nvim-cursorline",
    opts = {
      cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
      },
      cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
      },
    },
    lazy = false,
  },

  -- Allow seeing the undo history as a tree and changing the state to any previous state
  {
    "mbbill/undotree",
    opts = {},
    cmd = {
      "UndotreeToggle",
    },
    keys = {
      {
        "<leader>u",
        mode = { "n", "x" },
        function()
          vim.cmd.UndotreeToggle()
        end,
        desc = "Toggle Undotree",
      },
    },
  },

  -- A simple statusline/winbar component that uses LSP to show your current code context
  {
    "SmiteshP/nvim-navic",
  },

  -- Add a status bar line on top of the buffer with the file icon + name
  -- helpful for splits
  {
    "b0o/incline.nvim",
    config = function()
      local helpers = require "incline.helpers"
      local devicons = require "nvim-web-devicons"
      local navic = require "nvim-navic"

      require("incline").setup {
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          local res = {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            guibg = "#44406e",
          }
          if props.focused then
            for _, item in ipairs(navic.get_data(props.buf) or {}) do
              table.insert(res, {
                { " > ",     group = "NavicSeparator" },
                { item.icon, group = "NavicIcons" .. item.type },
                { item.name, group = "NavicText" },
              })
            end
          end
          table.insert(res, " ")
          return res
        end,
      }
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },

  -- File Bookmark navigation
  {
    "otavioschwanck/arrow.nvim",
    opts = {
      show_icons = true,
    },
    lazy = false,
    cmd = {
      "Arrow",
    },
    keys = {
      {
        "<F3>",
        mode = { "n", "x" },
        function()
          require("arrow.ui").openMenu()
        end,
      },
      desc = "Arrow Show Menu",
    },
  },

  -- Add a telescope extension to go to a specific tab
  {
    "LukasPietzschmann/telescope-tabs",
    config = function()
      require("telescope").load_extension "telescope-tabs"
      require("telescope-tabs").setup {
        -- Your custom config :^)
      }
    end,
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  -- Add markdown preview
  -- Install dependencies without yarn or npm
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = {
  --     "MarkdownPreviewToggle",
  --     "MarkdownPreview",
  --     "MarkdownPreviewStop",
  --   },
  --   -- file type
  --   ft = { "markdown" },
  --   build = function()
  --     vim.fn["mkdp#util#install"]()
  --   end,
  --
  --   -- Alternative way of installing using yarn
  --   -- build = "cd app && yarn install",
  --   -- init = function()
  --   --   vim.g.mkdp_filetypes = { "markdown" }
  --   -- end,
  -- },
  --

  -- https://github.com/OXY2DEV/markview.nvim
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      -- You will not need this if you installed the
      -- parsers manually
      -- Or if the parsers are in your $RUNTIMEPATH
      "nvim-treesitter/nvim-treesitter",

      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "gennaro-tedesco/nvim-jqx",
    ft = { "json", "yaml" },
  },

  -- https://github.com/rest-nvim/rest.nvim
  {
    "rest-nvim/rest.nvim",
    lazy = false,
  },

  -- Dependency for other plugins to create
  -- UI blocks, like nvim-navbuddy
  {
    "MunifTanjim/nui.nvim",
  },

  -- https://github.com/SmiteshP/nvim-navbuddy?tab=readme-ov-file
  -- Symbol navigation, <leader>ls
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        opts = { lsp = { auto_attach = true } },
      },
    },
    -- your lsp config or other stuff
  },
  -- end of the tables
}

return plugins
