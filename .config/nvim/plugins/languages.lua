return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "javascript",
          "go",
          "python",
          "rust",
          "typescript",
          "css",
          "html",
          "json",
          "markdown",
          "tsx",
          "yaml",
          "toml",
        },
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
  { 'fatih/vim-go', lazy = true, ft = "go", build = ":GoInstallBinaries" },
  { 'pangloss/vim-javascript', lazy = true, ft = "javascript" },
}
