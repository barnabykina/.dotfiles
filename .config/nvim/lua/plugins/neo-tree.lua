return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,

    keys = {
      {
        "<C-n>",
        "<cmd>Neotree reveal toggle<CR>",
        desc = "Toggle Neo-tree and reveal current file",
      },
      {
        "<leader>nf",
        function()
          if vim.bo.filetype == "neo-tree" then
            vim.cmd("wincmd p")
          else
            vim.cmd("Neotree focus")
          end
        end,
        desc = "Toggle focus between Neo-Tree and previous window",
      },
    },
  },
}
