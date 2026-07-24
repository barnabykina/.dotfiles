return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master", -- Stick to the legacy branch
  lazy = false, -- Treesitter must be loaded at startup
  build = ":TSUpdate", -- Auto-updates parsers when the plugin updates
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      -- Specify parsers to always have installed
      ensure_installed = { "lua", "vim", "vimdoc", "query", "javascript", "typescript", "python" },
      highlight = { enable = true },
      
      -- Automatically install missing parsers when entering a buffer
      auto_install = true, 
    })

    -- Enable native Neovim treesitter features globally
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        -- Start native syntax highlighting if a parser is available
        local buf = vim.api.nvim_get_current_buf()
        local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
        if lang and vim.treesitter.language.add(lang) then
          vim.treesitter.start(buf)
        end
        
        -- Enable treesitter code folding
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldlevel = 99
      end,
    })
  end,
}
