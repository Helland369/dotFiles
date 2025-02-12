return {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {"williamboman/mason.nvim", "nvimtools/none-ls.nvim"},
    config = function()
        require("mason-null-ls").setup({
            ensure_installed = {"prettier", "eslint_d", "stylua"},
            automatic_setup = true,
        })

        require("null-ls").setup({})
    end
}

