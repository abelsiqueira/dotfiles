local highlight = { "HL1", "HL2", "HL3", "HL4" }

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "HL1", { fg = "#7e3930" })
    vim.api.nvim_set_hl(0, "HL2", { fg = "#7e642f" })
    vim.api.nvim_set_hl(0, "HL3", { fg = "#467a35" })
    vim.api.nvim_set_hl(0, "HL4", { fg = "#474d98" })
end)

-- require("ibl").setup({ indent = { highlight = highlight } })

vim.g.editorconfig = true

vim.filetype.add({
    extension = {
        cff = "yaml",
    },
})

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

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = {
                highlight = highlight,
            },
        },
    },

    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({})
        end,
    },

    -- {
    --   "michaelb/sniprun",
    --   branch = "master",
    --   build = "sh install.sh",
    -- },
}
