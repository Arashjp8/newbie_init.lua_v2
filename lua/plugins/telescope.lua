---------------------------------------------------------------------
-- Plugin Configuration: Telescope
---------------------------------------------------------------------
return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            ---------------------------------------------------------------------
            -- Telescope Builtin Keybindings
            ---------------------------------------------------------------------
            local builtin = require("telescope.builtin")
            -- local themes = require("telescope.themes")

            -- Find files (ignoring node_modules)
            vim.keymap.set("n", "<Space><Space>", function()
                builtin.find_files({
                    hidden = true,
                    -- Exclude node_modules folder from search
                    file_ignore_patterns = { "node_modules/.*" },
                })
            end, {})

            -- Telescope itself
            vim.keymap.set("n", "<leader>t", ":Telescope <CR>", {})

            -- buffer navigation
            vim.keymap.set("n", "<leader>b", function()
                builtin.buffers({
                    sort_lastused = true,
                    ignore_current_buffer = false,
                    previewer = false,
                })
            end, { desc = "List Open Buffers" })
            vim.keymap.set("n", "]b", ":bnext <CR>")
            vim.keymap.set("n", "[b", ":bprev <CR>")
            --

            -- -- NOTE: It's been replaced by custom multi_grep
            -- -- Live Grep
            -- vim.keymap.set("n", "<leader>fg", function()
            --     builtin.live_grep()
            -- end, {})
            require("config.telescope.multigrep").setup()

            -- LSP References
            vim.keymap.set("n", "<leader>fr", function()
                builtin.lsp_references()
            end)

            -- Help Tags
            vim.keymap.set("n", "<leader>fh", function()
                builtin.help_tags()
            end)

            -- Current Buffer Fuzzy Find
            vim.keymap.set("n", "<leader>f/", function()
                builtin.current_buffer_fuzzy_find()
            end)

            vim.keymap.set("n", "<leader>fs", function()
                builtin.lsp_document_symbols({
                    symbol_width = 50, -- optional
                })
            end, { desc = "Find Symbols in Current Document" })

            -- Workspace Symbols (all project files via LSP)
            vim.keymap.set("n", "<leader>fS", function()
                builtin.lsp_workspace_symbols()
            end, { desc = "Find Symbols in Workspace" })

            vim.keymap.set("n", "<leader>ff", function()
                builtin.lsp_document_symbols({
                    symbols = { "Function", "Method", "Class", "Interface" },
                })
            end, { desc = "Jump to Functions/Classes" })

            vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Treesitter Symbols" })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            ---------------------------------------------------------------------
            -- Telescope UI Select Setup
            ---------------------------------------------------------------------
            require("telescope").setup({
                defaults = {
                    layout_strategy = "flex",
                    layout_config = {
                        width = 0.95,
                        height = 0.99,
                        flip_columns = 120,
                        horizontal = {
                            prompt_position = "bottom",
                        },
                        vertical = {
                            mirror = false,
                        },
                    },
                    mappings = {
                        i = {
                            ["<C-j>"] = require("telescope.actions").move_selection_next,
                            ["<C-k>"] = require("telescope.actions").move_selection_previous,
                        },
                        n = {
                            ["<C-j>"] = require("telescope.actions").move_selection_next,
                            ["<C-k>"] = require("telescope.actions").move_selection_previous,
                        },
                    },
                },
                extensions = {
                    fzf = {},
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                        require("telescope").load_extension("ui-select"),
                    },
                    require("telescope").load_extension("fzf"),
                },
            })
        end,
    },
}
