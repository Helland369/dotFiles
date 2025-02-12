return {
    "MunifTanjim/prettier.nvim",
    config = function ()
		local prettier = require("prettier")

    	prettier.setup({
            bin = "prettier",
     			filetypes = {
						"css",
						"javascript",
						"typescript",
						"vue",
						"html",
						"json",
				    },
				})

		    -- auto format on save
            vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = {"*.js", "*.ts", "*.vue", "*.css", "*.html", "*.json"},
				    callback = function ()
						vim.cmd("Prettier")
				end,
				})
    end,
}
