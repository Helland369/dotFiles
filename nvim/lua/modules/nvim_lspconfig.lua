return {
    "neovim/nvim-lspconfig",
    dependencies = {"williamboman/mason-lspconfig.nvim"},
    lazy = false,
    config = function()
        local lspconfig = require("lspconfig")
		
		local on_attach = function (client, bufnr)
		local opts = { noremap = true, silent = true }
		local keymap = vim.api.nvim_buf_set_keymap

    -- Standard LSP keybindings
		keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
		keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
		keymap(bufnr, "n", "<leader>lc", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)  -- Code Actions
		keymap(bufnr, "n", "<leader>F", "<cmd>lua vim.lsp.buf.format()<CR>", opts)  -- Formatting
		keymap(bufnr, "n", "<leader>k", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
		keymap(bufnr, "n", "<leader>j", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
		keymap(bufnr, "n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
		keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

		end

        require("mason-lspconfig").setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
				    on_attach = on_attach,
				})
            end,
        })
		
		require("lspconfig").omnisharp.setup{
			cmd = { "/usr/bin/OmniSharp" },
			
			settings = {
				FormattingOptions = {
					EnableEditorConfigSupport = true,
					OrganozeImports = nil,
				},
				MsBuild = {
					LoadProjectsOnDemand = nil,
				},
				RoslynExtensionsOptions = {
					EnableAnalyzerSupport = nil,
					EnableImportCompletion = nil,
					AnalyzeOpenDocumentsOnlu = nil,
				},
				Sdk = {
					IncludePrereleases = true,
				},
			},
			on_attach = on_attach,
		}
    end,
}
