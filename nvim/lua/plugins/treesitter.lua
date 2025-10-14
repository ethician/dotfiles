return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "c", "cpp" },
    highlight = {
      enable = true,
      -- disable = { "c", "cpp" },
    },
  },
}
