return {
    {
        "nvim-orgmode/orgmode",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("orgmode").setup({
                org_agenda_files = { "~/org/agenda/*" },
				--org_default_notes_file = "~/org/notes.org",
            })
        end,
    },
    {
        "lukas-reineke/headlines.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("headlines").setup({
                org = {
                    headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5", "Headline6" },
                    bullets = { "◉", "○", "✸", "✿" }, -- Symbols instead of "*"
                },
            })
        end,
    },
}
