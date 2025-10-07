return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },

      servers = {
        clangd = {},
      },

      setup = {
        clangd = function(_, opts)
          opts.cmd = {
            "clangd",
            "-j=3",
            "--clang-tidy",
            -- OBSOLETE "--clang-tidy-checks=*",
            "--completion-style=detailed",
            "--background-index",
            "--background-index-priority=low",
            "--header-insertion=never",
            "--enable-config",
          }
          -- return true if you don't want this server to be setup with lspconfig
          -- return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },
}
