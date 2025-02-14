return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {"williamboman/mason.nvim"},
    config = function()
        require("mason-lspconfig").setup({
		    ensure_installed = {"lua_ls", "ts_ls", "eslint", "omnisharp", "html", "cssls", "vtsls"}
		})
    end
}
