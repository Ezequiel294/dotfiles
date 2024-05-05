return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
        })
        vim.keymap.set("n", "<leader>fe", ":Neotree float filesystem toggle=true <CR>")
        vim.keymap.set("n", "<leader>bf", ":Neotree float buffers toggle=true <CR>")
        vim.keymap.set("n", "<leader>gs", ":Neotree float git_status toggle=true <CR>")
    end,
}
