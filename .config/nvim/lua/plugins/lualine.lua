return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "echasnovski/mini.icons" },
  opts = function(_, opts)
    require("mini.icons").mock_nvim_web_devicons()

    return opts
  end,
}
