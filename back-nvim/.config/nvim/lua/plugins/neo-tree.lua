return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal right<CR>')
        vim.keymap.set('n', '<C-q>', ':Neotree close<CR>')
        vim.api.nvim_set_keymap('n', '<leader>nt', ':Neotree toogle<CR>', { noremap = true, silent = true })

        require("neo-tree").setup({
            filesystem = {
                hijack_netrw_behavior = "disabled", -- "open_default", "open_current", ou "disabled"
            },
        })
    end
}
