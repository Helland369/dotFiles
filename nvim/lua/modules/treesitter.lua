return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Automatically update parsers after installation
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "javascript", "html", "css", "json", "c", "cpp" }, -- Add languages you need
            sync_install = false, -- Install parsers asynchronously
            auto_install = true, -- Automatically install missing parsers
            highlight = {
                enable = true, -- Enable syntax highlighting
                additional_vim_regex_highlighting = false, -- Disable Vim regex highlighting
            },
            indent = { enable = true }, -- Enable Treesitter-based indentation
        })
    end,
}
