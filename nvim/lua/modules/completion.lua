return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",  -- LSP completions
        "hrsh7th/cmp-buffer",    -- Buffer completions
        "hrsh7th/cmp-path",      -- Path completions
        "hrsh7th/cmp-cmdline",   -- Command line completions
        "L3MON4D3/LuaSnip",      -- Snippet engine
        "saadparwaiz1/cmp_luasnip" -- Snippet completions
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            completion = {
                autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged }
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept completion
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
                { name = "luasnip" }
            })
        })
    end
}

