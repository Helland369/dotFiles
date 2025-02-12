return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup()
		vim.keymap.set("n", "<leader>cc", function() require('Comment.api').toggle.linewise.current() end, { desc = "Toggle Comment" })
		vim.keymap.set("v", "<leader>cc", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle Comment (Visual)" })
    end
}
