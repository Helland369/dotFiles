return {
    "nvim-telescope/telescope.nvim",
	dependencies = {"nvim-lua/plenary.nvim"},
    config = function ()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
		telescope.setup()
		-- telescope leader keys
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
        vim.keymap.set("n", "<leader>bi", builtin.buffers, { desc = "List Buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
    end
}
