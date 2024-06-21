vim.g.editorconfig = true

return {
    -- To disable things:
    -- { "stuff/stuff", enabled = false }
    {
        "stevearc/conform.nvim",
        enabled = true,
        lazy = false,
        opts = {

            formatters_by_ft = {
                markdown = { "markdownlint" },
            },
        },
    },

    -- Cron explainer. Requires NPM cronstrue
    { "fabridamicelli/cronex.nvim", opts = {} },

    {
        "ellisonleao/gruvbox.nvim",
        opts = {
            transparent_mode = true,
        },
    },
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                transparent_background = true,
                show_end_of_buffer = true,
                integrations = {
                    notify = true,
                },
            })
        end,
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },

    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
        },
    },

    -- change some telescope options and a keymap to browse plugin files
    {
        "nvim-telescope/telescope.nvim",
        keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
        },
        -- change some options
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
            },
        },
    },

    -- add telescope-fzf-native
    {
        "telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
    },

    {
        "mechatroner/rainbow_csv",
    },

    { "akinsho/git-conflict.nvim", version = "*", config = true },

    -- {
    --   "michaelb/sniprun",
    --   branch = "master",
    --   build = "sh install.sh",
    -- },
}
